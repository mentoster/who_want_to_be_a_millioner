import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:who_want_to_be_a_millioner/app/controllers/setname_controller.dart';
import 'package:who_want_to_be_a_millioner/app/ui/pages/setname_page/setname_page.dart';
import 'package:get/get.dart';

void main() {
  testWidgets('setname page test space name', (tester) async {
    // arrange
    // Create the widget by telling the tester to build it.
    Get.put(SetnameController());
    final SetnameController c = SetnameController();
    await tester.pumpWidget(const MediaQuery(
        data: MediaQueryData(), child: GetMaterialApp(home: SetNamePage())));
    // act
    final titleFinder = find.byType(ElevatedButton);
    await tester.tap(titleFinder);
    // assert
    expect(c.isValid, false);
  });
  testWidgets('setname page test many name', (tester) async {
    // arrange
    // Create the widget by telling the tester to build it.
    Get.put(SetnameController());
    final SetnameController c = SetnameController();
    await tester.pumpWidget(const MediaQuery(
        data: MediaQueryData(), child: GetMaterialApp(home: SetNamePage())));
    // act
    final titleFinder = find.byType(ElevatedButton);
    await tester.tap(titleFinder);
    // assert
    expect(c.isValid, false);
  });
}
