import 'package:flutter/material.dart';
import 'package:sistema_web/src/configs/router/app_router.dart';
import 'package:sistema_web/src/configs/theme/app_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.themeLigth,
      title: 'Material App',
    );
  }
}
