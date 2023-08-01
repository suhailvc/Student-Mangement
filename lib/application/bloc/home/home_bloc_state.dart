part of 'home_bloc_bloc.dart';

class HomeBlocState {
  List<StudentModel> blocStudentList;
  HomeBlocState({required this.blocStudentList});
}

class HomeBlocInitial extends HomeBlocState {
  HomeBlocInitial({required super.blocStudentList});
}
