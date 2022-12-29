import 'package:flutter/material.dart';
import 'package:cashflow/database/models/user.dart';
import 'package:cashflow/database/backend/auth.dart';

class UserProvider with ChangeNotifier {
  User ? _user;
  final Auth _auth = Auth();

  User get getUser => _user!;

  Future<void> refreshUser() async {
    User user = await _auth.getUserDetails();
    _user = user;

    notifyListeners();
  }
}