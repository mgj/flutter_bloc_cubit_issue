import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_cubit_issue/pages/blocbased/blocbased_bloc.dart';
import 'package:flutter_bloc_cubit_issue/pages/blocbased/blocbased_page.dart';
import 'package:flutter_bloc_cubit_issue/pages/cubitbased/cubitbased_cubit.dart';
import 'package:flutter_bloc_cubit_issue/pages/cubitbased/cubitbased_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      /*
      home: BlocProvider(
        create: ((context) => BlocBasedCubit()),
        child: const BlocBasedPage(),
      ),
      */
      home: BlocProvider(
        create: ((context) => CubitBasedCubit()),
        child: const CubitBasedPage(),
      ),
    );
  }
}