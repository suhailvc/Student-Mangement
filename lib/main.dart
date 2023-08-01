import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:student_management/application/bloc/edit_image/edit_image_bloc.dart';
import 'package:student_management/application/bloc/home/home_bloc_bloc.dart';
import 'package:student_management/application/bloc/student_adding/student_adding_bloc_bloc.dart';
import 'package:student_management/domain/student_model.dart';
import 'package:student_management/infrastructure/db_functions.dart';
import 'package:student_management/presentation/home/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(StudentModelAdapter().typeId)) {
    Hive.registerAdapter(StudentModelAdapter());
  }
  await studenModelDbFunction();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<HomeBlocBloc>(
            create: (context) => HomeBlocBloc(),
          ),
          BlocProvider<StudentAddingBlocBloc>(
            create: (context) => StudentAddingBlocBloc(),
          ),
          BlocProvider<EditImageBloc>(
            create: (context) => EditImageBloc(),
          )
        ],
        child: MaterialApp(
          theme: ThemeData(primarySwatch: Colors.amber),
          home: const HomeScreen(),
          debugShowCheckedModeBanner: false,
        ));
  }
}
