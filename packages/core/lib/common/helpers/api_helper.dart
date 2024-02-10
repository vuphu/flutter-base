import 'dart:convert';

import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;
import 'package:http/http.dart';

import '../dtos/responses/error_response.dart';
import '../exceptions/exception.dart';

class ApiHelper {
  static Future<T> callRestApi<T>(Future<Response> Function() callable, T Function(dynamic) mapper) async {
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

  static Future<T> callGraphQL<T>(
      Future<graphql_flutter.QueryResult> Function() callable, T Function(dynamic) mapper) async {
    try {
      graphql_flutter.QueryResult response = await callable();
      if (response.hasException) {
        String? message;
        if (response.exception?.graphqlErrors.isNotEmpty == true) {
          message = response.exception?.graphqlErrors.first.message;
        } else if (response.exception?.linkException != null) {
          message = response.exception?.linkException?.originalException.toString();
        }
        return Future.error(LocalException(
          message: message ?? 'An error occurred during processing.',
        ));
      }
      return mapper(response.data);
    } catch (error) {
      throw LocalException(message: error.toString());
    }
  }
}
