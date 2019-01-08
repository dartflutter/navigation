import 'package:flutter/material.dart';

class NotFound extends StatelessWidget {
  @override
  Widget build(ctx) {
    return WillPopScope(
      onWillPop: () => Future.value(true),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Resource Not found'),
        ),
        body: Center(
          child: RaisedButton(
            child: Text('找無頁面,回到上一頁'),
            onPressed: () => Navigator.pop(ctx),
          ),
        ),
      ),
    );
  }
}
