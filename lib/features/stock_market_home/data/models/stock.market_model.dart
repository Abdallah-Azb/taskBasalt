import 'package:task_basalt/features/stock_market_home/domain/entities/stock.market_entity_request.dart';

class StockMarketModel extends StockMarketEntity {
  StockMarketModel(
      {super.open,
      super.high,
      super.low,
      super.close,
      super.volume,
      super.adjHigh,
      super.adjLow,
      super.adjClose,
      super.adjOpen,
      super.adjVolume,
      super.splitFactor,
      super.dividend,
      super.symbol,
      super.exchange,
      super.date});

  StockMarketModel.fromJson(Map<String, dynamic> json) {
    open = json['open'];
    high = json['high'];
    low = json['low'];
    close = json['close'];
    volume = json['volume'];
    adjHigh = json['adj_high'];
    adjLow = json['adj_low'];
    adjClose = json['adj_close'];
    adjOpen = json['adj_open'];
    adjVolume = json['adj_volume'];
    splitFactor = json['split_factor'];
    dividend = json['dividend'];
    symbol = json['symbol'];
    exchange = json['exchange'];
    date = json['date'];
  }
}
