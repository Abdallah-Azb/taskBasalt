import 'package:dartz/dartz.dart';
import 'package:task_basalt/core/exception/custom_exceptoin.dart';
import 'package:task_basalt/core/network_services/check_internet.dart';
import 'package:task_basalt/features/stock_market_home/data/data_sources/remote/stock.market_remote_date_source.dart';
import 'package:task_basalt/features/stock_market_home/domain/entities/stock.market_entity_request.dart';
import 'package:task_basalt/features/stock_market_home/domain/repositories/stock.market_repositories.dart';

class StockMarketRepositoryImp implements StockMarketRepository {
  final StockMarketRemoteDateSource remoteDateSource;

  StockMarketRepositoryImp({required this.remoteDateSource});

  @override
  Future<Either<CustomException, List<StockMarketEntity>>> fetchData({required String symbol}) async {
    if (await checkConnectionInternet()) {
      try {
        return await remoteDateSource.fetchData(symbol: symbol);
      } catch (e) {
        return Left(CustomException(e.toString()));
      }
    } else {
      return Left(CustomException('No internet'));
    }
  }
}
