import 'package:flutter/material.dart';
import 'package:lab1_eldar_vanin_kiuki_21_8/widgets/tabs_screen.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyLarge: TextStyle( fontFamily: "lato"),
          bodyMedium: TextStyle( fontFamily: 'lato'),
          bodySmall: TextStyle( fontFamily: 'lato'),
        )  
      ),  
      darkTheme: ThemeData.dark(),
      home: TabsScreen(),

      );
  }
}

