import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/detail_data_model.dart';
import '../models/list_data_model.dart';

class FeedRemoteDataSource {
  FeedRemoteDataSource({http.Client? client}) : _client = client ?? http.Client();

  final http.Client _client;
  static const String _baseUrl = 'https://test-api-jlbn.onrender.com/v2';

  Future<ListDataModel> fetchFeed() async {
    final uri = Uri.parse('$_baseUrl/feed');
    final response = await _client.get(uri);
    if (response.statusCode != 200) {
      throw Exception('Failed to fetch feed (code ${response.statusCode})');
    }

    final data = json.decode(response.body) as Map<String, dynamic>;
    return ListDataModel.fromJson(data);
  }

  Future<DetailDataModel> fetchRecipeDetails() async {
    final uri = Uri.parse('$_baseUrl/feed/details');
    final response = await _client.get(uri);
    if (response.statusCode != 200) {
      throw Exception('Failed to fetch recipe details (code ${response.statusCode})');
    }

    final data = json.decode(response.body) as Map<String, dynamic>;
    return DetailDataModel.fromJson(data);
  }
}
