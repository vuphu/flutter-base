import 'package:equatable/equatable.dart';

abstract class LoadState extends Equatable {
  const LoadState();

  @override
  List<Object> get props => [];
}

class InitialLoadState extends LoadState {}

class LoadingState extends LoadState {}

class LoadErrorState extends LoadState {
  final String error;

  LoadErrorState(this.error);
}

class LoadSuccessState<T> extends LoadState {
  final List<T> data;

  LoadSuccessState(this.data);
}
