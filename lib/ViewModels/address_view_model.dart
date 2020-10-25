import 'package:himaka/Models/home_response.dart';
import 'package:himaka/Models/login_response.dart';
import 'package:himaka/Models/orders_response.dart';
import 'package:himaka/services/api.dart';
import 'package:himaka/services/locator.dart';
import 'package:himaka/utils/globals.dart';

import 'base_model.dart';

class AddressViewModel extends BaseModel {
  LoginResponse _addressResponse;

  Api _api = locator<Api>();

  Future setAddress(String address) async {
    setState(ViewState.Busy);
    Map<String, dynamic> data = {
      "token": Globals.userData.token,
      "address": address
    };
    _addressResponse = await _api.setAddressApi(data);
    setState(ViewState.Idle);
  }

  LoginResponse get addressResponse => _addressResponse;
}
