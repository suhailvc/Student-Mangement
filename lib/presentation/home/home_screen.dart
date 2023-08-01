//import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_management/application/bloc/home/home_bloc_bloc.dart';

import 'package:student_management/infrastructure/db_functions.dart';

import 'package:student_management/presentation/home/widget/search_idle.dart';
import 'package:student_management/presentation/home/widget/search_result.dart';

import 'package:student_management/presentation/student_adding_screen/student_adding.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    getData();
    // ValueNotifier searchScreenNotifier = ValueNotifier([]);
    var searchController = TextEditingController();
    // searchController.text = 'a';
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profiles',
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
                controller: searchController,
                onChanged: (value) {
                  context.read<HomeBlocBloc>().add(BlocStudentSearch(value));
                  // searchdata(value);
                  ///  searchScreenNotifier.notifyListeners();
                  // searchlistnotifier.notifyListeners();
                  // log(searchScreenNotifier.value.toString());
                  // log(searchlistnotifier.value[1].name);
                },
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Search')),
          ),
          searchController.text.isEmpty
              ? const Expanded(child: SearchIdle())
              : const Expanded(child: SearchResult()),
          const SizedBox(
            height: 50,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => StudentAdding(),
              ));
        },
      ),
    );
  }
}
