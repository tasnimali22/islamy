import 'package:dio/dio.dart';

class ApiServices {
  // final  baseUrl;
  final Dio _dio;

  ApiServices() : _dio = Dio();
  // ApiServices(this._dio);

  Future<Map<String, dynamic>> get({required String baseUrl}) async {
    var response = await _dio.get(baseUrl);
    return response.data;
  }
}
