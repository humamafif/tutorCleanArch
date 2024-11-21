import 'package:dio/dio.dart';

class PostApiService {
  final Dio dio;

  PostApiService(this.dio);

  Future<Response> getPosts() async {
    // try {
    //   return await dio.get('https://jsonplaceholder.typicode.com/postsa');
    // } catch (e) {
    //   if (e is DioException) {
    //     print('kena dio exception');
    //     return Response(
    //       requestOptions: RequestOptions(path: ''),
    //       statusMessage: e.message,
    //       statusCode: e.response?.statusCode,
    //     );
    //   } else {
    //     print('kena exception biasa');
    //     throw Exception(e);
    //   }

    // }

    try {
      return await dio.get('https://jsonplaceholder.typicode.com/posts',options: Options(receiveTimeout: Duration(seconds: 5)));
    } on DioException catch (e) {
       return Response(
          requestOptions: RequestOptions(path: ''),
          statusMessage: e.message,
          statusCode: e.response?.statusCode,
        );
    } catch (e) {
      throw Exception(e);
    }
  }
}
