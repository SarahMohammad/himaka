import 'package:himaka/Models/home_response.dart';
import 'package:himaka/Models/orders_response.dart';
import 'package:himaka/services/api.dart';
import 'package:himaka/services/locator.dart';
import 'package:himaka/utils/globals.dart';

import 'base_model.dart';

class OrdersViewModel extends BaseModel {
  OrdersResponse _ordersResponse;

  Api _api = locator<Api>();

  Future getOrders(String lang) async {
    setState(ViewState.Busy);
    Map<String, dynamic> token = {"token": Globals.userData.token};
    _ordersResponse = await _api.getOrdersApi(token);
    setState(ViewState.Idle);
  }

  OrdersResponse get ordersResponse => _ordersResponse;
}
