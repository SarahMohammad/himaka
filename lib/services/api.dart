import 'package:flutter/material.dart';
import 'package:himaka/Models/ProfileResponse.dart';
import 'package:himaka/Models/add_product_response.dart';
import 'package:himaka/Models/add_review_response.dart';
import 'package:himaka/Models/customer_support_response.dart';
import 'package:himaka/Models/home_response.dart';
import 'package:himaka/Models/login_response.dart';
import 'package:himaka/Models/orders_response.dart';
import 'package:himaka/Models/pre_register_response.dart';
import 'package:himaka/Models/prep_add_product_service.dart';
import 'package:himaka/Models/prep_filter.dart';
import 'package:himaka/Models/product_service_details_response.dart';
import 'package:himaka/Models/search_response.dart';
import 'package:himaka/Models/wishlist_response.dart';
import 'package:himaka/utils/show_toast.dart';
import 'package:http/http.dart' as http;

import 'api_headers.dart';

class Api {
  static const loginURL = '/login';
  static const registerURL = '/register';
  static const preRegisterURL = '/pre_register';
  static const homeUrl = "/home";
  static const wishListUrl = "/wishlist";
  static const searchURL = '/serach/ProductsOrService';
  static const ordersUrl = "/orders";
  static const customerSupportUrl = "/customer_support";
  static const getProfileUrl = "/getUserProfileDetails";
  static const setProfileUrl = "/editUserProfileDetails";
  static const getProductOrserviceDetailsUrl = '/ProductOrServiceDetails';
  static const addReviewUrl = '/addReview';
  static const prepAddProductOrServiceURL = '/PrepAddProdouctOrService';
  static const editAddressUrl = "/editUserAddress";

  static const prepFilterURL = '/prepFilter';
  static const filterURL = '/filter';
  static const addProductOrServiceURL = '/add_product_service';

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

  Future<CustomerSupportResponse> getCustomerSupportApi() async {
    var response =
        await ApiHeaders().getFormDataRequest(path: customerSupportUrl);
    if (response != null) {
      return CustomerSupportResponse.fromJson(response.data);
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

  Future<OrdersResponse> getOrdersApi(Map body) async {
    var response =
        await ApiHeaders().postFormDataRequest(path: ordersUrl, map: body);
    if (response != null) {
      return OrdersResponse.fromJson(response.data);
    } else {
      return null;
    }
  }

  Future<ProfileResponse> getProfileApi(Map body) async {
    var response =
        await ApiHeaders().postFormDataRequest(path: getProfileUrl, map: body);
    if (response != null) {
      return ProfileResponse.fromJson(response.data);
    } else {
      return null;
    }
  }

  Future<ProfileResponse> setProfileApi(Map body) async {
    var response =
        await ApiHeaders().postFormDataRequest(path: setProfileUrl, map: body);
    if (response != null) {
      showToast(response.data['msg'], Colors.green);
      return ProfileResponse.fromJson(response.data);
    } else {
      return null;
    }
  }

  Future<LoginResponse> setAddressApi(Map body) async {
    var response =
        await ApiHeaders().postFormDataRequest(path: editAddressUrl, map: body);
    if (response != null) {
      showToast(response.data['msg'], Colors.green);
      return LoginResponse.fromJson(response.data);
    } else {
      return null;
    }
  }

  Future<ProductOrServiceDetailsResponse> getProductOrServiceDetailsApi(
      Map body) async {
    var response = await ApiHeaders().genericPostFormDataRequest(
        path: getProductOrserviceDetailsUrl, map: body);
    if (response != null) {
      return ProductOrServiceDetailsResponse.fromJson(response.data);
    } else {
      return null;
    }
  }

  Future<WishListResponse> getWishListApi(Map body) async {
    var response =
        await ApiHeaders().postFormDataRequest(path: wishListUrl, map: body);
    if (response != null) {
      return WishListResponse.fromJson(response.data);
    } else {
      return null;
    }
  }

  Future<AddReviewResponse> addReviewApi(Map body) async {
    var response = await ApiHeaders()
        .genericPostFormDataRequest(path: addReviewUrl, map: body);
    if (response != null) {
      return AddReviewResponse.fromJson(response.data);
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

  Future<AddProductResponse> addProductOrService(Map body) async {
    var response = await ApiHeaders()
        .genericPostFormDataRequest(path: addProductOrServiceURL, map: body);
    if (response != null) {
      return AddProductResponse.fromJson(response.data);
    } else {
      return null;
    }
  }

  Future<PrepFilterResponse> prepFilter(Map body) async {
    var response = await ApiHeaders()
        .genericPostFormDataRequest(path: prepFilterURL, map: body);
    if (response != null) {
      return PrepFilterResponse.fromJson(response.data);
    } else {
      return null;
    }
  }

  Future<PrepAddProductOrService> prepAddProductOrService(Map body) async {
    var response = await ApiHeaders().genericPostFormDataRequest(
        path: prepAddProductOrServiceURL, map: body);
    if (response != null) {
      return PrepAddProductOrService.fromJson(response.data);
    } else {
      return null;
    }
  }

  Future<SearchResponse> filter(Map body) async {
    var response = await ApiHeaders()
        .genericPostFormDataRequest(path: filterURL, map: body);
    if (response != null) {
      return SearchResponse.fromJson(response.data);
    } else {
      return null;
    }
  }
}
