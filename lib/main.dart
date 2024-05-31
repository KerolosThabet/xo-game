import 'package:flutter/material.dart';
import 'package:xo_game/home/homeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'XO Game',
      theme: ThemeData(
        fontFamily: "PressStart2P",
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.route:(_)=> HomeScreen()
      },
      initialRoute: HomeScreen.route,
    );
  }
}

