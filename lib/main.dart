import 'package:flutter/material.dart';
import 'dart:convert';
import './pages/index.dart' as pages;

main() => runApp(App());

final ThemeData _themeData = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.deepOrange,
    accentColor: Colors.deepPurple);

typedef Widget AppRoutes(BuildContext ctx);

/*    '/' 即表示了 home , '/'是Flutter route保留給 home用的 */
final Map<String, AppRoutes> _routes = {
  "/": (ctx) => pages.HomePage(),
  "/admin": (ctx) => pages.AdminPage(),
  "/notfound": (ctx) => pages.NotFound()
};

MaterialPageRoute _onGenerateRoute(RouteSettings settings) {
  final List<String> pathElements = settings.name.split('/');
  if (pathElements[0] != '') {
    return null;
  }

  /* home_manager.dart : /detail/index  */
  if (pathElements[1] == 'detail') {
    final Map<String, dynamic> map = jsonDecode(pathElements[2]);

    /**因為 detail 會回傳一個bool,所以要宣告 <bool> */
    return MaterialPageRoute<bool>(
        builder: (BuildContext context) => pages.DetailPage(item: map));
  }
}

MaterialPageRoute _gotoDefaultRoute(RouteSettings settings) {
  //當所有的Route都失效 (onRouteGenerate 回傳null時)
  return MaterialPageRoute(builder: _routes["/notfound"]);
}

class App extends StatelessWidget {
  Widget build(ctx) {
    return MaterialApp(
      theme: _themeData,
      /*  使用 routes 就不可以使用  home: pages.LoginPage() */
      routes: _routes,
      
      onGenerateRoute: _onGenerateRoute,

      /* 當所有的Route都失效 (onRouteGenerate 回傳null時) */
      onUnknownRoute: _gotoDefaultRoute,
    );
  }
}
