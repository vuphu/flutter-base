class BaseSingleActionEvent {}

typedef OnAction<T> = Future<T> Function();

class SingleActionEvent<T> extends BaseSingleActionEvent {
  final OnAction<T> runnable;

  SingleActionEvent(this.runnable);
}

class InterruptSingleActionEvent extends BaseSingleActionEvent {}
