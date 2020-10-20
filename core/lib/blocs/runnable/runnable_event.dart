class RunnableEvent {}

typedef OnAction<T> = Future<T> Function();

class RunEvent<T> extends RunnableEvent {
  final OnAction<T> runnable;

  RunEvent(this.runnable);
}

class InterruptEvent extends RunnableEvent {}
