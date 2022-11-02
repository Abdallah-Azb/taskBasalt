import 'package:get_it/get_it.dart';
import 'package:task_basalt/features/stock_market_home/data/data_sources/remote/stock.market_remote_date_source.dart';
import 'package:task_basalt/features/stock_market_home/data/data_sources/remote/stock.market_remote_date_source_imp.dart';
import 'package:task_basalt/features/stock_market_home/domain/repositories/stock.market_repositories.dart';
import 'package:task_basalt/features/stock_market_home/domain/repositories/stock.market_repositories_imp.dart';
import 'presentation/manager/stock.market_controller.dart';

GetIt injectLogin = GetIt.instance;

Future<void> init() async {
  injectLogin.registerFactory(
    () => StockMarketController(
      repository: injectLogin(),
    ),
  );

  injectLogin.registerLazySingleton<StockMarketRepository>(
    () => StockMarketRepositoryImp(remoteDateSource: injectLogin()),
  );

  injectLogin.registerLazySingleton<StockMarketRemoteDateSource>(() => StockMarketRemoteDateSourceImp());

  // injectLogin.registerLazySingleton<LoginControllerBinding>(() => LoginControllerBinding());
}
