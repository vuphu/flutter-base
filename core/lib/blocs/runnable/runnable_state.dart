class RunnableState {}

class InitialRunnableState extends RunnableState {}

class RunSuccessState<T> extends RunnableState {
  final T data;

  RunSuccessState(this.data);
}

class RunErrorState extends RunnableState {
  final String error;

  RunErrorState(this.error);
}
