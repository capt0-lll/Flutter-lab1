import 'package:flutter/material.dart';
import '../models/student.dart';
import 'student_item.dart';

class StudentListView extends StatefulWidget {
  const StudentListView({Key? key}) : super(key: key);

  @override
  StudentListViewState createState() => StudentListViewState();
}

class StudentListViewState extends State<StudentListView> {
  final List<Student> students = [
    Student(Department.finance, 7, Gender.female, "Melaniya", "Podolyak"),
    Student(Department.it, 10, Gender.male, "Serhii", "Sternenko"),
    Student(Department.finance, 2, Gender.male, "Ihor", "Lachebkov"),
    Student(Department.it, 10, Gender.female, "Hannah", "Kochehura"),
    Student(Department.law, 7, Gender.male, "Kostyantyn", "Tremboveckii"),
    Student(Department.medical, 7, Gender.male, "Oleksii", "Kovzhun"),
  ];

  void addStudent(Student newStudent) {
    setState(() {
      students.add(newStudent);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: students.length,
      itemBuilder: (context, index) {
        final student = students[index];
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
