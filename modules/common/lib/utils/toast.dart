import 'package:fluttertoast/fluttertoast.dart';

void showToast(String message, {Toast toastLength = Toast.LENGTH_SHORT}) {
  Fluttertoast.showToast(
      msg: message, toastLength: toastLength, timeInSecForIosWeb: 1);
}
