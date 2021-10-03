import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:who_want_to_be_a_millioner/app/data/models/test_model.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:who_want_to_be_a_millioner/app/routes/app_pages.dart';

class TestController extends GetxController {
  var test = [
    TestModel(
        question: "Любимая игры Димы?",
        answer1: "Овервотч",
        answer2: "Vs code",
        answer3: "Гаррис мод",
        rightAnswer: "Тим фортресс 2"),
    TestModel(
        question: "Сколько Диме лет?",
        answer1: "21",
        answer2: "18",
        answer3: "19",
        rightAnswer: "20"),
    TestModel(
        question: "Димина любимая еда в вузе это -",
        answer1: "Тостер",
        answer2: "Шаурма",
        answer3: "Кофе из лабы",
        rightAnswer: "Пицца"),
    TestModel(
        question: "Больше всего Дима не любит в 3 семестре предмет...",
        answer1: "Circular",
        answer2: "Цирко",
        answer3: "Киско",
        rightAnswer: "Циско"),
    TestModel(
        question: "Какой линукс стоит у Димы на ноутбуке?",
        answer1: "Astra Linux",
        answer2: "Arch Linux",
        answer3: "Manjaro XFCE",
        rightAnswer: "Manjaro KDE"),
    TestModel(
        question: "Дима преподает предмет, какой?",
        answer1: "Unity разработка",
        answer2: "Flutter разработка",
        answer3: "Не преподает, он ленивый",
        rightAnswer: "Виртуальная реальность"),
    TestModel(
        question:
            "В 2015 Дима танцевал на дискотеке в школе, начался медленный танец, назовите имя девочки, которую Дима пригласил потенцевать",
        answer1: "Катя",
        answer2: "Кристина",
        answer3: "Ты прикалываешься?",
        rightAnswer: "Аня"),
    TestModel(
        question: "Какой язык программирования Дима обожает?",
        answer1: "Dart",
        answer2: "C#",
        answer3: "Python",
        rightAnswer: "Все хороши"),
    TestModel(
        question: "Какой язык программирования Дима обожает?",
        answer1: "Dart",
        answer2: "C#",
        answer3: "Python",
        rightAnswer: "Все хороши"),
    TestModel(
        question: "Тест на удачу",
        answer1: "15156",
        answer2: "4145",
        answer3: "Петя",
        rightAnswer: "14551"),
    TestModel(
        question: "У Димы есть  беседа с друзьями, как она называется?",
        answer1: "ИКБО-02-19",
        answer2: "Собутыльники",
        answer3: "Друзья",
        rightAnswer: "L (Персонаж из аниме)"),
    TestModel(
        question: "Любимый фильм Димы",
        answer1: "Мстители финал",
        answer2: "Аватар",
        answer3: "Аниме Твое Имя",
        rightAnswer: "Форрест Гамп")
  ];
  late String name;
  var question = "".obs;
  var answers = ["", "", "", ""].obs;
  var timeNow = 30.obs;
  final maxTime = 30;
  var scores = 0.obs;
  var questionNow = 0.obs;
  bool alreadyStarted = false;
  final AudioPlayer audioPlayer = AudioPlayer(
    mode: PlayerMode.LOW_LATENCY,
  );
  void init() async {
    if (Get.parameters['name'] != null) {
      name = Get.parameters['name']!;
      if (!alreadyStarted) {
        test.shuffle();
        nextQuestion();
        alreadyStarted = true;
        startTimer();
        await audioPlayer.play("assets/sounds/start.mp3", isLocal: true);
      }
    } else {
      Get.defaultDialog(
        title: "Ошибка",
        content: const Text(
          "У вас нет имени",
        ),
        onConfirm: () => Get.toNamed("/"),
      );
    }
  }

  void startTimer() async {
    while (timeNow > 0) {
      await Future.delayed(const Duration(seconds: 1), () {});
      --timeNow;
    }
    wrong();
  }

  void nextQuestion() async {
    await audioPlayer.play("assets/sounds/victory.mp3", isLocal: true);
    question.value = test[questionNow.value].question;
    answers[0] = test[questionNow.value].rightAnswer;
    answers[1] = test[questionNow.value].answer1;
    answers[2] = test[questionNow.value].answer2;
    answers[3] = test[questionNow.value].answer3;
    answers.shuffle();
    update();
  }

  void checkAnswer(String answer) {
    if (answer == test[questionNow.value].rightAnswer) {
      right();
    } else {
      wrong();
    }
  }

  void wrong() async {
    Get.toNamed("${Routes.LOSE}");
  }

  void right() async {
    scores += timeNow.value;
    timeNow.value = maxTime;
    questionNow.value++;
    if (questionNow.value == test.length) {
      questionNow.value--;
    } else {
      nextQuestion();
    }
  }

  void goToResultPage() {}
  void writeRecord() {}
}
