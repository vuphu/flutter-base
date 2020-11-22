import 'package:bloc/bloc.dart';

import 'broadcast_event.dart';
import 'broadcast_state.dart';

class BroadcastBloc<T> extends Bloc<BroadcastEvent<T>, BroadcastState<T>> {
  BroadcastBloc(T initialValue) : super(BroadcastState(initialValue));

  @override
  Stream<BroadcastState<T>> mapEventToState(BroadcastEvent<T> event) async* {
    if (event is BroadcastEvent) {
      yield _broadcast(event);
    }
  }

  BroadcastState _broadcast(BroadcastEvent<T> event) {
    return BroadcastState<T>(event.data);
  }
}
