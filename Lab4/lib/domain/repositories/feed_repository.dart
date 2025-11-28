import '../entities/detail_data.dart';
import '../entities/list_data.dart';

abstract class FeedRepository {
  Future<ListData> getFeed();
  Future<DetailData> getRecipeDetail();
}
