import 'package:dio/dio.dart';

class ApiService {
  late Dio dio;
  ApiService({required String baseUrl}) {
    BaseOptions options = BaseOptions(baseUrl: baseUrl);
    dio = Dio(options);
  }
  Future<Response> post({
    required String endpoint,
    required Map<String, dynamic> data,
    required Map<String, dynamic>? headers,
  }) async {
    try {
      Response response = await dio.post(
        endpoint,
        data: data,
        options: Options(headers: headers),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
