import 'package:get/get.dart';
import 'package:who_want_to_be_a_millioner/app/data/models/leaderborad.dart';
import 'package:who_want_to_be_a_millioner/app/data/repository/rating_repository.dart';
import 'package:who_want_to_be_a_millioner/app/routes/app_pages.dart';

class HomeController extends GetxController {
  RatingRepository rp = RatingRepository();
  void init() {}

  /// Возвращает количество очков из апи.
  Future<Rating> getScores() async {
    return await rp.getScores();
  }

  /// Начинает игру, переходя на экран ввода имени.
  void start() {
    Get.toNamed(Routes.LOGIN);
  }
}
