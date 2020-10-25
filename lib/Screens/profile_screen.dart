import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:himaka/Models/ProfileResponse.dart';
import 'package:himaka/ViewModels/base_model.dart';
import 'package:himaka/ViewModels/profile_view_model.dart';
import 'package:himaka/services/base_view.dart';
import 'package:himaka/utils/show_toast.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool textSetInitialVal = false;
  TextEditingController _nameController,
      _emailController,
      _phoneController,
      _nationalIdController,
      _secNameController;

  TextEditingController _oldPassController = new TextEditingController();
  TextEditingController _newPasswordController = new TextEditingController();
  TextEditingController _repeatPassController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.grey[900], //change your color here
          ),
          centerTitle: true,
          title: Text(
            'Personal Details',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: BaseView<ProfileViewModel>(
            onModelReady: (model) {
              refreshScreen(model);
            },
            builder: (context, model, child) => LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints viewportConstraints) {
                  if (!textSetInitialVal && model.profileResponse != null) {
                    textSetInitialVal = true;
                    textFormConfiguration(context, model);
                  }

                  return model.state == ViewState.Busy
                      ? Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.lightBlue,
                          ),
                        )
                      : model.profileResponse != null
                          ? SingleChildScrollView(
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.person,
                                    size: 150,
                                  ),
                                  Text(
                                    model.profileResponse.data.user.firstName +
                                        " " +
                                        model
                                            .profileResponse.data.user.lastName,
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                            color: Colors.lightBlueAccent,
                                          )),
                                      child: Padding(
                                        padding: const EdgeInsets.all(13.0),
                                        child: Container(
                                          child: Column(
                                            children: [
                                              TextField(
                                                controller: _nameController,
                                                keyboardType:
                                                    TextInputType.text,
                                                decoration: new InputDecoration(
                                                  labelText: 'First Name',
                                                  labelStyle: TextStyle(
                                                      color: Colors.black),
                                                  prefixIcon: Icon(Icons.person,
                                                      color: Colors.black),
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.black),
                                                  ),
                                                  focusedBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.black),
                                                  ),
                                                ),
                                              ),
                                              TextField(
                                                controller: _secNameController,
                                                keyboardType:
                                                    TextInputType.text,
                                                decoration: new InputDecoration(
                                                  labelText: 'Last Name',
                                                  labelStyle: TextStyle(
                                                      color: Colors.black),
                                                  prefixIcon: Icon(Icons.person,
                                                      color: Colors.black),
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.black),
                                                  ),
                                                  focusedBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.black),
                                                  ),
                                                ),
                                              ),
                                              TextField(
                                                controller: _phoneController,
                                                keyboardType:
                                                    TextInputType.phone,
                                                decoration: new InputDecoration(
                                                  prefixIcon: Icon(Icons.phone,
                                                      color: Colors.black),
                                                  labelText: 'Phone number',
                                                  labelStyle: TextStyle(
                                                      color: Colors.black),
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.black),
                                                  ),
                                                  focusedBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.black),
                                                  ),
                                                ),
                                              ),
                                              TextField(
                                                controller: _emailController,
                                                keyboardType:
                                                    TextInputType.emailAddress,
                                                enabled: false,
                                                decoration: new InputDecoration(
                                                  labelText: 'Email',
                                                  labelStyle: TextStyle(
                                                      color: Colors.black),
                                                  prefixIcon: Icon(Icons.email,
                                                      color: Colors.black),
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.black),
                                                  ),
                                                  focusedBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.black),
                                                  ),
                                                ),
                                              ),
                                              TextField(
                                                controller:
                                                    _nationalIdController,
                                                keyboardType:
                                                    TextInputType.number,
                                                enabled: false,
                                                decoration: new InputDecoration(
                                                  labelText: 'National id',
                                                  labelStyle: TextStyle(
                                                      color: Colors.black),
                                                  prefixIcon: Icon(
                                                    Icons.credit_card,
                                                    color: Colors.black,
                                                  ),
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.black),
                                                  ),
                                                  focusedBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.black),
                                                  ),
                                                ),
                                              ),
                                              TextField(
                                                controller: _oldPassController,
                                                keyboardType:
                                                    TextInputType.text,
                                                obscureText: true,
                                                decoration: new InputDecoration(
                                                  labelText: 'Old Password',
                                                  labelStyle: TextStyle(
                                                      color: Colors.black),
                                                  prefixIcon: Icon(
                                                    Icons.lock,
                                                    color: Colors.black,
                                                  ),
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.black),
                                                  ),
                                                  focusedBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.black),
                                                  ),
                                                ),
                                              ),
                                              TextField(
                                                controller:
                                                    _newPasswordController,
                                                keyboardType:
                                                    TextInputType.text,
                                                obscureText: true,
                                                decoration: new InputDecoration(
                                                  labelText: 'New Password',
                                                  labelStyle: TextStyle(
                                                      color: Colors.black),
                                                  prefixIcon: Icon(
                                                    Icons.lock,
                                                    color: Colors.black,
                                                  ),
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.black),
                                                  ),
                                                  focusedBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.black),
                                                  ),
                                                ),
                                              ),
                                              TextField(
                                                controller:
                                                    _repeatPassController,
                                                keyboardType:
                                                    TextInputType.text,
                                                obscureText: true,
                                                decoration: new InputDecoration(
                                                  labelText:
                                                      'Re-Enter Passowrd',
                                                  labelStyle: TextStyle(
                                                      color: Colors.black),
                                                  prefixIcon: Icon(
                                                    Icons.lock,
                                                    color: Colors.black,
                                                  ),
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.black),
                                                  ),
                                                  focusedBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.black),
                                                  ),
                                                ),
                                              ),

