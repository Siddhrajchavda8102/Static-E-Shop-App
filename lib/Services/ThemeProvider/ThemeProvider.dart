import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

String defaultMode = "light";
String defaultTheme = "amber";

class ThemeProvider extends ChangeNotifier {
  String _mode = defaultMode;
  String _theme = defaultTheme;
  SharedPreferences? _pref;

  ThemeProvider() {
    _mode = defaultMode;
    _theme = defaultTheme;
    loadPreferrences();
  }

  initializePreferrences() async {
    if (_pref == null) _pref = await SharedPreferences.getInstance();
    // _pref!.clear();
  }

  loadPreferrences() async {
    await initializePreferrences();
    _mode = _pref!.getString("mode") ?? defaultMode;
    _theme = _pref!.getString("theme") ?? defaultTheme;
    notifyListeners();
  }

  buildBrightness() {
    Brightness brightness =
        ((defaultMode == "light") ? Brightness.light : Brightness.dark);

    if (_mode == "light")
      brightness = Brightness.light;
    else
      brightness = Brightness.dark;

    return brightness;
  }

  changeBrightness(String b) {
    _mode = b;
    savePreferrences("mode");
    notifyListeners();
  }

  buildTheme() {
    // String theme = defaultTheme;

    // if (_mode == "light")
    //   brightness = Brightness.light;
    // else
    //   brightness = Brightness.dark;
    return _theme;

    // return brightness;
  }

  changeTheme(String c) {
    _theme = c;
    savePreferrences("theme");
    notifyListeners();
  }

  savePreferrences(String key) async {
    await initializePreferrences();
    if (key == "mode") {
      _pref!.setString("mode", _mode);
    }
    else if (key == "theme") {
      _pref!.setString("theme", _theme);
    }
  }
}
