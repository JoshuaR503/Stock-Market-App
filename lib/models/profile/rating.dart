class StockRating {
  final String symbol;
  final Rating rating;
  final RatingDetails ratingDetails;

  StockRating({this.symbol, this.rating, this.ratingDetails});

  factory StockRating.fromJson(Map<String, dynamic> json) {
    return StockRating(
      symbol: json['symbol'],
      rating: Rating.fromJson(json['rating']),
      ratingDetails: RatingDetails.fromJson(json['ratingDetails']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();

    data['symbol'] = this.symbol;
    data['rating'] = this.rating.toJson();
    data['ratingDetails'] = this.ratingDetails.toJson();
    
    return data;
  }
}

class Rating {
  final int score;
  final String rating;
  final String recommendation;

  Rating({this.score, this.rating, this.recommendation});

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      score: json['score'],
      rating: json['rating'],
      recommendation: json['recommendation'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['score'] = this.score;
    data['rating'] = this.rating;
    data['recommendation'] = this.recommendation;
    return data;
  }
}


class RatingDetails {
  final RatingSubData pB;
  final RatingSubData rOA;
  final RatingSubData dCF;
  final RatingSubData pE;
  final RatingSubData rOE;
  final RatingSubData dE;

  RatingDetails({this.pB, this.rOA, this.dCF, this.pE, this.rOE, this.dE});

  factory RatingDetails.fromJson(Map<String, dynamic> json) {
    return RatingDetails(
      pB: RatingSubData.fromJson(json['P/B']),
      rOA: RatingSubData.fromJson(json['ROA']),
      dCF: RatingSubData.fromJson(json['DCF']),
      pE: RatingSubData.fromJson(json['P/E']),
      rOE: RatingSubData.fromJson(json['ROE']),
      dE: RatingSubData.fromJson(json['D/E']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['P/B'] = this.pB.toJson();
    data['ROA'] = this.rOA.toJson();
    data['DCF'] = this.dCF.toJson();
    data['P/E'] = this.pE.toJson();
    data['ROE'] = this.rOE.toJson();
    data['D/E'] = this.dE.toJson();
    
    return data;
  }
}

class RatingSubData {
  int score;
  String recommendation;

  RatingSubData({this.score, this.recommendation});

  factory RatingSubData.fromJson(Map<String, dynamic> json) {
    return RatingSubData(
      score: json['score'],
      recommendation: json['recommendation'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['score'] = this.score;
    data['recommendation'] = this.recommendation;
    return data;
  }
}