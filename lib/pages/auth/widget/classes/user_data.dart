import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserModel {
  static final UserModel _instance = UserModel._internal();
  String _token = '';
  String email = '';
  String nom = '';

  String get token => _token;

  set token(String value) {
    _token = value;
    _saveTokenToPreferences(value);
  }

  UserModel._internal();

  factory UserModel() => _instance;

  Future<void> _saveTokenToPreferences(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    print(token);
    await prefs.setString('UserModelToken', token);
    await prefs.setString('test', 'token');
  }

  static Future<void> saveTokenToPreferences(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    print(token);
    await prefs.setString('UserModelToken', token);
  }

  static Future<void> loadTokenFromPreferences() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('UserModelToken');
    print("token1 ${token}");

    if (token != null) {
      print("tokenup ${token}");
      _instance.token = token;
      print("tokendown ${token}");
      print("_instance.token ${_instance.token}");
    }
  }

  static Future<String> getTokenDirectlyFromPreferences() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('userToken') ?? '';
  }

  static void updateFromJson(Map<String, dynamic> json) {
    print(json['result']['email']);
    print(json['result']['nom']);

    _instance
      ..email = json['result']['email'] ?? ''
      ..nom = json['result']['nom'] ?? '';
  }

  Map<String, dynamic> toJson() => {
        'token': token,
        'email': email,
        'nom': nom,
      };
}
