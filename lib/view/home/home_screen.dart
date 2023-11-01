import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_pattern/data/response/status.dart';
import 'package:mvvm_pattern/res/colors/app_color.dart';
import 'package:mvvm_pattern/res/components/general_exception.dart';
import 'package:mvvm_pattern/res/components/internet_exceptions_widget.dart';
import 'package:mvvm_pattern/res/routes/routes_name.dart';
import 'package:mvvm_pattern/view_models/controller/home/home_view_model_controller.dart';
import 'package:mvvm_pattern/view_models/controller/user_preference/user_peference_view_model_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UserPeference userPeference = UserPeference();

  final _homeController = Get.put(HomeviewModelController());

  @override
  void initState() {
    _homeController.userListApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                userPeference.removeUser().then((value) {
                  Get.toNamed(RouteName.loginScreen);
                });
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Obx(() {
        switch (_homeController.rxRequestStatus.value) {
          case Status.LOADING:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case Status.ERROR:
            if (_homeController.error.value == 'No internet') {
              return InternetExceptionWidget(onPress: () {
                _homeController.refreshtApi();
              });
            } else {
              return GeneralExceptionWidget(onPress: () {
                _homeController.refreshtApi();
              });
            }

          case Status.COMPLETED:
            return ListView.builder(
                itemCount: _homeController.userList.value.data!.length,
                itemBuilder: (context, index) {
                  var result = _homeController.userList.value.data![index];
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(result.avatar.toString()),
                      ),
                      title: Text(result.firstName.toString()),
                      subtitle: Text(result.lastName.toString()),
                    ),
                  );
                });
        }
      }),
    );
  }
}
