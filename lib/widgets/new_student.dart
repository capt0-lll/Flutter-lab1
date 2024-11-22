import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/student.dart';
import './students.dart';

class NewStudent extends StatefulWidget {
  @override
  _NewStudentState createState() => _NewStudentState();
}

class _NewStudentState extends State<NewStudent> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _gradeController = TextEditingController();

  Department department = Department.finance;
  Gender gender = Gender.male;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _firstNameController,
            decoration: InputDecoration(
              labelText: "First name",
              border: OutlineInputBorder(),
            ),
          ),
          TextField(
            controller: _lastNameController,
            decoration: InputDecoration(
              labelText: "Last name",
              border: OutlineInputBorder(),
            ),
          ),
          TextField(
            controller: _gradeController,
            keyboardType:
                TextInputType.numberWithOptions(signed: false, decimal: false),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^[1-9]$|^10$')),
            ],
            decoration: InputDecoration(
              labelText: "Grade",
              border: OutlineInputBorder(),
            ),
          ),
          DropdownButton<Department>(
            value: department,
            items: Department.values.map((department) {
              return DropdownMenuItem<Department>(
                value: department,
                child: Text(department.toString().split('.').last),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                department = value!;
              });
            },
            isExpanded: true,
          ),
          DropdownButton<Gender>(
            value: gender,
            items: Gender.values.map((gender) {
              return DropdownMenuItem<Gender>(
                value: gender,
                child: Text(gender.toString().split('.').last),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                gender = value!;
              });
            },
            isExpanded: true,
          ),
          Row(children: [
            ElevatedButton(
              onPressed: () {
                final newStudent = Student(
                    department,
                    int.parse(_gradeController.text),
                    gender,
                    _firstNameController.text,
                    _lastNameController.text);
                StudentListView.addStudent(newStudent);
                Navigator.pop(context);
              },
              child: Text("Add Student"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancel"),
            )
          ])
        ],
      ),
    );
  }
}

void showNewStudentModalWindow(BuildContext context) {
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return NewStudent();
      });
}
