import 'dart:convert';

import 'package:final_630710656/models/weather.dart';

import '../services/api_caller.dart';

class WeatherRepository {
  Future<Weather> getWeathers() async {
    try {
      var result = await ApiCaller().get(ApiCaller.baseUrl);
      Map<String, dynamic> jsonData = jsonDecode(result);
      Weather weather = Weather.fromJson(jsonData);
      return weather;
    } catch (e) {
      // TODO:
      rethrow;
    }
  }

  // Future<void> addToilet(
  //     {required String name, required double distance}) async {
  //   try {
  //     var result = await ApiCaller()
  //         .post('toilets', params: {'name': name, 'distance': distance});
  //   } catch (e) {
  //     // TODO:
  //     rethrow;
  //   }
  // }
}