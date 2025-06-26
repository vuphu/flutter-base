import 'package:fluttertoast/fluttertoast.dart';

import '../../packages/view_models/base_presenter.dart';
import '../widgets/toasts/toasts.dart';

mixin PresenterMixin on BasePresenter {
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
