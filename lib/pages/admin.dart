import 'package:flutter/material.dart';

import './home.dart';
import '../widgets/admin_create_tab.dart';
import '../widgets/admin_list_tab.dart';

class AdminPage extends StatelessWidget {
/* 
  Tab 有關 
    DefaultTabController Widget : It wraps the entire page because it will need to swap out the body of that page
    TabBar Widget :
    TabBarView Widget
 */

  @override
  Widget build(ctx) {
    return DefaultTabController(
      length: 2 /** 共有兩個 Tab */,
      child: Scaffold(
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              AppBar(
                  /*  false 移除 Drawer Panel 右上的漢堡*/
                  automaticallyImplyLeading: false,
                  title: Text('Choose')),
              ListTile(
                title: Text('link404'),
                onTap: () {
                  /*
                  Navigator.pushReplacement(ctx,
                      MaterialPageRoute(builder: (ctx) {
                    return HomePage();
                  }));
                  */

                  //因為在 MaterialApp 註冊了 name route
                  //Navigator.pushReplacementNamed(ctx, '/');

                  Navigator.pushNamed(ctx, '/notfound');
                },
              ),
              ListTile(
                  title: Text('home'),
                  onTap: () {
                    Navigator.pushNamed(ctx, '/');
                  }),
              ListTile(
                  title: Text('AdminPage2'),
                  onTap: () {
                    //這種用法用於測試用
                    Navigator.push(ctx, AdminPage2());
                  }),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text('Administrator'),
          bottom: TabBar(tabs: [
            Tab(text: "Create", icon: Icon(Icons.create)),
            Tab(
              text: "List",
              icon: Icon(Icons.list),
            ),
          ]),
        ),
        body: TabBarView(
          /* Tab 會被 embeded 到 Page的body,而非取代, tab 可以看做subpage */
          children: <Widget>[CreateTab(), ListTab()],
        ),
      ),
    );
  }
}

class AdminPage2 extends MaterialPageRoute<void> {
  AdminPage2()
      : super(builder: (ctx) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(ctx).accentColor,
              title: Text('AdminPage2'),
              elevation: 1.0,
            ),
            body: Center(
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(ctx, AdminPage3());
                },
                child: Text("go to Admin Page3"),
              ),
            ),
          );
        } //builder
            );
}

class AdminPage3 extends MaterialPageRoute<void> {
  AdminPage3()
      : super(builder: (ctx) {
          return Scaffold(
              appBar: AppBar(
                backgroundColor: Theme.of(ctx).primaryColorDark,
                title: Text('Admin Page3'),
                elevation: 1.0,
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(ctx);
                    },
                  )
                ],
              ),
              body: Center(
                child: MaterialButton(
                    onPressed: () {
                      print(
                          'Navigator.defaultRouteName = ${Navigator.defaultRouteName}');

                      Navigator.pushNamed(ctx, Navigator.defaultRouteName);
                    },
                    child: Text('Go Home')),
              ));
        });
}
