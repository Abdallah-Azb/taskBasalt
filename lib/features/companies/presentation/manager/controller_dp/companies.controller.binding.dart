import 'package:get/get.dart';
import 'package:task_basalt/core/injection/app_injection.dart';
import 'package:task_basalt/features/companies/presentation/manager/companies_controller.dart';

class CompaniesControllerBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<StockMarketController>(
    //   () => StockMarketController(repository: commonInjections()),
    // );
    Get.put(CompaniesController(repository: commonInjections()));
  }
}
