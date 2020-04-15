import 'package:meta/meta.dart';

class SingleNewModel {
  final String source;
  final String title;
  final String url;
  final String urlToImage;
  final String publishedAt;

  SingleNewModel({
    @required this.source,
    @required this.title,
    @required this.url,
    @required this.urlToImage,
    @required this.publishedAt
  });

  factory SingleNewModel.fromJson(Map<String, dynamic> json) {
    return SingleNewModel(
      source: json['source']['name'],
      title: json['title'],
      url: json['url'],
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'],
    );
  }

  static List<SingleNewModel> toList(List<dynamic> items) {
    return items
    .map((item) => SingleNewModel.fromJson(item))
    .toList();
  }
}


