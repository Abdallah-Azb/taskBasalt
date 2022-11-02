import 'package:get/get.dart';
import 'package:task_basalt/core/injection/app_injection.dart';
import 'package:task_basalt/features/stock_market_home/presentation/manager/stock.market_controller.dart';

class StockMarketControllerBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<StockMarketController>(
    //   () => StockMarketController(repository: commonInjections()),
    // );
    Get.put(StockMarketController(repository: commonInjections()));
  }
}
