import 'package:dio/dio.dart';

class BaseRemoteSource {
  late final Dio http;

  BaseRemoteSource() {
    http = Dio(
      BaseOptions(
          // validateStatus: (status) => status! < 304,
          // headers: {
          //   HttpHeaders.contentTypeHeader: "application/json",
          // },
          ),
    );
  }

  Future<Response> get(String endPoint) async {
    Response response;

    try {
      response = await http.get(endPoint);
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }

    return response;
  }

  Future<Response> post(String endPoint, dynamic body) async {
    Response response;

    try {
      response = await http.post(endPoint, data: body);
    } on DioError catch (e, stacktrace) {
      print('Exception occured: $e stackTrace: $stacktrace');
      throw Exception(e.message);
    }

    return response;
  }

  Future<Response> put(String endPoint, dynamic body) async {
    Response response;

    try {
      response = await http.put(endPoint, data: body);
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }

    return response;
  }

  Future<Response> delete(String endPoint) async {
    Response response;

    try {
      response = await http.delete(endPoint);
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }

    return response;
  }
}
