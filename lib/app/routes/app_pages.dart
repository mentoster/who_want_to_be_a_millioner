import 'package:get/get.dart';
import 'package:who_want_to_be_a_millioner/app/bindings/home_binding.dart';
import 'package:who_want_to_be_a_millioner/app/bindings/setname_binding.dart';
import 'package:who_want_to_be_a_millioner/app/bindings/test_binding.dart';
import 'package:who_want_to_be_a_millioner/app/ui/pages/home_page/home_page.dart';
import 'package:who_want_to_be_a_millioner/app/ui/pages/setname_page/setname_page.dart';
import 'package:who_want_to_be_a_millioner/app/ui/pages/test_page/test_page.dart';
import 'package:who_want_to_be_a_millioner/app/ui/pages/video_page/video_page.dart';
part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
        name: Routes.INITIAL,
        page: () => const HomePage(),
        binding: HomeBinding()),
    GetPage(
        name: Routes.LOGIN,
        page: () => const SetNamePage(),
        binding: SetnameBinding()),
    GetPage(
        name: Routes.TEST,
        page: () => const TestPage(),
        binding: TestBinding()),
    GetPage(name: Routes.LOSE, page: () => VideoPage())
  ];
}
