import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class BasePresenter {
  late BuildContext? context;

  void onStart(BuildContext context) {
    this.context = context;
  }

  void onDestroy() {
    this.context = null;
  }
}

mixin RiverpodExecution on BasePresenter {
  late WidgetRef? ref;

  void setRef(WidgetRef ref) {
    this.ref = ref;
  }

  @override
  void onDestroy() {
    super.onDestroy();
    ref = null;
  }

  Future<void> execute<T>(
    Future<T> Function() action,
    StateProvider<AsyncValue<T>> provider, {
    void Function(String error)? onError,
  }) async {
    final notifier = ref!.read(provider.notifier);
    notifier.state = AsyncValue.loading();
    try {
      T data = await action();
      notifier.state = AsyncValue.data(data);
    } catch (error, stackTrace) {
      notifier.state = AsyncValue.error(error, stackTrace);
      onError?.call(error.toString());
    }
  }
}
