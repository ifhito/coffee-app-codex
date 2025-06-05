import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/coffee_bean.dart';

class ApiService {
  final String baseUrl;

  ApiService({this.baseUrl = 'http://localhost:3000/api/v1'});

  Future<List<CoffeeBean>> fetchCoffeeBeans() async {
    final response = await http.get(Uri.parse('$baseUrl/coffee_beans'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body) as List<dynamic>;
      return data
          .map((e) => CoffeeBean.fromJson(e as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Failed to load coffee beans');
    }
  }
}
