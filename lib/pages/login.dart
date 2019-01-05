import 'package:flutter/material.dart';

import 'home.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(ctx) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Authentication'),
      ),
      body: Center(
          child: RaisedButton(
        child: Text('LOGIN'),
        onPressed: () => Navigator.pushReplacement(
              ctx,
              MaterialPageRoute(builder: (BuildContext context) {
                return HomePage();
              }),
            ),
      )),
    );
  }
}
