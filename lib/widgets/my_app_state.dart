// my_app_state.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyAppState extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void setSelectedIndex(int value) {
    _selectedIndex = value;
    notifyListeners();
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    setSelectedIndex(0);
  }
}
