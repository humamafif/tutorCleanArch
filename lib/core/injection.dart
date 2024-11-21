import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internalcap/features/ViewPost/data/datasources/remote/post_api_service.dart';
import 'package:internalcap/features/ViewPost/data/repositories/post_repo_impl.dart';
import 'package:internalcap/features/ViewPost/domain/repositories/post_repo.dart';
import 'package:internalcap/features/ViewPost/domain/usecases/post_usecase.dart';
import 'package:internalcap/features/ViewPost/presentation/bloc/viewpost_bloc.dart';

final sl = GetIt.instance;

Future<void> initInjection() async {
  final Dio dio = Dio();

  sl
    ..registerSingleton<PostApiService>(PostApiService(dio))
    ..registerSingleton<PostRepo>(PostRepoImpl(sl()))
    ..registerSingleton<GetPostUseCase>(GetPostUseCase(sl()))
    ..registerFactory(() => ViewpostBloc(sl()));
}
