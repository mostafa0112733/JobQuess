import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  String _token = '';
  int _userId = 0;
  String _username = '';

  String get token => _token;
  int get userId => _userId;
  String get username => _username;

  void setToken(String token, int userId, String username) {
    _token = token;
    _userId = userId;
    _username = username;
    notifyListeners();
  }

  void clearToken() {
    _token = '';
    _userId = 0;
    _username = '';
    notifyListeners();
  }
}
