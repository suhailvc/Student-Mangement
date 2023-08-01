//import 'dart:html';

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_management/application/bloc/home/home_bloc_bloc.dart';
import 'package:student_management/application/bloc/student_adding/student_adding_bloc_bloc.dart';
import 'package:student_management/core/constants.dart';
import 'package:student_management/domain/student_model.dart';
import 'package:student_management/infrastructure/db_functions.dart';
import 'package:student_management/presentation/home/home_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

String selectedImage = 'img';

class StudentAdding extends StatelessWidget {
  StudentAdding({super.key});

  final nameController = TextEditingController();

  final ageController = TextEditingController();

  final numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: formKey,
          child: BlocBuilder<StudentAddingBlocBloc, StudentAddingBlocState>(
            builder: (context, state) {
              return Column(
                children: [
                  ClipOval(
                      child: SizedBox.fromSize(
                          size: const Size.fromRadius(60),
                          child: state.imagePath != 'img'
                              ? Image.file(
                                  File(state.imagePath),
                                  fit: BoxFit.cover,
                                )
                              : Image.asset(
                                  'assets/images/149071.png',
                                  fit: BoxFit.cover,
                                ))),
                  k10Height,
                  ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.blue)),
                      onPressed: () {
                        imagePicker(context);
                      },
                      child: const Text('Select image from Gallery')),
                  k10Height,
                  TextFormField(
                      controller: nameController,
                      validator: (value) {
                        if (nameController.text.isEmpty) {
                          return 'Enter the name';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          labelText: 'Enter the name',
                          border: OutlineInputBorder())),
                  k10Height,
                  TextFormField(
                    controller: ageController,
                    validator: (value) {
                      if (ageController.text.isEmpty) {
                        return 'enter the age';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter your age'),
                  ),
                  k10Height,
                  TextFormField(
                    controller: numberController,
                    validator: (_) {
                      if (numberController.text.isEmpty) {
                        return 'Enter Phone number';
                      } else if (numberController.text.length != 10) {
                        return 'Enter ten digit number';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter your mobile number'),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          addValueButton(context, state.imagePath);
                          context
                              .read<StudentAddingBlocBloc>()
                              .add(ImageAdding('img'));
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomeScreen(),
                              ),
                              (route) => false);
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

  void addValueButton(BuildContext ctx, String? image) {
    var name = nameController.text;
    var age = ageController.text;
    var number = numberController.text;
    var data = StudentModel(
        name: name, age: age, mobileNumber: number, imagePath: image ?? 'img');
    //addStudent(data);
    log(image!);
    ctx.read<HomeBlocBloc>().add(BlocStudentAdd(blocStudent: data));
  }

  imagePicker(BuildContext ctx) async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnedImage != null) {
      // setState(() {
      //selectedImage = File(returnedImage.path);
      //});
      // return returnedImage.path;
      //  selectedImage = returnedImage.path;
      ctx.read<StudentAddingBlocBloc>().add(ImageAdding(returnedImage.path));
    }
  }
}
