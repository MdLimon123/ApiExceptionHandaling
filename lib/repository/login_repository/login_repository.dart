import 'package:mvvm_pattern/data/network/network_api_servicaes.dart';
import 'package:mvvm_pattern/res/app_url/app_url.dart';

class LoginRepository {
  final _apiService = NetworkApiServices();

  Future<dynamic> loginApi(var data) async {
    dynamic response = _apiService.postApi(data, AppUrl.loginApi);
    return response;
  }
}
