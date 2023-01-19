import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_cubit_issue/pages/blocbased/blocbased_event.dart';

import 'blocbased_bloc.dart';
import 'blocbased_state.dart';

class BlocBasedPage extends StatelessWidget {
  const BlocBasedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<BlocBasedCubit, BlocBasedState>(
      builder: (context, state) {
        final cubit = context.read<BlocBasedCubit>();
        if (cubit.state is BlocBasedInitialState) {
          cubit.add(BlocBasedInitEvent());
          return const CircularProgressIndicator();
        } else if (cubit.state is BlocBasedLoadingState) {
          log("Never called - OK");
          return const CircularProgressIndicator();
        } else if (cubit.state is BlocBasedReadyState) {
          log("*IS* called (unlike with cubit) - OK");
          return const Text("Ready!");
        } else {
          throw StateError("Unknown state");
        }
      },
    ));
  }
}
