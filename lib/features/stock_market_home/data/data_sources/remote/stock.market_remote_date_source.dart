import 'package:dartz/dartz.dart';
import 'package:task_basalt/core/exception/custom_exceptoin.dart';
import 'package:task_basalt/features/stock_market_home/data/models/stock.market_model.dart';

abstract class StockMarketRemoteDateSource {

  Future<Either<CustomException, List<StockMarketModel>>> fetchData({required String symbol});

}
