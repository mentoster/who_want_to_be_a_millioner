import 'package:who_want_to_be_a_millioner/app/data/models/leaderborad.dart';
import 'package:who_want_to_be_a_millioner/app/data/models/user_rating_api/user_rating.dart';
import 'package:who_want_to_be_a_millioner/app/data/provider/rating_api.dart';

class RatingRepository {
  RatingApi api = RatingApi();

  void addRating(String name, int scores) {
    api.addRating(name, scores);
  }

  Future<Rating> getScores() async {
    return parseResult(await api.getScores());
  }

  Rating parseResult(json) {
    var a = UserRating.fromJson(json);
    List<RatingPlace> rp = [];
    for (var place in a.dreamlo!.leaderboard!.entry!) {
      rp.add(RatingPlace(name: place.name!, scores: place.score!));
    }
    var lb = Rating(rp: rp);
    return lb;
  }
}
