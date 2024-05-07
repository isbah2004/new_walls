import 'package:fluttertoast/fluttertoast.dart';
import 'package:new_walls/theme/theme_data.dart';

class Utils {
  static showToastMessage({required String message}) {
    return Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: AppTheme.textBackground,
        textColor: AppTheme.whiteColor,
        fontSize: 16.0);
  }
}
