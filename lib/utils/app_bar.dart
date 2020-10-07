import 'package:flutter/material.dart';

Widget setAppBar(String title){
  return AppBar(
    centerTitle: true,
    iconTheme: IconThemeData(
      color: Colors.grey[900], //change your color here
    ),
    title: Text(title , style: TextStyle(color:Colors.grey[900] ),),


    backgroundColor: Colors.transparent,
    elevation: 0.0,
  );
}