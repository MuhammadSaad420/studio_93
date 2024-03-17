import 'package:fluttertoast/fluttertoast.dart';

class ToastUtil {
  static void show({required String message}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
    );
  }
}
