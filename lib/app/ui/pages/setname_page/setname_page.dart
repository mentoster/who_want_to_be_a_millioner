import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/setname_controller.dart';

class SetNamePage extends GetView<SetnameController> {
  const SetNamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Image.asset("assets/images/cover.jpg",
              fit: BoxFit.cover, height: size.height, width: size.width),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  const Expanded(
                    flex: 3, // takes 30% of available width
                    child: SizedBox(
                      width: 0,
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Column(
                          children: [
                            const Text("Введите своё имя"),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (String? value) {
                                  if (GetUtils.isNullOrBlank(value!)!) {
                                    controller.isValid = false;
                                    controller.errorText = "Пустое поле";
                                    return "Не может быть пустым";
                                  } else if (value.length > 15) {
                                    controller.isValid = false;
                                    controller.errorText =
                                        "Слишком длинное имя";
                                    return "Слишком длинное имя";
                                  } else {
                                    controller.nickname = value;
                                    controller.isValid = true;
                                    return null;
                                  }
                                },
                              ),
                            ),
                          ],
                        )),
                  ),
                  const Expanded(
                    flex: 3, // takes 30% of available width
                    child: SizedBox(
                      width: 0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ))),
                  onPressed: () => controller.start(),
                  child: Text(
                    'Скорее задай мне вопросы',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: size.width / 40,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
