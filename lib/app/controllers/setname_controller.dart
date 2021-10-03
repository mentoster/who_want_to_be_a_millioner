import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:who_want_to_be_a_millioner/app/routes/app_pages.dart';

class SetnameController extends GetxController {
  var isValid = false;
  var errorText = "Пусто";
  var nickname = "none";
  void start() {
    if (!isValid) {
      Get.defaultDialog(
        title: "Ошибка",
        content: Text(
          errorText,
        ),
        onConfirm: () => Get.back(),
      );
    } else {
      Get.toNamed("${Routes.TEST}?name=$nickname");
    }
  }
}
