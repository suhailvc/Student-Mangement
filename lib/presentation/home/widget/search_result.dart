import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_management/application/bloc/home/home_bloc_bloc.dart';
import 'package:student_management/core/constants.dart';
import 'package:student_management/infrastructure/db_functions.dart';
import 'package:student_management/presentation/details_screen/details_screen.dart';
import 'package:student_management/presentation/editing_screen/editing_Screen.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBlocBloc, HomeBlocState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
              child: ListView.separated(
            itemCount: state.blocStudentList.length,
            separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
            itemBuilder: (context, index) {
              return ListTile(
                // onTap: () {
                //   Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //         builder: (context) => DetailsScreen(
                //             name: searchlist[inde].name,
                //             age: studentList[index].age,
                //             number: studentList[index].mobileNumber),
                //       ));
                // },
                leading: const CircleAvatar(),
                title: Text(state.blocStudentList[index].name),
                subtitle: Text(state.blocStudentList[index].age),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => EditingScreen(
                        //           id: searchlistnotifier.value[index].key,
                        //           name: searchlistnotifier.value[index].name,
                        //           age: searchlistnotifier.value[index].age,
                        //           number: searchlistnotifier
                        //               .value[index].mobileNumber),
                        //     ));
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        // deleteStudent(studentList[index].key);
                      },
                    )
                  ],
                ),
              );
            },
          )),
        );
      },
    );
  }
}
