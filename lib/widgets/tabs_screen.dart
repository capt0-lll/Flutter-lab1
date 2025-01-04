import 'package:flutter/material.dart';
import './students.dart';
import './new_student.dart';
import './departments.dart';

final studentListViewKey = GlobalKey<StudentListViewState>();

class TabsScreen extends StatelessWidget {

  TabsScreen({super.key});

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
                        if (studentListViewKey.currentState != null) {
                          showNewStudentModalWindow(
                            context,
                            studentListViewKey.currentState?.addOneStudent,
                            null,
                          );
                        }
                      },
                      child: const Icon(Icons.add, size: 30),
                    ),
                  ],
                ),
                body: StudentListView(key: studentListViewKey), 
              ),
            ],
          ),
        ),
      ),
    );
  }
}