
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/setname_controller.dart';


class SetnamePage extends GetView<SetnameController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SetnamePage'),
      ),
      body: SafeArea(
        child: Text('SetnameController'),
      ),
    );
  }
}
  