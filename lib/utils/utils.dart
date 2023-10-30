import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:mvvm_pattern/res/colors/app_color.dart';

class Utils{

  static void fieldFocusChange(BuildContext context, FocusNode current, FocusNode nextFocus ){
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);

  }

  static toastMessage(String message){
    Fluttertoast.showToast(msg: message,
    gravity: ToastGravity.BOTTOM,
        textColor: AppColor.whiteColor,
        toastLength: Toast.LENGTH_LONG,
    backgroundColor: AppColor.blackColor);
  }

  static toastMessageCenter(String message){
    Fluttertoast.showToast(msg: message,
        gravity: ToastGravity.CENTER,
        textColor: AppColor.whiteColor,
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: AppColor.blackColor);
  }

  static snackBar(String title, String message){
    Get.snackbar(
      title,
      message
    );
  }

}