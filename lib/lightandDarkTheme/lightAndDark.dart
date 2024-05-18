import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = lightMode;

  ThemeData getTheme() => _themeData;

  void setTheme(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }
}

void toggleTheme(BuildContext context) {
  ThemeProvider themeProvider =
      Provider.of<ThemeProvider>(context, listen: false);
  if (themeProvider.getTheme() == lightMode) {
    themeProvider.setTheme(darkMode);
  } else {
    themeProvider.setTheme(lightMode);
  }
}
// Define light mode theme

final ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: Colors.white,
    primary: Color.fromARGB(255, 248, 247, 247),
    secondary: Color.fromARGB(255, 247, 245, 245),
  ),
);

final ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: Colors.grey.shade900,
    primary: Colors.grey.shade800,
    secondary: Colors.grey.shade700,
  ),
);
