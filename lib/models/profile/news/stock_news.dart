class StockNews {
  final String category;
  final int datetime;
  final String headline;
  final int id;
  final String image;
  final String related;
  final String source;
  final String summary;
  final String url;

  StockNews({
    this.category,
    this.datetime,
    this.headline,
    this.id,
    this.image,
    this.related,
    this.source,
    this.summary,
    this.url
  });

  static List<StockNews> toList(List<dynamic> items) {
    return items
    .map((item) => StockNews.fromJson(item))
    .toList();
  }

  factory StockNews.fromJson(Map<String, dynamic> json) {
    return StockNews(
      category: json['category'],
      datetime: json['datetime'],
      headline: json['headline'],
      id: json['id'],
      image: json['image'],
      related: json['related'],
      source: json['source'],
      summary: json['summary'],
      url: json['url'],
    );
  }

}