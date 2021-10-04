import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:who_want_to_be_a_millioner/app/data/repository/rating_repository.dart';

void main() {
  test(
    'rating repository test parsing json',
    () async {
      // arrange
      var mapJson = json.decode(
          """{"dreamlo":{"leaderboard":{"entry":[{"name":"Dmitry","score":"1000","seconds":"0","text":"","date":"10/4/2021 7:41:12 AM"},{"name":"Димин ботинок","score":"331","seconds":"0","text":"","date":"10/4/2021 8:08:31 AM"},{"name":"Тестировщик","score":"140","seconds":"0","text":"","date":"10/4/2021 7:41:28 AM"},{"name":"ЧухяХуа","score":"34","seconds":"0","text":"","date":"10/4/2021 8:00:03 AM"},{"name":"Кросовчек","score":"28","seconds":"0","text":"","date":"10/4/2021 8:03:26 AM"}]}}}""");
      var c = RatingRepository();
      // act
      var parsedData = c.parseResult(mapJson);
      var name = parsedData.rp[0].name;
      // assert
      expect(name, "Dmitry");
    },
  );
}
