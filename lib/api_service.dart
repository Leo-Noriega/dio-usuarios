import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://jsonplaceholder.typicode.com',
      connectTimeout: Duration(seconds: 5),
      receiveTimeout: Duration(seconds: 5),
    ),
  );

  Future<List<dynamic>> getPosts() async {
    try {
      final response = await _dio.get('/posts');
      if (response.statusCode == 200) {
        return (response.data as List<dynamic>);
      } else {
        print('Unexpected status code: ${response.statusCode}');
        return [];
      }
    } on DioException catch (e) {
      print("Dio error: ${e.message}");
      return [];
    } catch (e) {
      print("Unexpected error: $e");
      return [];
    }
  }

  Future<List<dynamic>> getUsers() async {
    try {
      final response = await _dio.get('/users');
      if (response.statusCode == 200) {
        return (response.data as List<dynamic>);
      } else {
        print('Unexpected status code: ${response.statusCode}');
        return [];
      }
    } on DioException catch (e) {
      print("Dio error: ${e.message}");
      return [];
    } catch (e) {
      print("Unexpected error: $e");
      return [];
    }
  }
}
