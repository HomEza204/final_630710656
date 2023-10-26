import 'package:collection/collection.dart';

import 'condition.dart';

class Weather {
  final String city;
  final String country;
  final String lastUpdated;
  final double tempC;
  final double tempF;
  final double feelsLikeC;
  final double feelsLikeF;
  final double windKph;
  final double windMph;
  final double humidity;
  final int uv;
  final Condition condition;
  // final List<Review> reviews;

  Weather({
    required this.city,
    required this.country,
    required this.lastUpdated,
    required this.tempC,
    required this.tempF,
    required this.feelsLikeC,
    required this.feelsLikeF,
    required this.windKph,
    required this.windMph,
    required this.humidity,
    required this.uv,
    required this.condition,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {

    Condition condition = json['condition'].map<Condition>((item) => Condition.fromJson(item));

    return Weather(
      city: json['city'],
      country: json['country'],
      lastUpdated: json['lastUpdated'],
      tempC: json['tempC'].todouble(),
      tempF: json['tempF'].todouble(),
      feelsLikeC: json['feelsLikeC'].todouble(),
      feelsLikeF: json['feelsLikeF'].todouble(),
      windKph: json['windKph'].todouble(),
      windMph: json['windMph'].todouble(),
      humidity: json['humidity'].todouble(),
      uv: json['uv'],
      condition: condition,
    );
  }
}