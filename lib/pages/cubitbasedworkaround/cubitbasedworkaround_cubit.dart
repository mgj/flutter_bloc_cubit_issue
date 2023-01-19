import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubitbasedworkaround_state.dart';

class CubitBasedWorkaroundCubit extends Cubit<CubitBasedWorkaroundState> {
  CubitBasedWorkaroundCubit() : super(CubitBasedWorkaroundInitialState());

  Future<void> init() async {
    emit(CubitBasedWorkaroundLoadingState());
    emit(CubitBasedWorkaroundReadyState());
  }
}
