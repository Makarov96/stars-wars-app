import 'dart:convert';
import 'dart:developer';

import 'package:stars_wars_app/core/http/start_wars_http.dart';
import 'package:http/http.dart' as http;

class STWHttp extends StartWarsHttp {
  STWHttp({
    required this.client,
    this.baseApi = 'https://swapi.dev',
  });
  final http.Client client;
  final String baseApi;

  @override
  Future<T> get<T>({required String path}) async {
    final uri = Uri.parse(baseApi + path);
    final result = await client.get(uri);
    final decode = jsonDecode(result.body);
    log('path:$uri \n status:${result.statusCode} \n \n body: $decode');
    return Generic.fromJson<T>(decode);
  }
}
