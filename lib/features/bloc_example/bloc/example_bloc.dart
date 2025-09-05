import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

part 'example_event.dart';
part 'example_state.dart';

class ExampleBloc extends Bloc<ExampleEvent, ExampleState> {
  ExampleBloc() : super(ExampleStateInitial()) {
    on<ExampleFindNameEvent>(_findNames);
  }

  FutureOr<void> _findNames(ExampleFindNameEvent event, Emitter<ExampleState> emit) async {
    final names = ['Enzo Zamineli', 'Mariany Januario Zamineli', 'Flutter', 'Dart'];
    emit(ExampleStateData(names: names));
  }
}
