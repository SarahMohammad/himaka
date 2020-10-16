import 'package:himaka/Models/wishlist_response.dart';
import 'package:himaka/services/api.dart';
import 'package:himaka/services/locator.dart';
import 'package:himaka/utils/globals.dart';

import 'base_model.dart';

class WishListViewModel extends BaseModel {
  WishListResponse _wishListResponse;

  Api _api = locator<Api>();

  Future getWishList(String lang) async {
    setState(ViewState.Busy);
    Map<String, dynamic> token = {"token": Globals.userData.token};
    _wishListResponse = await _api.getWishListApi(token);
    setState(ViewState.Idle);
  }

  WishListResponse get wishListResponse => _wishListResponse;
}
