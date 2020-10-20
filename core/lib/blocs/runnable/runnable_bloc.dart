import 'package:bloc/bloc.dart';
import 'package:core/blocs/runnable/runnable_event.dart';
import 'package:core/blocs/runnable/runnable_state.dart';

class RunnableBloc<T> extends Bloc<RunnableEvent, RunnableState> {
  RunnableBloc() : super(InitialRunnableState());

  @override
  Stream<RunnableState> mapEventToState(RunnableEvent event) async* {
    if (event is RunEvent) {
      yield* _callAction(event);
    } else if (event is InterruptEvent) {
      // Implement later
    }
  }

  Stream<RunnableState> _callAction(RunEvent<T> event) async* {
    try {
      yield RunSuccessState<T>(await event.runnable());
    } catch (error) {
      yield RunErrorState(error.toString());
    }
  }
}
