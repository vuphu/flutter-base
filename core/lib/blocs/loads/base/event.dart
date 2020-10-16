import 'package:core/blocs/loads/base/state.dart';
import 'package:equatable/equatable.dart';

class LoadEvent extends Equatable {
  const LoadEvent();

  @override
  List<Object> get props => [];
}

abstract class LoadingEvent<T> extends LoadEvent {
  Future<LoadState> mapEventToState();
}

class InterruptEvent extends LoadEvent {}
