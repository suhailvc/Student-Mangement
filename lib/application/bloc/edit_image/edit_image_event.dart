part of 'edit_image_bloc.dart';

class EditImageEvent {}

class BlocImageEdit extends EditImageEvent {
  String editImagBloc;

  BlocImageEdit(this.editImagBloc);
}
