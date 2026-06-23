import 'package:flutter/material.dart';
import 'routes/app_router.dart';
import '../core/theme/light_theme.dart';
import '../core/theme/dark_theme.dart';

class QoraApp extends StatefulWidget {
  const QoraApp({Key? key}) : super(key: key);

  @override
  State<QoraApp> createState() => _QoraAppState();
}

class _QoraAppState extends State<QoraApp> {
  ThemeMode _themeMode = ThemeMode.system;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Qora - UI Prototype',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeMode,
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
