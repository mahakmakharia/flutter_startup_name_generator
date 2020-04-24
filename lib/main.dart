import 'package:flutter/material.dart';
import 'package:startupnamegenerator/src/favorites_screen.dart';
import 'package:startupnamegenerator/src/home_screen.dart';

main() {
  runApp(StartupNameGeneratorApp());
}

class StartupNameGeneratorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        FavoritesScreen.routeName: (_) => FavoritesScreen(
          favoriteNames: ModalRoute.of(_).settings.arguments,
        ),
      },
      initialRoute: '/',
    );
  }
}