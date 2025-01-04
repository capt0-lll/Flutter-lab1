import 'package:flutter/material.dart';
import 'package:lab1_eldar_vanin_kiuki_21_8/models/department.dart';



class DepartmentProvider {
    static final List<Department> _departments = [
    Department("finance", "assets/finance.png", const Color.from(alpha: 1, red: 0.384, green: 0.576, blue: 0.655), 0),
    Department("it", "assets/it.png", const Color.fromARGB(255, 56, 128, 170), 1),  
    Department("law", "assets/law.png", const Color.fromARGB(255, 95, 123, 173), 2),
    Department("medical", "assets/medical.png", const Color.fromARGB(255, 71, 137, 163), 3),
    ];

    static List<Department> getDepartments() {
        return _departments;
    }
}