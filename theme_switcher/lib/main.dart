import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(ThemeSwitcherPage());
}

class ThemeSwitcherPage extends StatefulWidget {
  @override
  _ThemeSwitcherState createState() => _ThemeSwitcherState();
}

class _ThemeSwitcherState extends State<ThemeSwitcherPage> {
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: const Text("Theme Switcher App"),
            ),
            body: Center(
              child: GestureDetector(
                onLongPress: () {
                  print("OnLongPress Executed");
                },
                onDoubleTap: () {
                  setState(() {
                    _isDarkMode = !_isDarkMode;
                  });
                },
                child: Text(_isDarkMode
                    ? 'Switch to Light Mode'
                    : 'Switch to Dark Mode'),
              ),
            )));
  }
}
