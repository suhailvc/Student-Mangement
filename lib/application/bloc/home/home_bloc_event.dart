part of 'home_bloc_bloc.dart';

@immutable
abstract class HomeBlocEvent {}

class BlocStudentAdd extends HomeBlocEvent {
  StudentModel blocStudent;

  BlocStudentAdd({required this.blocStudent});
}

class BlocStudentDelete extends HomeBlocEvent {
  int index;

  BlocStudentDelete({required this.index});
}

class BlocStudentSearch extends HomeBlocEvent {
  String blocSearchdata;

  BlocStudentSearch(this.blocSearchdata);
}

class BlocStudentEdit extends HomeBlocEvent {
  int blocStudentid;
  StudentModel blocStudentValue;

  BlocStudentEdit(
      {required this.blocStudentid, required this.blocStudentValue});
}
