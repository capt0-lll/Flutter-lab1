import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/student.dart';
import '../widgets/students.dart';
import '../models/department.dart';
import './departments.dart';

class NewStudent extends StatefulWidget {
  final void Function(Student)? onStudentAdded;
  final int? studentIndex;

  const NewStudent({super.key, required this.onStudentAdded, this.studentIndex});

  @override
  NewStudentState createState() => NewStudentState();
}

class NewStudentState extends State<NewStudent> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _gradeController = TextEditingController();

  Department department = departments[0];
  Gender? gender = Gender.male;

  @override
  void initState() {
    super.initState();
    if (widget.studentIndex != null) {
      _firstNameController.text =
          StudentListViewState.students[widget.studentIndex!].firstName;
      _lastNameController.text =
          StudentListViewState.students[widget.studentIndex!].lastName;
      _gradeController.text =
          StudentListViewState.students[widget.studentIndex!].grade.toString();
      department =
          StudentListViewState.students[widget.studentIndex!].department;
      gender = StudentListViewState.students[widget.studentIndex!].gender;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _firstNameController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(labelText: "First name"),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z\s]*$')),
              ],
            ),
            TextField(
              controller: _lastNameController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(labelText: "Last name"),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z\s]*$')),
              ],
            ),
            TextField(
              controller: _gradeController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^[1-9]$|^10$'))
              ],
              decoration: const InputDecoration(
                labelText: "Grade",
                hintText: "Enter grade between 1 and 10",
              ),
            ),
            DropdownButton<Department>(
              value: department,
              items: departments.map((department) {
                return DropdownMenuItem(
                  value: department,
                  child: Text(department.name),
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
              items: Gender.values.map((gender) {
                return DropdownMenuItem(
                  value: gender,
                  child: Text(gender.toString().split('.').last),
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
                    final newStudent = Student(
                      department,
                      int.parse(_gradeController.text),
                      gender!,
                      _firstNameController.text,
                      _lastNameController.text,
                    );

                    if (widget.studentIndex != null) {
                      widget.onStudentAdded!(newStudent);
                      StudentListViewState.students
                          .removeAt(widget.studentIndex!);
                    } else {
                      widget.onStudentAdded!(newStudent);
                    }

                    Navigator.pop(context);
                  },
                  child: const Text("Save Student"),
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

void showNewStudentModalWindow(BuildContext context,
    void Function(Student)? addStudent, int? studentIndex) {
  showModalBottomSheet(
    context: context,
    builder: (ctx) => NewStudent(
      onStudentAdded: addStudent,
      studentIndex: studentIndex,
    ),
  );
}
