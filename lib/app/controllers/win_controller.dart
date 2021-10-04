import 'package:get/get.dart';
import 'package:who_want_to_be_a_millioner/app/routes/app_pages.dart';

class WinController extends GetxController {
  var scores = 0.obs;
  var rang = "Вы никто для димы";
  void init() {
    if (Get.parameters['scores'] != null) {
      scores.value = int.parse(Get.parameters['scores']!);
      rang = returnRatingName(scores.value);
    } else {
      Get.offAndToNamed(Routes.HOME);
    }
  }

  String returnRatingName(int sc) {
    if (sc > 330) {
      return "Читер";
    } else if (sc > 300) {
      return "Лучший друг";
    } else if (sc > 270) {
      return "Друг";
    } else if (sc > 270) {
      return "Товарищ";
    } else if (scores > 240) {
      return "Знакомый";
    } else if (scores > 210) {
      return "Просто слышал о Дима";
    } else if (sc > 180) {
      return "Никто";
    } else {
      return "Совсем никто";
    }
  }

  void back() {
    Get.offAndToNamed(Routes.HOME);
  }
}
