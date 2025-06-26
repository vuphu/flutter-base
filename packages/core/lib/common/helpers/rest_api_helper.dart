import 'package:http/http.dart' as http;

class RestAPI {
  late String _endpoint;
  late Map<String, String> _headers;
  late Map<String, dynamic> _queries;
  late Object? _body;

  RestAPI() {
    _headers = Map();
    _queries = Map();
    _body = null;
  }

  RestAPI setEndpoint(String endpoint) {
    _endpoint = endpoint;
    return this;
  }

  RestAPI setBody(Object body) {
    _body = body;
    return this;
  }

  RestAPI addHeader(String key, dynamic value) {
    _headers[key] = value.toString();
    return this;
  }

  RestAPI addQuery(String key, dynamic value) {
    _queries[key] = value;
    return this;
  }

  RestAPI setQueries(Map<String, dynamic> queries) {
    _queries = queries;
    return this;
  }

  Uri _getEndpointUri() {
    String queryString = _queries.keys.map((key) => '${key}=${_queries[key]}').join('&');
    return Uri.parse('${_endpoint}?${queryString}');
  }

  Future<http.Response> get() async {
    return http.get(_getEndpointUri(), headers: _headers);
  }

  Future<http.Response> post() async {
    return http.post(_getEndpointUri(), body: _body, headers: _headers);
  }
}
