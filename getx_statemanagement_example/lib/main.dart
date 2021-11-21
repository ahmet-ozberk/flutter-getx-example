import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_statemanagement_example/controller/controller.dart';

import 'ikinci_sayfa.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(title: 'Material App', home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(),
        body: Obx(() => GridView.builder(
              padding: const EdgeInsets.all(15),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.9,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15),
              itemCount: controller.product.length,
              itemBuilder: (context, index) {
                return Stack(
                  clipBehavior: Clip.none,
                  children: [
                    bosyInBody(index),
                    Obx(() => favoriteButton(index: index))
                  ],
                );
              },
            )));
  }

  Container bosyInBody(int index) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 10)],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(controller.product.value[index].imagePath)),
          const SizedBox(height: 10),
          Text(controller.product.value[index].name,
              style:
                  const TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
          Text(controller.product.value[index].price,
              style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey)),
        ],
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Text("Ana sayfa"),
      actions: [
        TextButton(
            onPressed: () {
              controller.addProduct();
            },
            child: const Icon(
              Icons.add_box,
              color: Colors.white,
            )),
      ],
      leading: TextButton(
          onPressed: () {
            Get.to(IkinciSayfa());
          },
          child: const Icon(
            Icons.chevron_right,
            color: Colors.white,
          )),
    );
  }

  Widget favoriteButton({required int index}) {
    return Positioned(
      right: -5,
      top: -10,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          controller.changeFavorite(index: index);
        },
        child: Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                  color: controller.product.value[index].favorite.value
                      ? Colors.green
                      : Colors.grey.shade300,
                  width: 3)),
          child: Center(
            child: Icon(
                controller.product.value[index].favorite.value
                    ? Icons.favorite
                    : Icons.favorite_border,
                color: controller.product.value[index].favorite.value
                    ? Colors.green
                    : Colors.grey.shade300),
          ),
        ),
      ),
    );
  }
}
