import 'package:flutter_test/flutter_test.dart';
import 'package:who_want_to_be_a_millioner/app/controllers/win_controller.dart';

void main() {
  // testWidgets('Test rang name for -100,0,100,300,400,5000', (tester) async {
  //   // arrange
  //   final wc = WinController();
  //   // act
  //   var result = wc.returnRatingName(300);
  //   // assert
  //   expect(result, "Совсем никто");
  // });
  test(
    'Test rang name for 300 ',
    () async {
      // arrange
      final wc = WinController();
      // act
      var result =  wc.returnRatingName(300);
      // assert
      expect(result, "Друг");
    },
  );
  test(
    'Test rang name for -100 ',
    () async {
      // arrange
      final wc = WinController();
      // act
      var result =  wc.returnRatingName(-100);
      // assert
      expect(result, "Совсем никто");
    },
  );
  test(
    'Test rang name for 310 ',
    () async {
      // arrange
      final wc = WinController();
      // act
      var result =  wc.returnRatingName(310);
      // assert
      expect(result, "Лучший друг");
    },
  );
  test(
    'Test rang name for 5000000 ',
    () async {
      // arrange
      final wc = WinController();
      // act
      var result =  wc.returnRatingName(5000000);
      // assert
      expect(result, "Читер");
    },
  );
}
