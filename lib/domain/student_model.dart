import 'package:hive/hive.dart';
part 'student_model.g.dart';

@HiveType(typeId: 1)
class StudentModel extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  final age;
  @HiveField(2)
  final mobileNumber;
  @HiveField(3)
  String? imagePath;
  StudentModel(
      {required this.name,
      required this.age,
      required this.mobileNumber,
      this.imagePath});
}
