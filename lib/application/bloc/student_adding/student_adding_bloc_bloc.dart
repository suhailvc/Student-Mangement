//import 'dart:io';

import 'package:bloc/bloc.dart';
//import 'package:meta/meta.dart';
//import 'package:student_management/presentation/student_adding_screen/student_adding.dart';

part 'student_adding_bloc_event.dart';
part 'student_adding_bloc_state.dart';

class StudentAddingBlocBloc
    extends Bloc<StudentAddingBlocEvent, StudentAddingBlocState> {
  StudentAddingBlocBloc() : super(StudentAddingBlocInitial('img')) {
    on<ImageAdding>((event, emit) {
      emit(StudentAddingBlocState(event.imgaeBloc));
    });
  }
}
