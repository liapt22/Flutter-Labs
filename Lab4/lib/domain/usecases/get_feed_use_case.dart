import '../entities/list_data.dart';
import '../repositories/feed_repository.dart';

class GetFeedUseCase {
  const GetFeedUseCase(this._repository);

  final FeedRepository _repository;

  Future<ListData> call() {
    return _repository.getFeed();
  }
}
