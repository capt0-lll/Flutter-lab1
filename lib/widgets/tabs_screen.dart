import 'package:flutter/material.dart';
import './students.dart';
import './new_student.dart';
import './departments.dart';


class TabsScreen extends StatelessWidget {
  final _studentListViewKey = GlobalKey<StudentListViewState>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: ScaffoldMessenger(
        key: scaffoldMessengerKey, 
        child: Scaffold(
          bottomNavigationBar: const TabBar(
            tabs: [
              Tab(text: 'Departments'),
              Tab(text: 'Students'),
            ],
          ),
          body: TabBarView(
            children: [
              Scaffold(
                appBar: AppBar(
                  title: const Text('Departments'),
                ),
                body: DepartmentGridView()),
              Scaffold(
                appBar: AppBar(
                  title: const Text('Students'),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        if (_studentListViewKey.currentState != null) {
                          showNewStudentModalWindow(
                            context,
                            _studentListViewKey.currentState?.addStudent,
                            null,
                          );
                        }
                      },
                      child: const Icon(Icons.add, size: 30),
                    ),
                  ],
                ),
                body: StudentListView(key: _studentListViewKey), 
              ),
            ],
          ),
        ),
      ),
    );
  }
}