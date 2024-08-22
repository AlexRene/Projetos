import 'dart:convert';

class NasaImages {
  final String copyright;
  final String date;
  final String explanation;
  final String hdurl;
  final String mediaType;
  final String serviceVersion;
  final String title;
  final String url;

  NasaImages({
    required this.copyright,
    required this.date,
    required this.explanation,
    required this.hdurl,
    required this.mediaType,
    required this.serviceVersion,
    required this.title,
    required this.url,
  });

  factory NasaImages.fromMap(Map<String, dynamic> map) {
    return NasaImages(
      copyright: map['copyright'],
      date: map['date'],
      explanation: map['explanation'],
      hdurl: map['hdurl'],
      mediaType: map['mediaType'],
      serviceVersion: map['serviceVersion'],
      title: map['title'],
      url: map['url'],
    );
  }

  factory NasaImages.fromJson(String jsonString) {
    final Map<String, dynamic> jsonData = jsonDecode(jsonString);
    return NasaImages(
      copyright: jsonData["copyright"] as String,
      date: jsonData["date"] as String,
      explanation: jsonData["explanation"] as String,
      hdurl: jsonData["hdurl"] as String,
      mediaType: jsonData["mediaType"] as String,
      serviceVersion: jsonData["serviceVersion"] as String,
      title: jsonData["title"] as String,
      url: jsonData["url"] as String,
    );
  }
}
