import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubitbased_state.dart';

class CubitBasedCubit extends Cubit<CubitBasedState> {
  CubitBasedCubit() : super(CubitBasedInitialState());

  Future<void> init() async {
    emit(CubitBasedLoadingState());
    emit(CubitBasedReadyState());
  }
}
