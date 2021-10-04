import 'package:get/get.dart';
import 'package:who_want_to_be_a_millioner/app/routes/app_pages.dart';

class WinController extends GetxController {
  var scores = 0.obs;
  var rang = "Вы никто для димы";
  void init() {
    if (Get.parameters['scores'] != null) {
      scores.value = int.parse(Get.parameters['scores']!);
      if (scores > 330) {
        rang = "Читер";
      } else if (scores > 300) {
        rang = "Лучший друг";
      } else if (scores > 270) {
        rang = "Друг";
      } else if (scores > 270) {
        rang = "Товарищ";
      } else if (scores > 240) {
        rang = "Знакомый";
      } else if (scores > 210) {
        rang = "Просто слышал о Дима";
      } else if (scores > 180) {
        rang = "Никто";
      }
    } else {
      Get.offAndToNamed(Routes.HOME);
    }
  }

  void back() {
    Get.offAndToNamed(Routes.HOME);
  }
}
