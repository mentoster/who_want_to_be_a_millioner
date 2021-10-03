import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Stack(children: [
          Image.asset("assets/images/cover.jpg",
              fit: BoxFit.cover, height: size.height, width: size.width),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 64),
                child: Center(
                    child: Text(
                  "Кто хочет стать другом Димы?",
                  style:
                      TextStyle(fontSize: size.width / 20, color: Colors.white),
                )),
              ),
              Row(
                children: [
                  const Expanded(
                    flex: 3, // takes 30% of available width
                    child: SizedBox(),
                  ),
                  Expanded(
                    flex: 6,
                    child: Container(
                      color: Colors.blue[700],
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Таблица лучших друзей Димы",
                              style: TextStyle(
                                  fontSize: size.width / 40,
                                  color: Colors.white),
                            ),
                          ),
                          const Divider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text("Имя",
                                    style: TextStyle(color: Colors.white)),
                                Text("Количество очков",
                                    style: TextStyle(color: Colors.white)),
                              ],
                            ),
                          ),
                          const Divider(),
                        ],
                      ),
                    ),
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
                    'Начать игру  ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: size.width / 40,
                    ),
                  ),
                ),
              ),
            ],
          )
        ])),
      ),
    );
  }
}
