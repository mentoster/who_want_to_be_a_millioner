import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SetnameController extends GetxController {
  var isValid = false;
  var errorText = "Пусто";
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
      Get.toNamed("setname");
    }
  }
}
