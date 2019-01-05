import 'package:flutter/material.dart';

import './home.dart';

class AdminPage extends StatelessWidget {
  @override
  Widget build(ctx) {
    return  Scaffold(
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            AppBar(
                /*  false 移除 Drawer Panel 右上的漢堡*/
                automaticallyImplyLeading: false,
                title: Text('Choose')),
            ListTile(
              title: Text('Home'),
              onTap: () {
                Navigator.pushReplacement(ctx, MaterialPageRoute(builder: (ctx){
                    return HomePage();
                }));
              },
            )
          ],
        ),
      ),
      appBar: AppBar(title: Text('Administrator')),
      body: Center(
        child: Text('Adminstrator'),
      ),
    );
  }
}