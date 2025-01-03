import 'package:flutter/material.dart';
import 'package:lab1_eldar_vanin_kiuki_21_8/models/student.dart';
import 'package:lab1_eldar_vanin_kiuki_21_8/widgets/students.dart';

class Department {
  final String name;
  final String icon;
  final Color color;
  final int id;
  List<Student> students = [];
  Department(this.name, this.icon, this.color, this.id);

  int determineStudents() {
    students = StudentListViewState.students.where((student) => student.department.id == id).toList();  
    return students.length;
  }
}