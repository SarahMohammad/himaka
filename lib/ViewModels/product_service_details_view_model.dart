import 'package:himaka/Models/home_response.dart';
import 'package:himaka/Models/orders_response.dart';
import 'package:himaka/Models/product_service_details_response.dart';
import 'package:himaka/services/api.dart';
import 'package:himaka/services/locator.dart';
import 'package:himaka/utils/globals.dart';

import 'base_model.dart';

class ProductServiceDetailsViewModel extends BaseModel {
  ProductOrServiceDetailsResponse _productOrServiceDetailsResponse;

  Api _api = locator<Api>();

  Future getProductOrServiceDetails(int id) async {
    setState(ViewState.Busy);
    Map<String, dynamic> data = {
      "token": Globals.userData.token,
      "item_id": id,
    };
    _productOrServiceDetailsResponse =
        await _api.getProductOrServiceDetailsApi(data);
    setState(ViewState.Idle);
  }

  ProductOrServiceDetailsResponse get productOrServiceDetailsResponse =>
      _productOrServiceDetailsResponse;
}
