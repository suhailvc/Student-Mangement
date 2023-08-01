import 'dart:developer';
import 'dart:io';

//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_management/application/bloc/edit_image/edit_image_bloc.dart';
import 'package:student_management/application/bloc/home/home_bloc_bloc.dart';
import 'package:student_management/core/constants.dart';
import 'package:student_management/domain/student_model.dart';

class EditingScreen extends StatelessWidget {
  final int id;
  final String name;
  final String age;
  final String number;
  final String imagePath;
  EditingScreen(
      {super.key,
      required this.imagePath,
      required this.id,
      required this.name,
      required this.age,
      required this.number});
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _numberController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  //File? editImage;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    _nameController.text = name;
    _ageController.text = age;
    _numberController.text = number;
    //File? editImage;

    //editImage = File(imagePath);
    context
        .read<EditImageBloc>()
        .add(BlocImageEdit(imagePath == 'img' ? 'img' : imagePath));
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Edit'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Form(
          key: formKey,
          child: BlocBuilder<EditImageBloc, EditImageState>(
            builder: (context, state) {
              // state.editImageInitial = imagePath;
              return Column(
                children: [
                  CircleAvatar(
                    radius: 80,
                    child: ClipOval(
                      child: (state.editImageInitial != 'img')
                          ? Image.file(
                              File(state.editImageInitial),
                              fit: BoxFit.cover,
                              width: 180,
                            )
                          : Image.asset(
                              fit: BoxFit.cover,
                              width: 180,
                              // height: 100,
                              'assets/images/149071.png'),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        selectImage(context);
                      },
                      child: const Text('Gallery')),
                  k10Height,
                  TextFormField(
                    controller: _nameController,
                    validator: (value) {
                      if (_nameController.text.isEmpty) {
                        return 'Enter the name';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: 'name'),
                  ),
                  k10Height,
                  TextFormField(
                    controller: _ageController,
                    validator: (value) {
                      if (_ageController.text.isEmpty) {
                        return 'enter the age';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: 'age'),
                  ),
                  k10Height,
                  TextFormField(
                    controller: _numberController,
                    validator: (_) {
                      if (_numberController.text.isEmpty) {
                        return 'Enter Phone number';
                      } else if (_numberController.text.length != 10) {
                        return 'Enter ten digit number';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: 'number'),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          updateStudent(context, state.editImageInitial);
                          context
                              .read<EditImageBloc>()
                              .add(BlocImageEdit('img'));
                          Navigator.pop(context);
                        }
                      },
                      child: const Text('Submit'))
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  void updateStudent(BuildContext ctx, String image) {
    var updateName = _nameController.text;
    var updateAge = _ageController.text;
    var updateNumber = _numberController.text;
    var values = StudentModel(
        imagePath: image,
        name: updateName,
        age: updateAge,
        mobileNumber: updateNumber);
    log(image);
    //editStudent(id, values);
    ctx
        .read<HomeBlocBloc>()
        .add(BlocStudentEdit(blocStudentid: id, blocStudentValue: values));
  }

  void selectImage(BuildContext ctx) async {
    final imageResult =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (imageResult != null) {
      // editImage = File(imageResult.path);
      ctx.read<EditImageBloc>().add(BlocImageEdit(imageResult.path));
    }
  }
}
