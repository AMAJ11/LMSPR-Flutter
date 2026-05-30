import 'package:dio/dio.dart';

class DioFactory {
  static Dio? _dio;
  //*************************************************
  static const String baseUrl = 'http://192.168.1.10:8000/api/';

  static Dio getDio() {
    if (_dio == null) {
      _dio = Dio(
        BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          },
        ),
      );
      _dio!.interceptors.add(LogInterceptor(
        responseBody: true,
        requestBody: true,
        requestHeader: true,
      ));
    }
    return _dio!;
  }
}

class DioClient {
  final Dio _dio = DioFactory.getDio();

  Future<Response> get(String endpoint, {Map<String, dynamic>? queryParameters}) async {
    try {
      return await _dio.get(endpoint, queryParameters: queryParameters);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<Response> post(String endpoint, {dynamic data}) async {
    try {
      return await _dio.post(endpoint, data: data);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  String _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return 'انتهت مهلة الاتصال، تحقق من الشبكة.';
      case DioExceptionType.connectionError:
        return 'لا يوجد اتصال بالإنترنت، تأكد من تشغيل السيرفر.';
      case DioExceptionType.badResponse:
        if (error.response?.data != null && error.response?.data['message'] != null) {
          return error.response!.data['message'];
        }
        return 'خطأ في السيرفر: كود ${error.response?.statusCode}';
      default:
        return 'حدث خطأ غير متوقع، يرجى المحاولة لاحقاً.';
    }
  }
}