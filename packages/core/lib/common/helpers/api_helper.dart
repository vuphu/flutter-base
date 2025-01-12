import 'dart:convert';

import 'package:http/http.dart';

import '../dtos/responses/error_response.dart';
import '../exceptions/exception.dart';

class ApiHelper {
  static Future<T> callRestApi<T>(
      Future<Response> Function() callable, T Function(dynamic) mapper) async {
    try {
      Response response = await callable();
      dynamic json = jsonDecode(response.body);
      if (response.statusCode >= 200 && response.statusCode < 299) {
        return mapper(json);
      } else {
        ErrorResponse error = ErrorResponse.fromJson(json);
        return Future.error(ServerException(
          message: error.message,
          statusCode: error.statusCode,
        ));
      }
    } catch (error) {
      throw LocalException(message: error.toString());
    }
  }
}
