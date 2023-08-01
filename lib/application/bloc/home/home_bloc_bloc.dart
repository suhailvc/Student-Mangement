//import 'dart:html';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:student_management/domain/student_model.dart';
import 'package:student_management/infrastructure/db_functions.dart';

part 'home_bloc_event.dart';
part 'home_bloc_state.dart';

class HomeBlocBloc extends Bloc<HomeBlocEvent, HomeBlocState> {
  HomeBlocBloc() : super(HomeBlocInitial(blocStudentList: studentList)) {
    on<BlocStudentDelete>((event, emit) async {
      var result = await deleteStudent(event.index);
      return emit(HomeBlocState(blocStudentList: result));
    });
    on<BlocStudentAdd>(
      (event, emit) {
        addStudent(event.blocStudent);
        return emit(HomeBlocState(blocStudentList: studentList));
      },
    );
    on<BlocStudentSearch>((event, emit) {
      searchdata(event.blocSearchdata);
      return emit(HomeBlocState(blocStudentList: searchlistnotifier));
    });
    on<BlocStudentEdit>((event, emit) async {
      List<StudentModel> studentList1 =
          await editStudent(event.blocStudentid, event.blocStudentValue);
      return emit(HomeBlocState(blocStudentList: studentList1));
    });
  }
}