//                                              Container(
//                                                  width: MediaQuery.of(context)
//                                                      .size
//                                                      .width,
//                                                  child: RaisedButton(
//                                                    color:
//                                                        Colors.lightBlueAccent,
//                                                    child: Text(
//                                                      'Change Password',
//                                                      style: TextStyle(
//                                                          color: Colors.white),
//                                                    ),
//                                                    onPressed: () {},
//                                                  )),
                                              Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  child: RaisedButton(
                                                    color:
                                                        Colors.lightBlueAccent,
                                                    child: Text('Log Out',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white)),
                                                    onPressed: () {},
                                                  ))
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 30),
                                    child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: RaisedButton(
                                          color: Colors.lightBlueAccent,
                                          child: Text(
                                            'Done',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          onPressed: () async {
                                            if (_newPasswordController.text ==
                                                _repeatPassController.text) {
                                              await model.setProfileDetails(
                                                "",
                                                _nameController.text
                                                    .trim()
                                                    .toString(),
                                                _secNameController.text
                                                    .trim()
                                                    .toString(),
                                                _phoneController.text
                                                    .trim()
                                                    .toString(),
                                                _oldPassController.text
                                                    .trim()
                                                    .toString(),
                                                _newPasswordController.text
                                                    .trim()
                                                    .toString(),
                                              );
                                            } else {
                                              showToast(
                                                  "Mismatch Password input",
                                                  Colors.red);
                                            }
                                          },
                                        )),
                                  ),
                                ],
                              ),
                            )
                          : Center(
                              child: Text('empty'),
                            );
                })));
  }

  void textFormConfiguration(BuildContext context, ProfileViewModel model) {
//    model.setWorkTimeInitialData(model.loginResponse.homeResult.centerTimeWork);

    _nameController =
        TextEditingController(text: model.profileResponse.data.user.firstName);

    _nameController.addListener(() {
      final name = _nameController.text;
      _nameController.value = _nameController.value.copyWith(
        text: name,
      );
    });

    _secNameController =
        TextEditingController(text: model.profileResponse.data.user.lastName);

    _secNameController.addListener(() {
      final name = _secNameController.text;
      _secNameController.value = _secNameController.value.copyWith(
        text: name,
      );
    });

    //mobile
    _phoneController =
        TextEditingController(text: model.profileResponse.data.user.mobile);
    _phoneController.addListener(() {
      final mobile = _phoneController.text;
      _phoneController.value = _phoneController.value.copyWith(
        text: mobile,
      );
    });

    _emailController =
        TextEditingController(text: model.profileResponse.data.user.email);
    _emailController.addListener(() {
      final mobile = _emailController.text;
      _emailController.value = _emailController.value.copyWith(
        text: mobile,
      );
    });

    _nationalIdController =
        TextEditingController(text: model.profileResponse.data.user.nationalId);
    _nationalIdController.addListener(() {
      final mobile = _nationalIdController.text;
      _nationalIdController.value = _nationalIdController.value.copyWith(
        text: mobile,
      );
    });

//    _descController = model
//            .loginResponse.homeResult.customerInfo.centerDescription.isNotEmpty
//        ? TextEditingController(
//            text: model.loginResponse.homeResult.customerInfo.centerDescription)
//        : TextEditingController();
//    _descController.addListener(() {
//      final mobile = _descController.text;
//      _descController.value = _descController.value.copyWith(
//        text: mobile,
//      );
//    });
  }

  void refreshScreen(ProfileViewModel model) {
    model.getProfileDetails("");
  }
}
