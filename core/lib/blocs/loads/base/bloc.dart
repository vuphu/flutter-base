import 'package:bloc/bloc.dart';
import 'package:core/blocs/loads/base/state.dart';
import 'package:injectable/injectable.dart';

import 'event.dart';

@injectable
class LoadBloc extends Bloc<LoadEvent, LoadState> {
  LoadBloc() : super(InitialLoadState());

  @override
  Stream<LoadState> mapEventToState(LoadEvent event) async* {
    if (event is LoadingEvent) {
      yield* _loading(event);
    }
  }

  Stream<LoadState> _loading<T>(LoadingEvent<T> event) async* {
    yield LoadingState();
    try {
      yield await event.mapEventToState();
    } catch (e) {
      yield LoadErrorState(e.toString());
    }
  }
}
