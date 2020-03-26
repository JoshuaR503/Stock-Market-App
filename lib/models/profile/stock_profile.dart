
class StockProfile {
  final double price;
  final String beta;
  final String volAvg;
  final String mktCap;
  final String lastDiv;
  final String range;
  final double changes;
  final String changesPercentage;
  final String companyName;
  final String exchange;
  final String industry;
  final String website;
  final String description;
  final String ceo;
  final String sector;
  final String image;

  StockProfile({
    this.price,
    this.beta,
    this.volAvg,
    this.mktCap,
    this.lastDiv,
    this.range,
    this.changes,
    this.changesPercentage,
    this.companyName,
    this.exchange,
    this.industry,
    this.website,
    this.description,
    this.ceo,
    this.sector,
    this.image
  });

  factory StockProfile.fromJson(Map<String, dynamic> json) {
    return StockProfile(
      price: json['price'],
      beta: json['beta'],
      volAvg: json['volAvg'],
      mktCap: json['mktCap'],
      lastDiv: json['lastDiv'],
      range: json['range'],
      changes: json['changes'],
      changesPercentage: json['changesPercentage'],
      companyName: json['companyName'],
      exchange: json['exchange'],
      industry: json['industry'],
      website: json['website'],
      description: json['description'],
      ceo: json['ceo'],
      sector: json['sector'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['price'] = this.price;
    data['beta'] = this.beta;
    data['volAvg'] = this.volAvg;
    data['mktCap'] = this.mktCap;
    data['lastDiv'] = this.lastDiv;
    data['range'] = this.range;
    data['changes'] = this.changes;
    data['changesPercentage'] = this.changesPercentage;
    data['companyName'] = this.companyName;
    data['exchange'] = this.exchange;
    data['industry'] = this.industry;
    data['website'] = this.website;
    data['description'] = this.description;
    data['ceo'] = this.ceo;
    data['sector'] = this.sector;
    data['image'] = this.image;
    return data;
  }
}
