import 'package:flutter/material.dart';
import '../models/student.dart';

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
        final colorTile = genderColor[student.gender];

        return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Container(
                height: 100,
                decoration: BoxDecoration(
                    color: colorTile, borderRadius: BorderRadius.circular(10)),
                child: Center(
                    child: ListTile(
                        title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(student.firstName + " " + student.lastName,
                                  style: TextStyle(
                                    color: Colors.white,
                                  )),
                              Row(children: [
                                iconPath != null
                                    ? Image.asset(iconPath,
                                        width: 60, height: 60)
                                    : Icon(Icons.help),
                                Text("  " + student.grade.toString(),
                                    style: TextStyle(color: Colors.white)),
                              ])
                            ]),
                        tileColor: Colors.transparent))));
      },
    );
  }
}
