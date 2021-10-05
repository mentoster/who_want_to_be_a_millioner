import 'package:get/get.dart';
import 'package:who_want_to_be_a_millioner/app/routes/app_pages.dart';

class LoseController extends GetxController {
  var scores = 0.obs;

  /// Иницилизация контроллера, он сохраняет очки из url и показывает их пользователю
  void init() {
    if (Get.parameters['scores'] != null) {
      scores.value = int.parse(Get.parameters['scores']!);
    } else {
      Get.offAndToNamed(Routes.HOME);
    }
  }

  /// Возвращает пользователя на стартувую страничку
  void back() {
    Get.offAndToNamed(Routes.HOME);
  }
}
