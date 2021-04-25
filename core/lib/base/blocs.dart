import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

abstract class BaseState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitializedState extends BaseState {}

class InProgressState extends BaseState {}

class DataChangedState<T> extends BaseState {
  final T data;

  DataChangedState(this.data);
}

class ErrorState extends BaseState {
  final String message;

  ErrorState(this.message);
}

abstract class BaseBloc extends Cubit<BaseState> {
  BaseBloc() : super(InitializedState());
}

mixin SingleBlocMixin on BaseBloc {
  void single<T>(
    Future<T> Function() action, {
    required BaseState Function(T data) onSuccess,
  }) async {
    emit(InProgressState());
    try {
      T data = await action();
      emit(onSuccess(data));
    } catch (error) {
      emit(ErrorState(error.toString()));
    }
  }
}
