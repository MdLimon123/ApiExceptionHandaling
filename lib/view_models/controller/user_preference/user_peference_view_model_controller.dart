import 'package:mvvm_pattern/models/login/login_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPeference {
  Future<bool> saveUser(LoginResponseModel responseModel) async {
    SharedPreferences prefe = await SharedPreferences.getInstance();
    prefe.setString('token', responseModel.token.toString());
    prefe.setBool('isLogin', responseModel.isLogin!);
    return true;
  }

  Future<LoginResponseModel> getUser() async {
    SharedPreferences prefe = await SharedPreferences.getInstance();
    String? token = prefe.getString('token');
    bool? isLogin = prefe.getBool('isLogin');
    return LoginResponseModel(token: token, isLogin: isLogin);
  }

  Future<bool> removeUser() async {
    SharedPreferences prefe = await SharedPreferences.getInstance();
    prefe.clear();
    return true;
  }
}
