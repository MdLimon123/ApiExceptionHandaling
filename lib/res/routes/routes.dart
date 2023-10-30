import 'package:get/get.dart';
import 'package:mvvm_pattern/res/routes/routes_name.dart';
import 'package:mvvm_pattern/view/login/login_screen.dart';
import 'package:mvvm_pattern/view/splash_screen.dart';

class AppRoutes{

  static appRoutes() =>[
    GetPage(name: RouteName.splashScreen, page:()=> SplashScreen(),
    transitionDuration: const Duration(milliseconds: 250),
    transition: Transition.leftToRightWithFade),
    GetPage(name: RouteName.loginScreen, page:()=> LoginScreen(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
  ];


}