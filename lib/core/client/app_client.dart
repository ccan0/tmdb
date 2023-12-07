import 'package:dio/dio.dart';
import 'package:tmbd/utilities/constants/url_constants/url_constants.dart';

class AppClient {
  static final AppClient _instance = AppClient._internal();

  factory AppClient() {
    return _instance;
  }

  final Dio _dio = Dio();

  AppClient._internal() {
    _dio.options = BaseOptions(
      baseUrl: UrlConstants().baseUrl,
      queryParameters: {"api_key": UrlConstants().apiKey},
    );
  }

  Future<Response?> get({required String url, Map<String, dynamic>? queryParameters}) async {
    try {
      final Response response = await _dio.get(url, queryParameters: queryParameters);
      return response;
    } catch (error) {
      print('GET request error: $error');
      return null;
    }
  }

  Future<Response?> post({required String url, Map<String, dynamic>? queryParameters, Map<String, dynamic>? body}) async {
    try {
      final Response response = await _dio.post(url, data: body);
      return response;
    } catch (error) {
      print('POST request error: $error');
      return null;
    }
  }

  Future<Response?> put({required String url, Map<String, dynamic>? queryParameters, Map<String, dynamic>? body,}) async {
    try {
      final Response response = await _dio.put(url, data: body);
      return response;
    } catch (error) {
      print('PUT request error: $error');
      return null;
    }
  }

  Future<Response?> delete({required String url, Map<String, dynamic>? queryParameters, Map<String, dynamic>? body}) async {
    try {
      final Response response = await _dio.delete(url, data: body);
      return response;
    } catch (error) {
      print('DELETE request error: $error');
      return null;
    }
  }
}
