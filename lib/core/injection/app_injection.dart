// package
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

// feature injection

import '../../features/stock_market_home/stock.market_inject.dart' as stock_inject;
import '../../features/companies/companies.market_inject.dart' as companies_inject;

//
GetIt commonInjections = GetIt.instance;

Future<void> init() async {
  commonInjections.registerLazySingleton(() => Dio());

  // Features
  stock_inject.init();
  companies_inject.init();
}
