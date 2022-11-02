import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:task_basalt/core/exception/custom_exceptoin.dart';
import 'package:task_basalt/core/network_services/app_apis.dart';
import 'package:task_basalt/core/network_services/dio_helper.dart';
import 'package:task_basalt/core/network_services/response_model.dart';
import 'package:task_basalt/features/stock_market_home/data/data_sources/remote/stock.market_remote_date_source.dart';
import 'package:task_basalt/features/stock_market_home/data/models/stock.market_model.dart';

class StockMarketRemoteDateSourceImp implements StockMarketRemoteDateSource {
  final ApiBaseHelper clint = ApiBaseHelper();

  final String _serverUrl = AppApi.stockMarket;

  @override
  Future<Either<CustomException, List<StockMarketModel>>> fetchData({required String symbol}) async {
    List<StockMarketModel> responseDate = [];

    CustomResponse response = await clint.getHTTP('$_serverUrl=$symbol'

    );

    if (response.success == true || response.statusCode == 200) {
      var _d = json.decode(response.response.toString());
      responseDate = List.from(_d['data']).map((e) => StockMarketModel.fromJson(e)).toList();

      return Right(responseDate);
    } else {
      return Left(CustomException(response.response.data.toString(), response: response.response));
    }
  }
}
