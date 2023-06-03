import 'dart:convert';

import 'package:flutter_tanya_mama/basics/exceptions/http_exception.dart';
import 'package:flutter_tanya_mama/functions/token_version.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_tanya_mama/configs/configs.dart';

abstract class BaseHTTPHelper {
  String get route;
  String get modelName;

  Future<Map<String, dynamic>> post({String? json, String? endpoint}) async {
    return postGenerics<Map<String, dynamic>>(endpoint: endpoint, json: json);
  }

  Future<T> postGenerics<T>({
    String? json,
    Map<String, String>? headers,
    String? endpoint,
  }) async {
    try {
      if (headers == null) {
        headers = {"content-type": "application/json"};
        String token = await TokenVersion.getToken();
        if (token.isNotEmpty) headers["Authorization"] = "Bearer $token";
      }

      var response = await http.post(
        Uri.parse("${Configs.httpLink}/$route/$endpoint"),
        body: json,
        headers: headers,
      );
      if (response.statusCode == 200) {
        dynamic map;
        try {
          map = jsonDecode(response.body);
        } catch (err) {
          map = response.body;
        }
        return map;
      } else {
        throw HTTPException.fromHTTPError(jsonDecode(response.body));
      }
    } on HTTPException {
      rethrow;
    } catch (err) {
      throw HTTPException.fromError(err as Error);
    }
  }

  Future<T> getGenerics<T>({
    String? json,
    Map<String, String>? headers,
    String? endpoint,
  }) async {
    try {
      if (headers == null) {
        headers = {"content-type": "application/json"};
        String token = await TokenVersion.getToken();
        if (token.isNotEmpty) headers["Authorization"] = "Bearer $token";
      }

      var response = await http.get(
        Uri.parse("${Configs.httpLink}/$route/$endpoint"),
        headers: headers,
      );
      if (response.statusCode == 200) {
        dynamic map;
        try {
          map = jsonDecode(response.body);
        } catch (err) {
          map = response.body;
        }
        return map;
      } else {
        throw HTTPException.fromHTTPError(jsonDecode(response.body));
      }
    } on HTTPException {
      rethrow;
    } catch (err) {
      throw HTTPException.fromError(err as Error);
    }
  }

  Future<void> postVoid({String? json, String? endpoint}) async {
    try {
      Map<String, String> headers = {"content-type": "application/json"};
      String token = await TokenVersion.getToken();
      if (token.isNotEmpty) headers["Authorization"] = "Bearer $token";
      var response = await http.post(
        Uri.parse("${Configs.httpLink}/$route/$endpoint"),
        body: json,
        headers: headers,
      );
      if (response.statusCode == 200) {
        return;
      } else {
        throw HTTPException.fromHTTPError(jsonDecode(response.body));
      }
    } on HTTPException {
      rethrow;
    } catch (err) {
      throw HTTPException.fromError(err as Error);
    }
  }
}
