class StockQuote {
  final String symbol;
  final String name;

  final double price;
  final double changesPercentage;
  final double change;
  final double dayLow;
  final double dayHigh;
  final double yearHigh;
  final double yearLow;
  final double marketCap;

  final int volume;
  final int avgVolume;

  final double open;
  final double previousClose;
  final double eps;
  final double pe;
  
  final int sharesOutstanding;

  StockQuote({
    this.symbol,
    this.name,
    this.price,
    this.changesPercentage,
    this.change,
    this.dayLow,
    this.dayHigh,
    this.yearHigh,
    this.yearLow,
    this.marketCap,
    this.volume,
    this.avgVolume,
    this.open,
    this.previousClose,
    this.eps,
    this.pe,
    this.sharesOutstanding,
  });

  factory StockQuote.fromJson(Map<String, dynamic> json) {
    return StockQuote(
      symbol: json['symbol'],
      name: json['name'],
      price: json['price'],
      changesPercentage: json['changesPercentage'],
      change: json['change'],
      dayLow: json['dayLow'],
      dayHigh: json['dayHigh'],
      yearHigh: json['yearHigh'],
      yearLow: json['yearLow'],
      marketCap: json['marketCap'],
      volume: json['volume'],
      avgVolume: json['avgVolume'],
      open: json['open'],
      previousClose: json['previousClose'],
      eps: json['eps'],
      pe: json['pe'],
      sharesOutstanding: json['sharesOutstanding'],
    );
  }

}