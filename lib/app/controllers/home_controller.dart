import 'package:get/get.dart';
import 'package:who_want_to_be_a_millioner/app/data/models/leaderborad.dart';
import 'package:who_want_to_be_a_millioner/app/data/repository/rating_repository.dart';
import 'package:who_want_to_be_a_millioner/app/routes/app_pages.dart';

class HomeController extends GetxController {
  RatingRepository rp = RatingRepository();
  void init() {}

  Future<Rating> getScores() async {
    return await rp.getScores();
  }

  void start() {
    Get.toNamed(Routes.LOGIN);
  }
}
