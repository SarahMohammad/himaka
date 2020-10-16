import 'package:himaka/Models/search_response.dart';
import 'package:himaka/ViewModels/base_model.dart';
import 'package:himaka/services/api.dart';
import 'package:himaka/services/locator.dart';
import 'package:himaka/utils/globals.dart';

class SearchViewModel extends BaseModel {
  Api _api = locator<Api>();
  SearchResponse _response;
  int _page = 0;
  int _type = 0; // 1 product, 2 service

  String _visibleItemsCount = "";

  String get visibleItemsCount => _visibleItemsCount;

  set visibleItemsCount(String value) {
    _visibleItemsCount = value;
    notifyListeners();
  }

  Future search(String lang, String word) async {
    setState(ViewState.Busy);
    SearchReq req =
        new SearchReq(lang, Globals.userData.token, word, _page, _type);
    _response = await _api.search(req.searchToMap());
    setState(ViewState.Idle);
  }

  SearchResponse get response => _response;

  set type(int value) {
    _type = value;
  }
}
