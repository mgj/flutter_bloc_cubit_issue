import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_cubit_issue/pages/cubitbased/cubitbased_cubit.dart';

import 'cubitbased_state.dart';

class CubitBasedPage extends StatelessWidget {
  const CubitBasedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<CubitBasedCubit, CubitBasedState>(
      builder: (context, state) {
        final cubit = context.read<CubitBasedCubit>();
        if (cubit.state is CubitBasedInitialState) {
          cubit.init();
          return const CircularProgressIndicator();
        } else if (cubit.state is CubitBasedLoadingState) {
          log("Never called - OK");
          return const CircularProgressIndicator();
        } else if (cubit.state is CubitBasedReadyState) {
          log("Never called - NOT OK! BROKEN BEHAVIOR!");
          return const Text("Ready!");
        } else {
          throw StateError("Unknown state");
        }
      },
    ));
  }
}
