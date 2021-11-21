import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:getx_statemanagement_example/model/anasayfa_model.dart';

class Controller extends GetxController {
  RxList<AnasayfaModel> product = <AnasayfaModel>[].obs;
  @override
  void onInit() {
    super.onInit();
    for (var i = 0; i < 4; i++) {
      product.add(AnasayfaModel(
          imagePath: "https://picsum.photos/200/150",
          name: "Bir Ürün $i",
          price: "${32.99 + i} ₺",
          favorite: false.obs));
    }
  }

  changeFavorite({required int index}) {
    product.value[index].favorite.value = !product.value[index].favorite.value;
    update();
  }

  addProduct(){
    product.add(AnasayfaModel(
          imagePath: "https://picsum.photos/200/150",
          name: "Yeni Eklenen Ürün",
          price: "${49.99} ₺",
          favorite: false.obs));
  }
}
