import 'package:http/http.dart';

abstract class BaseApi {
  final Client _client = Client();
  final String root;

  BaseApi(this.root);

  Future<Response> get({String? path, Map<String, dynamic>? params}) {
    return _client.get(_uri(path, params));
  }

  Uri _uri(String? path, Map<String, dynamic>? params) {
    return Uri.http(
        "10.0.2.2:8080", path == null ? "/$root" : "/$root/$path", params);
  }
}
