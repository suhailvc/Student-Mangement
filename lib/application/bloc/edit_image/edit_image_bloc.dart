import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'edit_image_event.dart';
part 'edit_image_state.dart';

class EditImageBloc extends Bloc<EditImageEvent, EditImageState> {
  EditImageBloc() : super(EditImageInitial('img')) {
    on<BlocImageEdit>((event, emit) {
      emit(EditImageState(event.editImagBloc));
    });
  }
}
