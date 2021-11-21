import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_statemanagement_example/controller/controller.dart';

class IkinciSayfa extends StatelessWidget {
  Controller _controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("İkinci Sayfa"),
        actions: [
          TextButton(
              onPressed: () {
                _controller.addProduct();
                Get.snackbar("İşlem Başarılı", "Ürün Eklendi.",
                    backgroundColor: Colors.green, colorText: Colors.white);
              },
              child: const Icon(
                Icons.add_box,
                color: Colors.white,
              )),
        ],
      ),
      body: Center(
          child: Obx(() => Text(
                "Favoriye eklenen eleman sayısı: ${_controller.product.length}",
                style: TextStyle(fontSize: 20),
              ))),
    );
  }
}
