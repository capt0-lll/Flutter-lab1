import 'package:flutter/material.dart';
import 'package:lab1_eldar_vanin_kiuki_21_8/models/department.dart';


final Map<Gender, Color> GenderColor = {
  Gender.male: const Color.fromARGB(255, 58, 31, 211),
  Gender.female: const Color.fromARGB(255, 60, 200, 224)
};

enum Gender { male, female }

class Student {
  String firstName;
  String lastName;
  Gender gender;
  int grade;
  Department department;

  Student(
      this.department, this.grade, this.gender, this.firstName, this.lastName);
}
