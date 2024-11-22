import 'package:flutter/material.dart';
import './widgets/students.dart';
import './widgets/new_student.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: AppView());
  }
}

class AppView extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Students'),
        actions: [
          ElevatedButton(
            child: const Icon(Icons.add, size: 40),
            onPressed: () {
              showNewStudentModalWindow(context);
            },
          ),
        ],
      ),
      body: StudentListView(),
    );
  }
}
