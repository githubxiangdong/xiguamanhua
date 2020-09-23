import 'package:flutter/material.dart';
import 'package:xiguamanhua/common/theme/xg_app_theme.dart';
import 'package:xiguamanhua/routers/xg_app_router.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: XGAppTheme.normalTheme,
      routes: XGAPPRouter.routers,
      initialRoute: XGAPPRouter.initialRoute,
      onGenerateRoute: XGAPPRouter.onGenerateRoute,
    );
  }
}