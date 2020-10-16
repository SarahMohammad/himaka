import 'package:himaka/Models/home_response.dart';
import 'package:himaka/services/api.dart';
import 'package:himaka/services/locator.dart';
import 'package:himaka/utils/globals.dart';

import 'base_model.dart';

class HomeViewModel extends BaseModel {
  HomeResponse _homeResponse;

  Api _api = locator<Api>();

  Future getHome(String lang) async {
    setState(ViewState.Busy);
    Map<String, dynamic> token = {"token": Globals.userData.token};
    _homeResponse = await _api.getHomeApi(token);
    setState(ViewState.Idle);
  }

  HomeResponse get homeResponse => _homeResponse;
}
