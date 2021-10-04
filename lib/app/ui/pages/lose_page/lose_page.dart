import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/lose_controller.dart';

class LosePage extends GetView<LoseController> {
  const LosePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.init();
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Image.asset("assets/images/cover.jpg",
              fit: BoxFit.cover, height: size.height, width: size.width),
          Column(children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 64),
              child: Center(
                  child: Text(
                "Вы не знаете Диму =(",
                style:
                    TextStyle(fontSize: size.width / 20, color: Colors.white),
              )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 64),
              child: Center(
                  child: Text(
                "Ваш рекорд: ${controller.scores}",
                style:
                    TextStyle(fontSize: size.width / 20, color: Colors.white),
              )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ))),
                onPressed: () => controller.back(),
                child: Text(
                  'Вернутся назад',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: size.width / 40,
                  ),
                ),
              ),
            ),
          ])
        ]),
      ),
    );
  }
}
