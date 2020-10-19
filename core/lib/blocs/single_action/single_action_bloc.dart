import 'package:bloc/bloc.dart';
import 'package:core/blocs/single_action/single_action_event.dart';
import 'package:core/blocs/single_action/singlel_action_state.dart';

class SingleActionBloc<T> extends Bloc<BaseSingleActionEvent, SingleActionState> {
  SingleActionBloc() : super(InitialSingleActionState());

  @override
  Stream<SingleActionState> mapEventToState(BaseSingleActionEvent event) async* {
    if (event is SingleActionEvent) {
      yield* _callAction(event);
    } else if (event is InterruptSingleActionEvent) {
      // Implement later
    }
  }

  Stream<SingleActionState> _callAction<T>(SingleActionEvent<T> callEvent) async* {
    try {
      yield SingleActionSuccessState<T>(await callEvent.runnable());
    } catch (error) {
      yield SingleActionErrorState(error);
    }
  }
}
