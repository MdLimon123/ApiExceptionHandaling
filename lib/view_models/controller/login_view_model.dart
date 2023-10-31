import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_pattern/repository/login_repository/login_repository.dart';
import 'package:mvvm_pattern/utils/utils.dart';

class LoginViewModelController extends GetxController {
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final _api = LoginRepository();

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  RxBool loading = false.obs;

  void loginApi() {
    loading(true);
    Map data = {
      "email": emailController.value.text,
      "password": passwordController.value.text
    };

    _api.loginApi(data).then((value) {
      if (value['error'] == 'user not found') {
        Utils.snackBar('Login', value['error']);
      } else {
        Utils.snackBar('Login', 'Login Successfully');
      }
      loading(false);
    }).onError((error, stackTrace) {
      loading(false);
      print(error.toString());
      Utils.snackBar('Error', error.toString());
    });
  }
}
