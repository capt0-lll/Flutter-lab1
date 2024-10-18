import 'package:flutter/material.dart';
import '../models/student.dart';
import 'student_item.dart';

class StudentListView extends StatelessWidget {
  final List<Student> students = [
    Student(Department.finance, 7, Gender.female, "Melaniya", "Podolyak"),
    Student(Department.it, 10, Gender.male, "Serhii", "Sternenko"),
    Student(Department.finance, 2, Gender.male, "Ihor", "Lachebkov"),
    Student(Department.it, 10, Gender.female, "Hannah", "Kochehura"),
    Student(Department.law, 7, Gender.male, "Kostyantyn", "Tremboveckii"),
    Student(Department.medical, 7, Gender.male, "Oleksii", "Kovzhun"),
    Student(Department.law, 9, Gender.male, "Fahrudin", "Sharahmal"),
    Student(Department.law, 7, Gender.female, "Svitlana", "Nemonezhina"),
    Student(Department.medical, 10, Gender.male, "Oleksandr", "Zhypetskii"),
    Student(Department.finance, 8, Gender.female, "Albina", "Titova"),
    Student(Department.law, 9, Gender.male, "Svyatoslav", "Zagaikevich"),
    Student(Department.it, 7, Gender.male, "Serhii", "Chyrkov"),
    Student(Department.law, 4, Gender.female, "Anastasiya", "Lipko"),
    Student(Department.medical, 5, Gender.female, "Alla", "Volkova"),
    Student(Department.medical, 8, Gender.male, "Serhii", "Stepanysko"),
    Student(Department.law, 8, Gender.female, "Kateryna", "Fedorkova"),
    Student(Department.it, 9, Gender.male, "Olexandr", "Avdiev"),
    Student(Department.medical, 9, Gender.female, "Olexandra", "Hontar"),
    Student(Department.law, 10, Gender.male, "Ehor", "Shatailo"),
  ];

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
                grade: student.grade));
      },
    );
  }
}
