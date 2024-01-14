abstract class BasePresenter {
  void onStart() {
    // No-op
  }

  void onDestroy() {
    // No-op
  }
}

mixin WrapErrorMixin on BasePresenter {
  Future<void> wrapError<T>(
    Future<T> Function() action, {
    void Function(T data)? onSuccess,
  }) async {
    try {
      T data = await action();
      onSuccess?.call(data);
    } catch (error) {
      throw error;
    }
  }
}
