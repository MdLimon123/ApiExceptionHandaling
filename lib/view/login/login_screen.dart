import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_pattern/res/colors/app_color.dart';
import 'package:mvvm_pattern/res/components/round_button.dart';
import 'package:mvvm_pattern/utils/utils.dart';
import 'package:mvvm_pattern/view_models/controller/login_view_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginController = Get.put(LoginViewModelController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: Text('login'.tr),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _loginController.emailController.value,
                    focusNode: _loginController.emailFocusNode.value,
                    validator: (value) {
                      if (value!.isEmpty) {
                        Utils.snackBar('Email', 'Enter email');
                      }
                    },
                    onFieldSubmitted: (value) {
                      Utils.fieldFocusChange(
                          context,
                          _loginController.emailFocusNode.value,
                          _loginController.passwordFocusNode.value);
                    },
                    decoration: InputDecoration(
                        hintText: 'email_hint'.tr,
                        border: const OutlineInputBorder()),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _loginController.passwordController.value,
                    focusNode: _loginController.passwordFocusNode.value,
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        Utils.snackBar('Password', 'Enter Password');
                      }
                    },
                    onFieldSubmitted: (value) {},
                    decoration: InputDecoration(
                        hintText: 'password_hint'.tr,
                        border: const OutlineInputBorder()),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Obx(
              () => RoundButton(
                  width: double.infinity,
                  title: 'login'.tr,
                  loading: _loginController.loading.value,
                  onPress: () {
                    if (_formKey.currentState!.validate()) {
                      _loginController.loginApi();
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }
}
