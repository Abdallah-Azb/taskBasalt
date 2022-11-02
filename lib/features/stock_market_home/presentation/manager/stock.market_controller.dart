import 'package:get/get.dart';
import 'package:task_basalt/features/stock_market_home/domain/entities/stock.market_entity_request.dart';
import 'package:task_basalt/features/stock_market_home/domain/repositories/stock.market_repositories.dart';
import 'package:task_basalt/widgets/snackbar/snackbar_app.dart';

class StockMarketController extends GetxController {
  final StockMarketRepository repository;

  StockMarketController({required this.repository});

  @override
  void onClose() {}

  bool loading = false;

  updateLoading(bool val) {
    loading = val;
    update();
  }

  //
  bool hasError = false;

  updateHasError(bool val) {
    hasError = val;
    update();
    //
  }

  List<StockMarketEntity> stockMarketList = [];

  //
  fetchDataStockMarket({required String symbol}) async {
    updateLoading(true);
    updateHasError(false);
    try {
      final response = await repository.fetchData(symbol: symbol);
      response.fold((l) {
        AppSnackBar().error(message: l.cause.toString(), title: l.response.toString());
        print(l.response!.data.toString());
        updateHasError(true);

        //  return null;
      }, (r) {
        stockMarketList.addAll(r);
        update();
        // AppSnackBar().success(title: r[0].date.toString(), message: r[0].exchange.toString());
      });
    } catch (e) {
      AppSnackBar().error(title: 'Exception ', message: e.toString());
      updateHasError(true);
    }
    updateLoading(false);
  }
}
