import 'package:dartz/dartz.dart';
import 'package:internalcap/core/exception.dart';
import 'package:internalcap/features/ViewPost/domain/entities/post_entity.dart';

abstract class PostRepo {
  Future<Either<Failure, List<PostEntity>>> getPosts();
}