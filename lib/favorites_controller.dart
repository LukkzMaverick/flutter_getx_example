import 'package:get/get.dart';

class FavoritesController extends GetController {
  static FavoritesController get to => Get.find();

  List<int> _itens = [];

  void toggle(int e) {
    if (isChecked(e)) {
      _itens.removeWhere((i) => i == e);
    } else {
      _itens.add(e);
    }
    update();
  }

  bool isChecked(int i) => _itens.contains(i);

  int itemAt(int i) => _itens[i];

  void removeAt(int i) {
    _itens.removeAt(i);
    update();
  }

  int get count => _itens.length;
}
