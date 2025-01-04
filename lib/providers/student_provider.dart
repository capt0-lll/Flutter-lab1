import 'package:lab1_eldar_vanin_kiuki_21_8/providers/department_provider.dart';
import 'package:lab1_eldar_vanin_kiuki_21_8/models/student.dart';

class StudentProvider {
  static final List<Student> _students = [
    Student(DepartmentProvider.getDepartments()[2], 7, Gender.female, "Melaniya", "Podolyak"),
    Student(DepartmentProvider.getDepartments()[3], 10, Gender.male, "Serhii", "Sternenko"),
    Student(DepartmentProvider.getDepartments()[1], 2, Gender.male, "Ihor", "Lachenkov"),
    Student(DepartmentProvider.getDepartments()[0], 10, Gender.female, "Hannah", "Kochehura"),
    Student(DepartmentProvider.getDepartments()[1], 7, Gender.male, "Kostyantyn", "Tremboveckii"),
    Student(DepartmentProvider.getDepartments()[2], 7, Gender.male, "Oleksii", "Kovzhun"),
  ];

  static void insertStudent(Student student, int index) {
    _students.insert(index, student);
  }

  static void deleteStudent(int index) {
    _students.removeAt(index);
  }

  static void addStudent(Student student) {
    _students.add(student);
  }

  static void updateStudent(Student student, int index) {
    _students[index] = student;
  }

  static Student getStudent(int index) {
    return _students[index];
  }

  static int getStudentsCount() {
    return _students.length;
  }
}