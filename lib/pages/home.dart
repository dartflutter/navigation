import 'package:flutter/material.dart';
import '../widgets/index.dart';
import 'admin.dart';

class HomePage extends StatelessWidget {
  Widget build(ctx) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            AppBar(
                /*  false 移除 Drawer Panel 右上的漢堡*/
                automaticallyImplyLeading: false,
                title: Text('Choose')),
            ListTile(
              title: Text('Administrator'),
              onTap: () {
                /* 
                Navigator.pushReplacement(ctx, MaterialPageRoute(builder: (ctx){
                  return AdminPage();
                }));
                */

                //因為在 MaterialApp 註冊了 name route 
                Navigator.pushReplacementNamed(ctx, '/admin');
              },
            )
          ],
        ),
      ),
      appBar: AppBar(title: Text('Home Page')),
      body: HomeManager(),
    );
  }
}
