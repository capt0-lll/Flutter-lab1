import 'package:flutter/material.dart';

enum Department { finance, law, it, medical }

final Map<Department, String> icons = {
  Department.finance: "finance.png",
  Department.it: "it.png",
  Department.law: "law.png",
  Department.medical: "medical.png"
};

final Map<Gender, Color> GenderColor = {
  Gender.male: const Color.fromARGB(255, 67, 43, 109),
  Gender.female: const Color.fromARGB(255, 10, 94, 10)
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
