import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/app_data.dart';

class DataService {
  static const String _dataAssetPath = 'assets/data/data.json';

  Future<AppData> fetchAppData() async {
    final rawJson = await rootBundle.loadString(_dataAssetPath);
    final Map<String, dynamic> jsonMap =
        json.decode(rawJson) as Map<String, dynamic>;
    return AppData.fromJson(jsonMap);
  }
}
