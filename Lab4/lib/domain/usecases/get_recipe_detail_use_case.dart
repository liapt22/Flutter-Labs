import '../entities/detail_data.dart';
import '../repositories/feed_repository.dart';

class GetRecipeDetailUseCase {
  const GetRecipeDetailUseCase(this._repository);

  final FeedRepository _repository;

  Future<DetailData> call() {
    return _repository.getRecipeDetail();
  }
}
