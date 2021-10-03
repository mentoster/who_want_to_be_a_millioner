import 'package:get/get.dart';
import 'package:who_want_to_be_a_millioner/app/ui/pages/home_page/home_page.dart';
part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
    )
  ];
}
