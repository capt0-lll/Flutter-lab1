import 'dart:convert';

import 'package:lab1_eldar_vanin_kiuki_21_8/providers/department_provider.dart';
import 'package:lab1_eldar_vanin_kiuki_21_8/models/student.dart';
import 'package:http/http.dart';
import './dbAddress.dart';

// dbAddress must be specified in /lib/providers/dbAddress.dart
final String _dbAddress = dbAddress;

class StudentProvider {
  static List<Student> _students = [];

  static void insertStudent(Student student, int index) {
    _students.insert(index, student);
  }

  

  static void deleteStudentLocal(int index) {
    _students.removeAt(index);
  }

  static void addStudent(Student student) {
    _students.add(student);
    postHttpStudent(_students.length - 1);
  }

  static void updateStudent(Student student, int index) {
    _students[index] = student;
    putHttpStudent(_students[index].id!);
  }

  static Student getStudent(int index) {
    return _students[index];
  }

  static int getStudentsCount() {
    return _students.length;
  }

  static Future<void> postHttpStudent(int index) async {
    final url = Uri.parse('$_dbAddress/students.json');
    final response = await post(
      url,
      body: json.encode({
        'department': _students[index].department.id,
        'grade': _students[index].grade,
        'gender': _students[index].gender.toString(),
        'firstName': _students[index].firstName,
        'lastName': _students[index].lastName,
        'id': _students[index].id,
      }),
    );

    if (response.statusCode == 200) {
      return;
    } else {
      throw Exception('Failed to post student');
    }
  }

  static Future<void> putHttpStudent(String id) async {
    final index = _students.indexWhere((element) => element.id == id);
    final url = Uri.parse('$_dbAddress/students/' + id + '.json');
    final response = await put(
      url,
      body: json.encode({
        'department': _students[index].department.id,
        'grade': _students[index].grade,
        'gender': _students[index].gender.toString(),
        'firstName': _students[index].firstName,
        'lastName': _students[index].lastName,
        'id': id,
      })
    );
    if(response.statusCode == 200) {
      return;
    } else {
      throw Exception('Failed to put student');
    }   
  }


  static Future<void> getHttpStudents() async {
    final url = Uri.parse('$_dbAddress/students.json');
    final response = await get(url);
    final extractedData = json.decode(response.body);
    if (extractedData == null || extractedData is! Map<String, dynamic>) {
      _students = [];
      return;
    }
    List<Student> loadedStudents = [];
    extractedData.forEach((studentId, studentData) {
      loadedStudents.add(Student(
        DepartmentProvider.getDepartments()[studentData['department']],
        studentData['grade'],
        Gender.values.firstWhere((e) => e.toString() == studentData['gender']),
        studentData['firstName'],
        studentData['lastName'],
        studentId,
      ));
    });
    _students = loadedStudents;
  }
  
  static void deleteHttpStudent(String id) async {
    final url = Uri.parse('$_dbAddress/students/' + id + '.json');
    final response = await delete(url);
    getHttpStudents();
    if(response.statusCode == 200) {
      return;
    } else {
      throw Exception('Failed to delete student');
    }
  }
}