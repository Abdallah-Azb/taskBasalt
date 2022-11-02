
import 'package:task_basalt/features/companies/domain/entities/company_entity.dart';

class CompanyModel extends CompanyEntity {
  CompanyModel(
      {required super.name,
      required super.symbol,
      required super.hasIntraday,
      required super.hasEod,
      required super.country,
      required super.stockExchange});

  CompanyModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    symbol = json['symbol'];
    hasIntraday = json['has_intraday'];
    hasEod = json['has_eod'];
    country = null;
    stockExchange = StockExchangeModel.fromJson(json['stock_exchange']);
  }
}

class StockExchangeModel extends StockExchangeEntity {
  StockExchangeModel(
      {required super.name,
      required super.acronym,
      required super.mic,
      required super.country,
      required super.countryCode,
      required super.city,
      required super.website});

  StockExchangeModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    acronym = json['acronym'];
    mic = json['mic'];
    country = json['country'];
    countryCode = json['country_code'];
    city = json['city'];
    website = json['website'];
  }
}
