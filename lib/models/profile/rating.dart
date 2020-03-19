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
  final int score;
  final String recommendation;

  RatingDetails({this.score, this.recommendation});

  factory RatingDetails.fromJson(Map<String, dynamic> json) {
    return RatingDetails(
      score: json['score'],
      recommendation: json['recommendation'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['score'] = this.score;
    data['recommendation'] = this.recommendation;
    return data;
  }
}