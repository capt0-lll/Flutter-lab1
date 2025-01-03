import 'package:flutter/material.dart';
import './students.dart';
import './new_student.dart';
import './departments.dart';

// Передаємо глобальний ключ для SnackBar
class TabsScreen extends StatelessWidget {
  final _studentListViewKey = GlobalKey<StudentListViewState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: scaffoldMessengerKey, // Встановлюємо глобальний ключ для ScaffoldMessenger
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          bottomNavigationBar: const TabBar(
            tabs: [
              Tab(text: 'Departments'),
              Tab(text: 'Students'),
            ],
          ),
          body: TabBarView(
            children: [
              Center(child: DepartmentGridView()),
              Scaffold(
                appBar: AppBar(
                  title: const Text('Students'),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        if (_studentListViewKey.currentState != null) {
                          showNewStudentModalWindow(
                            context, _studentListViewKey.currentState?.addStudent, null);
                        }
                      },
                      child: const Icon(Icons.add, size: 30),
                    ),
                  ],
                ),
                body: StudentListView(key: _studentListViewKey), // Передача GlobalKey
              ),
            ],
          ),
        ),
      ),
    );
  }
}
