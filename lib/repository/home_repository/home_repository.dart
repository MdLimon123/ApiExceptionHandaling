import 'package:mvvm_pattern/data/network/network_api_servicaes.dart';
import 'package:mvvm_pattern/models/home/user_list_model.dart';
import 'package:mvvm_pattern/res/app_url/app_url.dart';

class HomeRepository {
  final _apiService = NetworkApiServices();

  Future<UserListModel> userListApi() async {
    dynamic response = await _apiService.getApi(AppUrl.userListApi);

    return UserListModel.fromJson(response);
  }
}
