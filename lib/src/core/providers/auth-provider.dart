import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthProvider extends ChangeNotifier {
  final String _baseUrl = 'identitytoolkit.googleapis.com';
  final String _firebaseToken = 'AIzaSyBFgefSbAJgvmLlLsOlnT6745BTH8POMiY';

  // Create storage
  final storage = new FlutterSecureStorage();

  Future<String?> signup(String email, String password) async {
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
    };

    final url =
        Uri.https(_baseUrl, '/v1/accounts:signUp', {'key': _firebaseToken});

    final resp = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodeResp = json.decode(resp.body);

    print(decodeResp);

    if (decodeResp.containsKey('idToken')) {
      await this.storage.write(key: 'token', value: decodeResp['idToken']);
      return null;
    } else {
      return decodeResp['error']['message'];
    }
  }

  Future<String?> signin(String email, String password) async {
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
    };

    final url = Uri.https(
        _baseUrl, '/v1/accounts:signInWithPassword', {'key': _firebaseToken});

    final resp = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodeResp = json.decode(resp.body);

    if (decodeResp.containsKey('idToken')) {
      await this.storage.write(key: 'token', value: decodeResp['idToken']);
      return null;
    } else {
      return decodeResp['error']['message'];
    }
  }

  Future logout() async {
    await this.storage.delete(key: 'token');
  }

  Future<String> isAuthenticated() async {
    return await this.storage.read(key: 'token') ?? '';
  }
}
