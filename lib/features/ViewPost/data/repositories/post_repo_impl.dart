import 'package:dartz/dartz.dart';
import 'package:internalcap/core/exception.dart';
import 'package:internalcap/features/ViewPost/data/datasources/remote/post_api_service.dart';
import 'package:internalcap/features/ViewPost/data/models/post_model.dart';
import 'package:internalcap/features/ViewPost/domain/repositories/post_repo.dart';

class PostRepoImpl extends PostRepo {
  final PostApiService postApiService;

  PostRepoImpl(this.postApiService);
  @override
  Future<Either<Failure, List<PostModel>>> getPosts() async {
    final response = await postApiService.getPosts();
    try {
      print('ini data');
      print(response.data);
      print('ini status code');
      print(response.statusCode);
      final posts = (response.data as List)
          .map((post) => PostModel.fromJson(post))
          .toList();
      return Right(posts);
    } catch (e) {
      print('kena di repo impl');
      return Left(Failure(message: "An error occured"));
    }
  }
}
