part of 'student_adding_bloc_bloc.dart';

class StudentAddingBlocEvent {}

class ImageAdding extends StudentAddingBlocEvent {
  final String imgaeBloc;

  ImageAdding(this.imgaeBloc);
}
