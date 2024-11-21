import 'package:dartz/dartz.dart';
import 'package:internalcap/core/exception.dart';
import 'package:internalcap/features/ViewPost/domain/entities/post_entity.dart';
import 'package:internalcap/features/ViewPost/domain/repositories/post_repo.dart';

class GetPostUseCase {
  final PostRepo _postRepo;

  GetPostUseCase(this._postRepo);

  Future<Either<Failure, List<PostEntity>>> call() async {
    return await _postRepo.getPosts();
  }
}