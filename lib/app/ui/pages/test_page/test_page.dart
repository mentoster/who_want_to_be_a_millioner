import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/test_controller.dart';

class TestPage extends GetView<TestController> {
  const TestPage({Key? key}) : super(key: key);

  final testStyle = const TextStyle(color: Colors.white, fontSize: 24);
  @override
  Widget build(BuildContext context) {
    controller.init();
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset("assets/images/cover.jpg",
                fit: BoxFit.cover, height: size.height, width: size.width),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(() => Text(
                            "Осталось времени:\n ${controller.timeNow}",
                            style: testStyle,
                          )),
                      Obx(() => Text(
                            "Вопрос:\n ${controller.questionNow} из ${controller.test.length}",
                            style: testStyle,
                          ))
                    ],
                  ),
                ),
                Column(
                  children: [
                    Center(
                      child: Container(
                        width: size.width / 1.1,
                        decoration: BoxDecoration(
                            color: Colors.blue[800],
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20))),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Obx(() => Text(
                                  controller.question.value,
                                  style: testStyle,
                                )),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [answer(1, size), answer(2, size)],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [answer(3, size), answer(4, size)],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget answer(int number, Size size) {
    return Flexible(
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(
            () => InkWell(
              onTap: () =>
                  controller.checkAnswer(controller.answers[number - 1]),
              child: Container(
                width: size.width / 2.3,
                decoration: BoxDecoration(
                    color: Colors.blue[800],
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
                child: Center(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(
                          "$number. ",
                          style: testStyle,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            controller.answers[number - 1],
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
