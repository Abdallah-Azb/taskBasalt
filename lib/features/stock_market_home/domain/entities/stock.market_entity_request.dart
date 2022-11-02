class StockMarketEntity {
  StockMarketEntity({
    this.open,
    this.high,
    this.low,
    this.close,
    this.volume,
    this.adjHigh,
    this.adjLow,
    this.adjClose,
    this.adjOpen,
    this.adjVolume,
    this.splitFactor,
    this.dividend,
    this.symbol,
    this.exchange,
    this.date,
  });

  double? open;
  double? high;
  double? low;
  double? close;
  double? volume;
  double? adjHigh;
  double? adjLow;
  double? adjClose;
  double? adjOpen;
  double? adjVolume;
  double? splitFactor;
  double? dividend;
  String? symbol;
  String? exchange;
  String? date;
}
