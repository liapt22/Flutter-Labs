import 'detail_data.dart';
import 'list_data.dart';

class AppData {
  const AppData({
    required this.list,
    required this.details,
  });

  final ListData list;
  final DetailData details;

  factory AppData.fromJson(Map<String, dynamic> json) {
    return AppData(
      list: ListData.fromJson(
        json['list'] as Map<String, dynamic>? ?? {},
      ),
      details: DetailData.fromJson(
        json['details'] as Map<String, dynamic>? ?? {},
      ),
    );
  }
}
