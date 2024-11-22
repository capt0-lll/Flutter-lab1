import 'package:flutter/material.dart';
import './widgets/students.dart';
import './widgets/new_student.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: AppScaffold());
  }
}

class AppScaffold extends StatelessWidget {
  final _studentListViewKey = GlobalKey<StudentListViewState>();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Students'),
        actions: [
          ElevatedButton(
            onPressed: () {
              showNewStudentModalWindow(
                  context, _studentListViewKey.currentState?.addStudent, null);
            },
            child: const Icon(Icons.add, size: 40),
          ),
        ],
      ),
      body: StudentListView(key: _studentListViewKey),
    );
  }
}
