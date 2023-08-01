//import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:student_management/domain/student_model.dart';

late Box<StudentModel> studentModelDb;
studenModelDbFunction() async {
  studentModelDb = await Hive.openBox<StudentModel>('student_model_Db');
}

void addStudent(StudentModel value) async {
  await studentModelDb.add(value);
}

void getData() {
  studentList.clear();
  //studentList = studentModelDb.values.toList();
  studentList.addAll(studentModelDb.values);
}

deleteStudent(int id) async {
  await studentModelDb.delete(id);
  getData();
  return studentList;
}

editStudent(int id, StudentModel value) async {
  await studentModelDb.put(id, value);
  getData();
  return studentList;
}

void searchdata(String querry) {
  searchlistnotifier = studentModelDb.values
      .where((element) =>
          element.name.toLowerCase().contains(querry.trim().toLowerCase()))
      .toList();
}

List<StudentModel> searchlistnotifier = [];
List<StudentModel> studentList = [];
