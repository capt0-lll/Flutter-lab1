import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/student.dart';

class NewStudent extends StatefulWidget {
  final void Function(Student)? onStudentAdded;

  NewStudent({required this.onStudentAdded});

  @override
  NewStudentState createState() => NewStudentState();
}

class NewStudentState extends State<NewStudent> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _gradeController = TextEditingController();

  Department? department = Department.finance;
  Gender? gender = Gender.male;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        decoration:
            BoxDecoration(borderRadius: BorderRadius.zero, color: Colors.white),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _firstNameController,
              decoration: const InputDecoration(labelText: "First name"),
            ),
            TextField(
              controller: _lastNameController,
              decoration: const InputDecoration(labelText: "Last name"),
            ),
            TextField(
              controller: _gradeController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Grade"),
            ),
            DropdownButton<Department>(
              value: department,
              items: Department.values.map((dept) {
                return DropdownMenuItem(
                  value: dept,
                  child: Text(dept.toString().split('.').last),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  department = value!;
                });
              },
            ),
            DropdownButton<Gender>(
              value: gender,
              items: Gender.values.map((gen) {
                return DropdownMenuItem(
                  value: gen,
                  child: Text(gen.toString().split('.').last),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  gender = value!;
                });
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (widget.onStudentAdded != null) {
                      final newStudent = Student(
                        department!,
                        int.parse(_gradeController.text),
                        gender!,
                        _firstNameController.text,
                        _lastNameController.text,
                      );
                      widget.onStudentAdded!(newStudent);
                    }
                    Navigator.pop(context);
                  },
                  child: const Text("Add Student"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel"),
                ),
              ],
            ),
          ],
        ));
  }
}

void showNewStudentModalWindow(
    BuildContext context, void Function(Student)? addStudent) {
  showModalBottomSheet(
    context: context,
    builder: (ctx) => NewStudent(
      onStudentAdded: addStudent,
    ),
  );
}
