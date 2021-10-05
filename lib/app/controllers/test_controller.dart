import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:who_want_to_be_a_millioner/app/data/models/test_model.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:who_want_to_be_a_millioner/app/data/repository/rating_repository.dart';
import 'package:who_want_to_be_a_millioner/app/routes/app_pages.dart';

class TestController extends GetxController {
  /// Все данные теста.
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

  /// АПИ.
  RatingRepository rp = RatingRepository();

  /// Имя пользователя.
  late String name;

  /// Вопрос пользователю.
  var question = "".obs;

  /// Массив, который мы будем перемещивать
  var answers = ["", "", "", ""].obs;

  /// Время оставщееся до конца раунда.
  var timeNow = 30.obs;

  /// Максимальное время, которое дается игроку для ответа на вопрос.
  final maxTime = 30;

  /// Количество очков пользователя
  var scores = 0.obs;

  /// Показывает, какой сейчас номер вопроса.
  var questionNow = 0.obs;

  /// Показывать ли пользователю видео с поражением.
  var showLoseScreen = false.obs;
  bool alreadyStarted = false;

  /// Модуль воспроизведения звука
  final AudioPlayer audioPlayer = AudioPlayer(
    mode: PlayerMode.LOW_LATENCY,
  );

  /// Проверяет имя пользователя и только тогда начинает игру.
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

  /// Таймер для игрока.
  void startTimer() async {
    // while (timeNow > 0) {
    //   await Future.delayed(const Duration(seconds: 1), () {});
    //   --timeNow;
    // }
    // wrong();
  }

  /// Следующий вопрос пользователю.
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

  /// Функция, которая вызывается при не правильном вопросе.
  void wrong() async {
    showLoseScreen.value = true;
    await Future.delayed(const Duration(seconds: 6), () {});
    showLoseScreen.value = false;
    alreadyStarted = false;
    Get.offAllNamed("${Routes.LOSE}/?scores=${scores.value}");
  }

  /// Функция, которая вызывается при  правильном вопросе.
  void right() async {
    scores += timeNow.value;
    rp.addRating(name, scores.value);
    timeNow.value = maxTime;
    questionNow.value++;
    if (questionNow.value == test.length) {
      Get.offAllNamed("${Routes.WIN}/?scores=${scores.value}");
    } else {
      nextQuestion();
    }
  }
}
