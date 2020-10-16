import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ApiHeaders {
  static const endpoint = 'http://5himaka.adologysolutions.com/api';
  static const userEndpoint = '/user';
  var client = new http.Client();

  // Future<Response> formDataRequest({@required String path, map}) async {
  //   FormData formData = FormData.fromMap(map);
  //   try {
  //     Response response = await Dio().post('$endpoint$path',
  //         data: formData,
  //         options: Options(
  //             followRedirects: false,
  //             validateStatus: (status) {
  //               return status < 500;
  //             }));
  //     return response;
  //   } on Exception catch (_) {
  //     return null;
  //   }
  // }

  Future<Response> getFormDataRequest({@required String path, map}) async {
    String basicAuth = 'Basic ' +
        base64Encode(utf8.encode('himakaFlutter:NjtzfEriTFd7eMe6GuU9nrvi'));
    try {
      Response response = await Dio().request('$endpoint$path',
          data: map,
          options: Options(
              method: "GET",
              headers: <String, String>{'authorization': basicAuth},
              followRedirects: false,
              validateStatus: (status) {
                return status < 500;
              }));
      return response;
    } on Exception catch (_) {
      return null;
    }
  }

  Future<Response> genericPostFormDataRequest(
      {@required String path, map}) async {
    String basicAuth = 'Basic ' +
        base64Encode(utf8.encode('himakaFlutter:NjtzfEriTFd7eMe6GuU9nrvi'));
    try {
      Response response = await Dio().post('$endpoint$path',
          data: map,
          options: Options(
              headers: <String, String>{'authorization': basicAuth},
              followRedirects: false,
              validateStatus: (status) {
                return status < 500;
              }));
      return response;
    } on Exception catch (_) {
      return null;
    }
  }

  Future<Response> postFormDataRequest({@required String path, map}) async {
    String basicAuth = 'Basic ' +
        base64Encode(utf8.encode('himakaFlutter:NjtzfEriTFd7eMe6GuU9nrvi'));
    try {
      Response response = await Dio().post('$endpoint$userEndpoint$path',
          data: map,
          options: Options(
              headers: <String, String>{'authorization': basicAuth},
              followRedirects: false,
              validateStatus: (status) {
                return status < 500;
              }));
      return response;
    } on Exception catch (_) {
      return null;
    }
  }

  Future<Response> test({@required String path, map}) async {
    String basicAuth = 'Basic ' +
        base64Encode(utf8.encode('himakaFlutter:NjtzfEriTFd7eMe6GuU9nrvi'));
    try {
      Response response = await Dio().post('$endpoint$userEndpoint$path',
          data: FormData.fromMap(map),
          options: Options(
              headers: <String, String>{'authorization': basicAuth},
              followRedirects: false,
              validateStatus: (status) {
                return status < 500;
              }));
      return response;
    } on Exception catch (_) {
      return null;
    }
  }
}
