import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xiguamanhua/common/provider/xg_book_rack_provider.dart';
import 'package:xiguamanhua/common/theme/xg_app_theme.dart';
import 'package:xiguamanhua/routers/xg_app_router.dart';

main() {
  runApp(
    ChangeNotifierProvider(
      create: (ctx) => XGBookRackProvider(), // 在应用程序的顶层设置 ChangeNotifierProvider
      child: MyApp(),
    )
  );
}

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