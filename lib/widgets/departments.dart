import 'package:flutter/material.dart';
import 'department_item.dart';
import '../providers/department_provider.dart';

class DepartmentGridView extends StatefulWidget {
  const DepartmentGridView({super.key});
  @override
  DepartmentGridViewState createState() => DepartmentGridViewState();
}

class DepartmentGridViewState extends State<DepartmentGridView> {
  @override
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