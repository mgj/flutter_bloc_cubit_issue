import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_cubit_issue/pages/blocbased/blocbased_event.dart';

import 'blocbased_state.dart';

class BlocBasedCubit extends Bloc<BlocBasedEvent, BlocBasedState> {
  BlocBasedCubit() : super(BlocBasedInitialState()) {
    on<BlocBasedEvent>((event, emit) {
      if (event is BlocBasedInitEvent) {
        emit(BlocBasedLoadingState());
        emit(BlocBasedReadyState());
      } else {
        throw ArgumentError("Unknown event!");
      }
    });
  }
}
