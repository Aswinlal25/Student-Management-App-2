import 'package:flutter/material.dart';
import 'package:my_app1/db/database_helper.dart';

class StudentDetailProvider extends ChangeNotifier {
  final DatabaseHelper db = DatabaseHelper();

  Future<void> deleteStudent(int studentId) async {
    await db.deleteStudent(studentId);
  }
}
