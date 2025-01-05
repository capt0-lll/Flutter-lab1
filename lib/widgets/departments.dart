import 'package:flutter/material.dart';
import 'package:lab1_eldar_vanin_kiuki_21_8/providers/student_provider.dart';
import 'department_item.dart';
import '../providers/department_provider.dart';

class DepartmentGridView extends StatefulWidget {
  const DepartmentGridView({super.key});
  @override
  DepartmentGridViewState createState() => DepartmentGridViewState();
}

class DepartmentGridViewState extends State<DepartmentGridView> {
  bool _isLoading = false;
  
 
  @override
  void initState() {
    super.initState();
    _loadStudents(); // Викликаємо метод завантаження даних
  }

  Future<void> _loadStudents() async {
    setState(() {
      _isLoading = true;
    });
    await StudentProvider.getHttpStudents();
    setState(() {
      _isLoading = false;
    });
  }
  

  @override
  Widget build (BuildContext context){
    return Stack(children: [
        GridView.builder(
          itemCount: DepartmentProvider.getDepartments().length,
          itemBuilder: (context, index){
            final department = DepartmentProvider.getDepartments()[index];
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
          )
        ),
      if (_isLoading)
        Center(
          child: CircularProgressIndicator(),
        )
      ],
    );
  }
}