import 'package:chess_clock/shared/schemes/color_schemes.g.dart';
import 'package:flutter/material.dart';

import 'chess_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chess Clock',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
        scaffoldBackgroundColor: lightColorScheme.primaryContainer,
        appBarTheme: const AppBarTheme(
            centerTitle: true, backgroundColor: Colors.transparent),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: lightColorScheme.primary),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: lightColorScheme.primaryContainer,
        colorScheme: darkColorScheme,
        appBarTheme: AppBarTheme(
            centerTitle: true,
            backgroundColor: lightColorScheme.primaryContainer),
      ),
      home: const ChessApp(),
    );
  }
}
