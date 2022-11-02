import 'package:get/get.dart';
import 'package:task_basalt/features/companies/presentation/manager/controller_dp/companies.controller.binding.dart';
import 'package:task_basalt/features/companies/presentation/pages/companies_screen.dart';
import 'package:task_basalt/features/stock_market_home/presentation/manager/controller_dp/stock_market.controller.binding.dart';
import 'package:task_basalt/features/stock_market_home/presentation/pages/stock_market_screen.dart';
import 'routes.dart';

class Nav {
  static List<GetPage> routes = [
    //
    GetPage(
      name: Routes.CompaniesHome,
      page: () => const CompaniesScreen(),
      binding: CompaniesControllerBinding(),
    ),
    //
    GetPage(
      name: Routes.StockMarket,
      page: () => StockMarketScreen(),
      binding: StockMarketControllerBinding(),
      // arguments: Get.arguments as String
    ),
  ];
}
