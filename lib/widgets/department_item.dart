import 'package:flutter/material.dart';
import '../models/department.dart';

class DepartmentTile extends StatelessWidget {
  final Department department;

  const DepartmentTile({
    super.key,
    required this.department,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: department.color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () {
        },
        child: GridTile(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center, 
            mainAxisAlignment: MainAxisAlignment.center, 
            children: [
              Text(
                department.name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center, 
              ),
              SizedBox(height: 5),
              Text(
                'Students enrolled: ${department.determineStudents()}',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: FittedBox(
                    fit: BoxFit.contain, 
                    child: Image.asset(department.icon),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
