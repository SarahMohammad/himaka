import 'package:himaka/Models/home_response.dart';
import 'package:himaka/Models/login_response.dart';
import 'package:himaka/Models/pre_register_response.dart';
import 'package:himaka/Models/search_response.dart';
import 'package:himaka/Models/wishlist_response.dart';
import 'package:http/http.dart' as http;

import 'api_headers.dart';

class Api {
  static const loginURL = '/login';
  static const registerURL = '/register';
  static const preRegisterURL = '/pre_register';
  static const homeUrl = "/home";
  static const wishListUrl = "/wishlist";
  static const searchURL = '/serach/ProductsOrService';

  var client = new http.Client();
  Future<LoginResponse> login(Map body) async {
    var response =
        await ApiHeaders().postFormDataRequest(path: loginURL, map: body);
    if (response != null) {
      return LoginResponse.fromJson(response.data);
    } else {
      return null;
    }
  }

  Future<LoginResponse> register(Map body) async {
    var response =
        await ApiHeaders().postFormDataRequest(path: registerURL, map: body);
    if (response != null) {
      return LoginResponse.fromJson(response.data);
    } else {
      return null;
    }
  }

  Future<PreRegisterResponse> preRegister(Map body) async {
    var response =
        await ApiHeaders().getFormDataRequest(path: preRegisterURL, map: body);
    if (response != null) {
      return PreRegisterResponse.fromJson(response.data);
    } else {
      return null;
    }
  }

  Future<SearchResponse> search(Map body) async {
    var response = await ApiHeaders()
        .genericPostFormDataRequest(path: searchURL, map: body);
    if (response != null) {
      return SearchResponse.fromJson(response.data);
    } else {
      return null;
    }
  }

  Future<HomeResponse> getHomeApi(Map body) async {
    var response =
        await ApiHeaders().genericPostFormDataRequest(path: homeUrl, map: body);
    if (response != null) {
      return HomeResponse.fromJson(response.data);
    } else {
      return null;
    }
  }

  Future<WishListResponse> getWishListApi(Map body) async {
    var response = await ApiHeaders().test(path: wishListUrl, map: body);
    if (response != null) {
      return WishListResponse.fromJson(response.data);
    } else {
      return null;
    }
  }

//  Future<RegisterResponse> register(Map body) async {
//    var response =
//    await ApiHeaders().postFormDataRequest(path: registerURL, map: body);
//    if (response != null) {
//      return LoginResponse.fromJson(response.data);
//    } else {
//      return null;
//    }
//  }
//
//
//
//  Future<RecommendedResponse> getRestaurantBy(
//      Map body, String apiToken, int path) async {
//    var response = await ApiHeaders().postFormDataRequest(
//        path: path == 1
//            ? getRestaurantByCatURL
//            : path == 2
//            ? getBranchesByRestURL
//            : path == 3
//            ? getCategoriesURL
//            : path == 4 ? getNearBranchesURL : searchRestaurantURL,
//        bearerToken: apiToken,
//        map: body);
//    if (response != null) {
//      return RecommendedResponse.fromJson(response.data);
//    } else {
//      return null;
//    }
//  }

}
