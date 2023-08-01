import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:hive_flutter/adapters.dart';
import 'package:student_management/application/bloc/home/home_bloc_bloc.dart';
import 'package:student_management/infrastructure/db_functions.dart';
//import 'package:student_management/domain/student_model.dart';
//import 'package:student_management/infrastructure/db_functions.dart';
import 'package:student_management/presentation/details_screen/details_screen.dart';
import 'package:student_management/presentation/editing_screen/editing_Screen.dart';

class SearchIdle extends StatelessWidget {
  const SearchIdle({super.key});

  @override
  Widget build(BuildContext context) {
    getData();
    return BlocBuilder<HomeBlocBloc, HomeBlocState>(
      builder: (context, state) {
        return state.blocStudentList.isEmpty
            ? const Center(
                child: Text('No data'),
              )
            : ListView.separated(
                itemBuilder: (context, index) {
                  var data = state.blocStudentList[index];
                  File? image;
                  if (data.imagePath != null || data.imagePath != 'img') {
                    image = File(data.imagePath ?? 'no-img');
                  } //else {
                  //   image = File('assets/images/149071.png');
                  // }
                  return ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsScreen(
                                image: state.blocStudentList[index].imagePath!,
                                name: state.blocStudentList[index].name,
                                age: state.blocStudentList[index].age,
                                number:
                                    state.blocStudentList[index].mobileNumber),
                          ));
                    },
                    leading: CircleAvatar(
                      child: ClipOval(
                          child: (state.blocStudentList[index].imagePath !=
                                      null &&
                                  state.blocStudentList[index].imagePath !=
                                      'img')
                              ? Image.file(
                                  File(state.blocStudentList[index].imagePath!),
                                  fit: BoxFit.cover,
                                  width: 100,
                                  height: 100)
                              : Image.asset(
                                  fit: BoxFit.cover,
                                  width: 100,
                                  height: 100,
                                  'assets/images/149071.png')),
                    ),
                    title: Text(state.blocStudentList[index].name),
                    subtitle: Text(state.blocStudentList[index].age),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditingScreen(
                                      imagePath: state.blocStudentList[index]
                                              .imagePath ??
                                          'o-img',
                                      id: state.blocStudentList[index].key,
                                      name: state.blocStudentList[index].name,
                                      age: state.blocStudentList[index].age,
                                      number: state
                                          .blocStudentList[index].mobileNumber),
                                ));
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            // deleteStudent(studentList[index].key);
                            context.read<HomeBlocBloc>().add(BlocStudentDelete(
                                index: state.blocStudentList[index].key));
                          },
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                itemCount: state.blocStudentList.length);
      },
    );
  }
}
