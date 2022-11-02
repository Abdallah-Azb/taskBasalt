class CompanyEntity {
  CompanyEntity({
    this.name,
    this.symbol,
    this.hasIntraday,
    this.hasEod,
    this.country,
    this.stockExchange,
  });

  String? name;
  String? symbol;
  bool? hasIntraday;
  bool? hasEod;
  String? country;
  StockExchangeEntity? stockExchange;
}

class StockExchangeEntity {
  StockExchangeEntity({
    this.name,
    this.acronym,
    this.mic,
    this.country,
    this.countryCode,
    this.city,
    this.website,
  });

  String? name;
  String? acronym;
  String? mic;
  String? country;
  String? countryCode;
  String? city;
  String? website;
}
