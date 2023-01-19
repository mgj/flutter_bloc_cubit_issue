import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubitbasedworkaround_cubit.dart';
import 'cubitbasedworkaround_state.dart';

class CubitBasedWorkaroundPage extends StatelessWidget {
  const CubitBasedWorkaroundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<CubitBasedWorkaroundCubit, CubitBasedWorkaroundState>(
      builder: (context, state) {
        final cubit = context.read<CubitBasedWorkaroundCubit>();
        if (cubit.state is CubitBasedWorkaroundInitialState) {
          SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
            cubit.init();
          });
          return const CircularProgressIndicator();
        } else if (cubit.state is CubitBasedWorkaroundLoadingState) {
          log("Never called - OK");
          return const CircularProgressIndicator();
        } else if (cubit.state is CubitBasedWorkaroundReadyState) {
          log("*IS* called (unlike with normal cubit) - OK");
          return const Text("Ready!");
        } else {
          throw StateError("Unknown state");
        }
      },
    ));
  }
}
