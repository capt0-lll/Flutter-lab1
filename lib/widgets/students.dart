import 'package:flutter/material.dart';
import 'package:lab1_eldar_vanin_kiuki_21_8/widgets/new_student.dart';
import '../models/student.dart';
import 'student_item.dart';
import '../providers/student_provider.dart';

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

class StudentListView extends StatefulWidget {
  const StudentListView({super.key});

  @override
  StudentListViewState createState() => StudentListViewState();
}

class StudentListViewState extends State<StudentListView> {

  void addOneStudent(Student newStudent) {
    setState(() {
      StudentProvider.addStudent(newStudent);
    });
  }
  void update() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: StudentProvider.getStudentsCount(),
      itemBuilder: (context, index) {
        final student = StudentProvider.getStudent(index);
        final iconPath = student.department.icon;
        final colorTile = GenderColor[student.gender];

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Dismissible(
              key: Key('${student.firstName}_${student.lastName}_$index'),
              background: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  child: Container(
                      height: 10,
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(Icons.delete, color: Colors.white),
                            Text(
                              "DELETE STUDENT",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ]))),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                removeStudent(index);
              },
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Material(
                      child: InkWell(
                    onTap: () {
                      setState(() {
                        showNewStudentModalWindow(context, addOneStudent, index);
                      });
                    },
                    splashColor: Colors.blue,
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: StudentTile(
                        firstName: student.firstName,
                        lastName: student.lastName,
                        iconPath: iconPath,
                        colorTile: colorTile,
                        grade: student.grade,
                      ),
                    ),
                  )))),
        );
      },
    );
  }

void removeStudent(int index) {
  var removedStudent = StudentProvider.getStudent(index);
  setState(() {
    StudentProvider.deleteStudent(index);
  });

  scaffoldMessengerKey.currentState?.showSnackBar(SnackBar(
    content: Text('Student removed'),
    action: SnackBarAction(
      label: 'Undo',
      onPressed: () {
        StudentProvider.insertStudent(removedStudent, index);

        setState(() { });
})
  
  
  ));
    }
    
  
  
}