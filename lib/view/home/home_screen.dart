import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_pattern/res/colors/app_color.dart';
import 'package:mvvm_pattern/res/routes/routes_name.dart';
import 'package:mvvm_pattern/view_models/controller/user_preference/user_peference_view_model_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                UserPeference userPeference = UserPeference();
                userPeference.removeUser().then((value) {
                  Get.toNamed(RouteName.loginScreen);
                });
              },
              icon: Icon(Icons.logout))
        ],
      ),
    );
  }
}
