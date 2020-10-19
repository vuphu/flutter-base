class SingleActionState {}

class InitialSingleActionState extends SingleActionState {}

class SingleActionSuccessState<T> extends SingleActionState {
  final T data;

  SingleActionSuccessState(this.data);
}

class SingleActionErrorState extends SingleActionState {
  final String error;

  SingleActionErrorState(this.error);
}
