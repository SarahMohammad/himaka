import 'package:himaka/Models/ProfileResponse.dart';
import 'package:himaka/services/api.dart';
import 'package:himaka/services/locator.dart';
import 'package:himaka/utils/globals.dart';

import 'base_model.dart';

class ProfileViewModel extends BaseModel {
  ProfileResponse _profileResponse, _editedProfileResponse;

  Api _api = locator<Api>();

  Future getProfileDetails(String lang) async {
    setState(ViewState.Busy);
    Map<String, dynamic> token = {"token": Globals.userData.token};
    _profileResponse = await _api.getProfileApi(token);
    setState(ViewState.Idle);
  }

  Future setProfileDetails(String lang, String fName, String lName,
      String phone, String oldPass, String newPass) async {
    setState(ViewState.Busy);
    Map<String, dynamic> data = {
      'token': Globals.userData.token,
      'first_name': fName,
      'last_name': lName,
      'mobile': phone,
      'old_password': oldPass,
      'new_password': newPass,
    };

    _editedProfileResponse = await _api.setProfileApi(data);
    setState(ViewState.Idle);
  }

  ProfileResponse get profileResponse => _profileResponse;
  ProfileResponse get editedProfileResponse => _editedProfileResponse;
}
