import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/test_controller.dart';

class TestPage extends GetView<TestController> {
  final String userName;
  const TestPage(this.userName, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset("assets/images/cover.jpg",
                fit: BoxFit.cover, height: size.height, width: size.width),
          ],
        ),
      ),
    );
  }
}
