import 'package:flutter/material.dart';
import '../models/student.dart';
import 'student_item.dart';

class StudentListView extends StatefulWidget {
  @override
  _StudentListViewState createState() => _StudentListViewState();

  static List<Student> students = [
    Student(Department.finance, 7, Gender.female, "Melaniya", "Podolyak"),
    Student(Department.it, 10, Gender.male, "Serhii", "Sternenko"),
    Student(Department.finance, 2, Gender.male, "Ihor", "Lachebkov"),
    Student(Department.it, 10, Gender.female, "Hannah", "Kochehura"),
    Student(Department.law, 7, Gender.male, "Kostyantyn", "Tremboveckii"),
    Student(Department.medical, 7, Gender.male, "Oleksii", "Kovzhun"),
  ];

  static void addStudent(Student newStudent) {
    students.add(newStudent);
  }
}

class _StudentListViewState extends State<StudentListView> {
  void refresh() {
    setState(() {}); // Оновлює список
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: StudentListView.students.length,
      itemBuilder: (context, index) {
        final student = StudentListView.students[index];
        final iconPath = icons[student.department];
        final colorTile = GenderColor[student.gender];

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: StudentTile(
            firstName: student.firstName,
            lastName: student.lastName,
            iconPath: iconPath,
            colorTile: colorTile,
            grade: student.grade,
          ),
        );
      },
    );
  }
}
