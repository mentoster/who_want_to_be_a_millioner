
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/result_controller.dart';


class ResultPage extends GetView<ResultController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ResultPage'),
      ),
      body: SafeArea(
        child: Text('ResultController'),
      ),
    );
  }
}
  