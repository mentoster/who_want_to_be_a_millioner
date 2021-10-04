
import 'package:get/get.dart';

class RatingApi extends GetConnect {
  Future<Response> addRating(String name, int scores) => get(
      'http://dreamlo.com/lb/N1mDw37yjk-6WbomM8wXQQoLSIgnCU8UixGVQfnapB7A/add/$name/$scores');

  Future<dynamic> getScores() async {
    final res = await get('http://dreamlo.com/lb/6159dcf98f40bb0e28847934/json',
        headers: {"Accept": "aplication/json"});
    return res.body;
  }
}
