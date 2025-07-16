import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../common/widgets.dart';
import 'data_binder.dart';

mixin UIHandler on DataBinder {
  Future<void> toastError(String message) async {
    FToast()
      ..init(context!)
      ..showToast(
        child: ErrorToast(message: message),
        gravity: ToastGravity.BOTTOM,
        toastDuration: Duration(seconds: 2),
      );
  }
}

mixin RiverpodExecution on DataBinder {
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
