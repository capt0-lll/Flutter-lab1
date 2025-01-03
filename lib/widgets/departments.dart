import 'package:flutter/material.dart';
import 'package:lab1_eldar_vanin_kiuki_21_8/models/department.dart';
import 'department_item.dart';

List<Department> departments = [
    Department("finance", "assets/finance.png", const Color.from(alpha: 1, red: 0.384, green: 0.576, blue: 0.655), 0),
    Department("it", "assets/it.png", const Color.fromARGB(255, 56, 128, 170), 1),  
    Department("law", "assets/law.png", const Color.fromARGB(255, 95, 123, 173), 2),
    Department("medical", "assets/medical.png", const Color.fromARGB(255, 71, 137, 163), 3),
    ];

class DepartmentGridView extends StatefulWidget {
  const DepartmentGridView({super.key});
  @override
  DepartmentGridViewState createState() => DepartmentGridViewState();
}

class DepartmentGridViewState extends State<DepartmentGridView> {
  Widget build (BuildContext context){
    return GridView.builder(
      itemCount: departments.length,
      itemBuilder: (context, index){
        final department = departments[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: DepartmentTile(
            department: department,
          ),
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}