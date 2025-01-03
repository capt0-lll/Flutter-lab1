import 'package:flutter/material.dart';
import '../models/department.dart';

class DepartmentTile extends StatelessWidget {
  final Department department;

  const DepartmentTile({
    Key? key,
    required this.department,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: department.color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () {
          // Ваш обробник для натискання
        },
        child: GridTile(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center, // Центруємо контент по горизонталі
            mainAxisAlignment: MainAxisAlignment.center, // Центруємо контент по вертикалі
            children: [
              Text(
                department.name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center, // Центруємо текст
              ),
              SizedBox(height: 5), // Відступ між текстами
              Text(
                'Students enrolled: ${department.determineStudents()}',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: FittedBox(
                    fit: BoxFit.contain, // Зберігає пропорції і масштаб
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
