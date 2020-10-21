import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RestAPI {
  static RestAPI _instance = RestAPI._constructor();

  RestAPI._constructor();

  factory RestAPI() => _instance;

  String _insertVariablesIntoEndpoint(String endpoint, Map<String, dynamic> variables) {
    variables.forEach((key, value) {
      endpoint = endpoint.replaceAll("\${$key}", value.toString());
    });
    return endpoint;
  }

  Future<http.Response> get(String endpoint, Map<String, dynamic> headers) {
    return http.get(_insertVariablesIntoEndpoint(endpoint, headers));
  }
}
