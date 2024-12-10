import 'package:dio/dio.dart';
import 'package:movie21/services/nginfoin/network_exception.dart';
import 'package:movie21/services/nginfoin/network_intercept.dart';

class ApiNginfoin {
  late final Dio dio;
  final requestTimeOut = 30; // 30 sec

  ApiNginfoin() {
    final baseOptions = BaseOptions(
        baseUrl: 'https://nginfoin.my.id/public',
        connectTimeout: Duration(seconds: requestTimeOut),
        receiveTimeout: Duration(seconds: requestTimeOut),
        responseType: ResponseType.json,
        followRedirects: true);

    dio = Dio(baseOptions);
    dio.interceptors.add(NetworkInterceptor());
  }

  Future<Map<String, dynamic>> headersRequest() async {
    String? token;
    return {
      'Content-Type': 'application/json',
      'Authorization': "Bearer $token",
      'Accept': 'application/json',
    };
  }

  Future<Response> post({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    final header = await headersRequest();
    return await _safeFetch(() => dio.post(url,
        data: data,
        options: Options(headers: header),
        queryParameters: queryParameters));
  }

  Future<Response> _safeFetch(Future<Response> Function() tryFetch) async {
    try {
      final response = await tryFetch();
      return response;
    } on DioException catch (dioError) {
      switch (dioError.type) {
        case DioExceptionType.connectionTimeout:
          throw NetworkException(message: "Connection Time Out");
        case DioExceptionType.sendTimeout:
          throw NetworkException(message: "Request Time Out");
        case DioExceptionType.receiveTimeout:
          throw NetworkException(message: "Response Time Out");
        case DioExceptionType.badResponse:
          throw NetworkException(response: dioError.response);
        default:
          throw NetworkException();
      }
    } catch (e) {
      throw NetworkException(message: e.toString());
    }
  }
}
