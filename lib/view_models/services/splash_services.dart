import 'dart:async';

import 'package:get/get.dart';
import 'package:mvvm_pattern/res/routes/routes_name.dart';
import 'package:mvvm_pattern/view_models/controller/user_preference/user_peference_view_model_controller.dart';

class SplashServices {
  UserPeference userPeference = UserPeference();
  void isLogin() {
    userPeference.getUser().then((value) {
      print(value.token);
      print(value.isLogin);
      if (value.isLogin == false || value.isLogin.toString() == 'null') {
        Timer(const Duration(seconds: 3),
            () => Get.toNamed(RouteName.loginScreen));
      } else {
        Timer(const Duration(seconds: 3),
            () => Get.toNamed(RouteName.homeScreen));
      }
    });
  }
}
