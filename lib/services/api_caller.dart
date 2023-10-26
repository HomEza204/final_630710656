import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiCaller {
  static const baseUrl = 'https://cpsu-test-api.herokuapp.com/api/1_2566/weather/current?city=bangkok ';
  static final _dio = Dio(BaseOptions(responseType: ResponseType.plain));

  Future<String> get(String endpoint, {Map<String, dynamic>? params}) async {
    try {
      final response =
      await _dio.get(baseUrl);
      debugPrint(response.data.toString());
      return response.data.toString();
    } catch (e) {
      // TODO:
      rethrow;
    }
  }

  // Future<String> post(String endpoint,
  //     {required Map<String, dynamic>? params}) async {
  //   try {
  //     final response = await _dio.post('$baseUrl/$endpoint', data: params);
  //     debugPrint(response.data.toString());
  //     return response.data.toString();
  //   } catch (e) {
  //     // TODO:
  //     rethrow;
  //   }
  // }
}