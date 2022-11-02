import 'package:dartz/dartz.dart';
import 'package:task_basalt/core/exception/custom_exceptoin.dart';
import 'package:task_basalt/features/stock_market_home/domain/entities/stock.market_entity_request.dart';

abstract class StockMarketRepository {
  Future<Either<CustomException, List<StockMarketEntity>>> fetchData({required String symbol});
}
