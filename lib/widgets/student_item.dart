import 'package:flutter/material.dart';

class StudentTile extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String? iconPath;
  final Color? colorTile;
  final int grade;

  const StudentTile({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.iconPath,
    this.colorTile,
    required this.grade,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: colorTile,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$firstName $lastName',
                style: TextStyle(color: Colors.white),
              ),
              Row(
                children: [
                  Image.asset(iconPath ?? '', width: 60, height: 60),
                  Text(
                    "  $grade",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
          tileColor: Colors.transparent,
        ),
      ),
    );
  }
}
