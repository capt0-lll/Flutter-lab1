import 'package:flutter/material.dart';
import './widgets/students.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Students'),
        ),
        body: StudentListView(),
      ),
    );
  }
}
