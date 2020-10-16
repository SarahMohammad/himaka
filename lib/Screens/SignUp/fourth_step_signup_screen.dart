import 'dart:convert';
import 'dart:core';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:himaka/Models/login_response.dart';
import 'package:himaka/Models/pre_register_response.dart';
import 'package:himaka/ViewModels/auth_view_model.dart';
import 'package:himaka/ViewModels/base_model.dart';
import 'package:himaka/services/base_view.dart';
import 'package:himaka/services/locator.dart';
import 'package:himaka/utils/AppLanguage.dart';
import 'package:himaka/utils/app_localizations.dart';
import 'package:himaka/utils/caching.dart';
import 'package:himaka/utils/globals.dart';
import 'package:himaka/utils/show_toast.dart';

import '../home.dart';

class FourthStepSignUpScreen extends StatefulWidget {
  PreRegisterData data;
  String firstName,
      lastName,
      email,
      password,
      cPass,
      mobile,
      mcode,
      code,
      pin,
      ques,
      answer,
      methodSubs;

  FourthStepSignUpScreen(
      {this.data,
      this.firstName,
      this.lastName,
      this.email,
      this.password,
      this.cPass,
      this.mcode,
      this.mobile,
      this.code,
      this.pin,
      this.ques,
      this.methodSubs,
      this.answer});

  @override
  State<StatefulWidget> createState() => new _FourthStepSignUpScreenState();
}

class _FourthStepSignUpScreenState extends State<FourthStepSignUpScreen> {
  final TextEditingController _methodController = new TextEditingController();
  final TextEditingController _descController = new TextEditingController();

