import 'package:flutter/material.dart';
import './pages/index.dart' as pages;

main() => runApp(App());

class App extends StatelessWidget {
  Widget build(ctx) {
    return MaterialApp(
      theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.deepOrange,
          accentColor: Colors.deepPurple),
      home: pages.LoginPage(),
    );
  }
}
