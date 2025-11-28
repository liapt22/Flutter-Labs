import '../../domain/entities/detail_data.dart';
import '../../domain/entities/list_data.dart';
import '../../domain/repositories/feed_repository.dart';
import '../datasources/feed_remote_data_source.dart';

class FeedRepositoryImpl implements FeedRepository {
  FeedRepositoryImpl({required FeedRemoteDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;

  final FeedRemoteDataSource _remoteDataSource;

  @override
  Future<ListData> getFeed() {
    return _remoteDataSource.fetchFeed();
  }

  @override
  Future<DetailData> getRecipeDetail() {
    return _remoteDataSource.fetchRecipeDetails();
  }
}