  WithdrawMethod val;
  String phoneNumber;
  String phoneIsoCode;
  bool visible = false;
  String confirmedNumber = '';
  final _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BaseView<AuthViewModel>(
        builder: (context, model, child) => LayoutBuilder(builder:
                (BuildContext context, BoxConstraints viewportConstraints) {
              return Stack(
                children: [
                  Image.asset(
                    "images/blur_bg.jpg",
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                  new Scaffold(
                    backgroundColor: Colors.transparent,
                    key: _scaffoldKey,
                    appBar: _buildBar(context),
                    body: SafeArea(
                      child: new Container(
                          padding: EdgeInsets.all(16.0),
                          child: new Column(
                            children: <Widget>[
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                child: Text(
                                  'by creating or logging to an account you agree to out you agree to out',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 20.0),
                                width: MediaQuery.of(context).size.width,
                                child: DropdownButton<WithdrawMethod>(
                                  dropdownColor: Colors.grey,
                                  icon: Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.white,
                                  ),
                                  isExpanded: true,
                                  hint: Text(
                                    "Select the method",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  value: val,
                                  onChanged: (WithdrawMethod value) {
                                    setState(() {
                                      model.methodIdValidate=true;
                                      val = value;
                                    });
                                  },
                                  items: widget.data.withdraws_methods.map(
                                    (WithdrawMethod method) {
                                      return DropdownMenuItem<WithdrawMethod>(
                                        value: method,
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10.0),
                                              child: SvgPicture.asset(
                                                'images/icon_money.svg',
                                                height: 25.0,
                                                width: 25.0,
                                                color: Colors.white,
                                                allowDrawingOutsideViewBox:
                                                    true,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              method.name,
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ).toList(),
                                ),
                              ),
                              model.methodIdValidate
                                  ? Container()
                                  : Container(
                                      width: double.infinity,
                                      child: Text(
                                        AppLocalizations.of(context)
                                            .translate('list_error'),
                                        style: TextStyle(
                                            color: Colors.red[700],
                                            fontSize: 13),
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                              val != null
                                  ? Column(
                                      children: [
                                        new Container(
                                          child: new TextField(
                                            cursorColor: Colors.white,
                                            controller: _methodController,
                                            decoration: new InputDecoration(
                                              labelText: val.field_name,
                                              hintStyle: TextStyle(
                                                  fontSize: 20.0,
                                                  color: Colors.white),
                                              errorText: model
                                                      .methodFieldValidate
                                                  ? null
                                                  : AppLocalizations.of(context)
                                                      .translate(
                                                          'eight_validate_error'),
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.white),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ),
                                        new Container(
                                          child: new TextField(
                                            cursorColor: Colors.white,
                                            controller: _descController,
                                            decoration: new InputDecoration(
                                              labelText:
                                                  'Description the method you prefer to withdraw your money..',
                                              hintStyle: TextStyle(
                                                  fontSize: 20.0,
                                                  color: Colors.white),
                                              prefixIcon: Padding(
                                                padding:
                                                    const EdgeInsets.all(15.0),
                                                child: SvgPicture.asset(
                                                  'images/icon_desc.svg',
                                                  height: 5.0,
                                                  width: 5.0,
                                                  allowDrawingOutsideViewBox:
                                                      true,
                                                ),
                                              ),
                                              errorText: model.descValidate
                                                  ? null
                                                  : AppLocalizations.of(context)
                                                      .translate('empty_error'),
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.white),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  : Container(),
                              SizedBox(
                                height: 30,
                              ),
                              model.state == ViewState.Busy
                                  ? CircularProgressIndicator(
                                      backgroundColor: Colors.lightBlue,
                                    )
                                  : ButtonTheme(
                                      minWidth:
                                          MediaQuery.of(context).size.width,
                                      child: RaisedButton(
                                        elevation: 0.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        onPressed: () async {
                                          if (model.forthSignUpValidation(
                                              val,
                                              _methodController.text.trim(),
                                              _descController.text)) {
                                            LoginResponse loginResponse =
                                                await model.register(
                                                    locator<AppLanguage>()
                                                        .appLocal
                                                        .languageCode,
                                                    widget.cPass,
                                                    widget.mcode,
                                                    widget.code,
                                                    widget.methodSubs,
                                                    widget.firstName,
                                                    widget.lastName,
                                                    widget.email,
                                                    widget.password,
                                                    widget.mobile,
                                                    widget.pin,
                                                    widget.ques,
                                                    widget.answer,
                                                    val.id.toString(),
                                                    _methodController.text
                                                        .trim(),
                                                    _descController.text
                                                        .trim());
                                            if (loginResponse == null) {
                                              final snackBar = SnackBar(
                                                content: Text(
                                                    AppLocalizations.of(context)
                                                        .translate(
                                                            'check_network')),
                                                backgroundColor: Colors.red,
                                              );
                                              _scaffoldKey.currentState
                                                  .showSnackBar(snackBar);
                                            } else if (loginResponse.status &&
                                                loginResponse.data != null &&
                                                loginResponse.data.user !=
                                                    null) {
                                              saveLoginData(json.encode(
                                                  loginResponse.data.user));
                                              Globals.userData =
                                                  loginResponse.data.user;
                                              showToast(
                                                  AppLocalizations.of(context)
                                                      .translate(
                                                          'auth_response_success'),
                                                  Colors.green);
                                              Navigator.push(
                                                  context,
                                                  new MaterialPageRoute(
                                                      builder: (context) =>
                                                          new HomePage()));
                                            } else if (!loginResponse.status) {
                                              if((loginResponse.errors.errorsCode.keys.toList())[0]=="email")
                                              showToast(
                                                  AppLocalizations.of(context)
                                                      .translate('email_exist'),
                                                  Colors.red);
                                              else if((loginResponse.errors.errorsCode.keys.toList())[0]=="code")
                                                showToast(AppLocalizations.of(context)
                                                    .translate('code_error'),
                                                    Colors.red);
                                              else
                                                showToast(AppLocalizations.of(context)
                                                    .translate('something_went_error'),
                                                    Colors.red);
                                            } else {
                                              final snackBar = SnackBar(
                                                content: Text(
                                                    AppLocalizations.of(context)
                                                        .translate(
                                                            'check_network')),
                                                backgroundColor: Colors.red,
                                              );
                                              _scaffoldKey.currentState
                                                  .showSnackBar(snackBar);
                                            }
                                          }
                                        },
                                        padding: EdgeInsets.all(20),
                                        color: Colors.lightBlueAccent,
                                        child: Text('Next',
                                            style:
                                                TextStyle(color: Colors.white)),
                                      ),
                                    ),
                              Expanded(
                                  child: Align(
                                      alignment: FractionalOffset.bottomCenter,
                                      child: RichText(
                                        textAlign: TextAlign.center,
                                        text: new TextSpan(
                                          text:
                                              'by creating or logging to an account you agree to out ',
                                          children: <TextSpan>[
                                            new TextSpan(
                                                text: 'terms and conditions',
                                                style: new TextStyle(
                                                  decoration:
                                                      TextDecoration.underline,
                                                )),
                                            new TextSpan(text: ' and '),
                                            new TextSpan(
                                              text: 'privacy policy',
                                              style: new TextStyle(
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                              recognizer:
                                                  new TapGestureRecognizer()
                                                    ..onTap = () =>
                                                        print('Tap Here onTap'),
                                            ),
                                          ],
                                        ),
                                      )))
                            ],
                          )),
                    ),
                  ),
                ],
              );
            }));
  }

  Widget _buildBar(BuildContext context) {
    return new AppBar(
      title: new Text("Sign up"),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
    );
  }
}
