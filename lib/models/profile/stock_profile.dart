class StockProfile {
  final double price;
  final String beta;
  final String volAvg;
  final String mktCap;
  final double changes;
  final String changesPercentage;
  final String companyName;
  final String exchange;
  final String industry;
  final String description;
  final String ceo;
  final String sector;

  StockProfile({
    this.price,
    this.beta,
    this.volAvg,
    this.mktCap,
    this.changes,
    this.changesPercentage,
    this.companyName,
    this.exchange,
    this.industry,
    this.description,
    this.ceo,
    this.sector,
  });

  factory StockProfile.fromJson(Map<String, dynamic> json) {
    return StockProfile(
      price: json['price'],
      beta: json['beta'],
      volAvg: json['volAvg'],
      mktCap: json['mktCap'],
      changes: json['changes'],
      changesPercentage: json['changesPercentage'],
      companyName: json['companyName'],
      exchange: json['exchange'],
      industry: json['industry'],
      description: json['description'],
      ceo: json['ceo'],
      sector: json['sector'],
    );
  }

}
