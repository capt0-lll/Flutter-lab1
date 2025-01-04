import 'package:flutter/material.dart';
import 'package:lab1_eldar_vanin_kiuki_21_8/models/student.dart';
import '../providers/student_provider.dart';

class Department {
  final String name;
  final String icon;
  final Color color;
  final int id;
  List<Student> students = [];
  Department(this.name, this.icon, this.color, this.id);

  int determineStudents() {
    students = [];
    for (int i = 0; i < StudentProvider.getStudentsCount(); i++) {
      if (StudentProvider.getStudent(i).department.id == id) {
        students.add(StudentProvider.getStudent(i));
      }
    }
    return students.length;
  }
}