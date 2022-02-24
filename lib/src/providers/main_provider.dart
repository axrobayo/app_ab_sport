import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainProvider extends ChangeNotifier {
  bool _mode = true;
  int _index = 0;
  String _token = "";

  bool get mode {
    return _mode;
  }

  set mode(bool value) {
    _mode = value;
    notifyListeners();
  }

  int get index {
    return _index;
  }

  set index(int value) {
    _index = value;
    notifyListeners();
  }
  String get token {
    return _token;
  }

  set token(String t) {
    _updateToken(t);
    _token = t;
    notifyListeners();
  }

  Future<bool> initPrefs() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      _mode = prefs.getBool("mode") ?? false;
      _token = prefs.getString("token") ?? "";
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> _updateToken(String t) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("token", t);
  }
}


