import 'package:flutter/material.dart';
import '../widgets/index.dart';

class HomePage extends StatelessWidget {
  Widget build(ctx) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      body: HomeManager(),
    );
  }
}
