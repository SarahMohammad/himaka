import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.grey[900], //change your color here
        ),
        centerTitle:true,
        title: Text('Personal Details' , style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Icon(Icons.language , size: 150,),
            Text('Sarah Mohammad' , style: TextStyle(fontSize: 20),),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration:  BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.lightBlueAccent,
                  )) ,
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Container(
                    child: Column(
                      children: [
                        TextField(
                          controller: null,
                          keyboardType: TextInputType.text,
                          decoration: new InputDecoration(
                            labelText: 'Name',
                            labelStyle: TextStyle(color: Colors.black),
                            prefixIcon: Icon(Icons.person , color: Colors.black),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                        ),
                        TextField(
                          controller: null,
                          keyboardType: TextInputType.phone,
                          decoration: new InputDecoration(
                            prefixIcon: Icon(Icons.phone , color : Colors.black),
                            labelText: 'Phone number',
                            labelStyle: TextStyle(color: Colors.black),

                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                        ),TextField(
                          controller: null,
                          keyboardType: TextInputType.emailAddress,
                          decoration: new InputDecoration(
                            labelText: 'Email',
                            labelStyle: TextStyle(color: Colors.black),

                            prefixIcon: Icon(Icons.email , color: Colors.black),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                        ),
                        TextField(
                          controller: null,
                          keyboardType: TextInputType.number,
                          decoration: new InputDecoration(
                            labelText: 'National id',
                            labelStyle: TextStyle(color: Colors.black),

                            prefixIcon: Icon(Icons.credit_card , color: Colors.black,),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                        ),
                        Container( width: MediaQuery.of(context).size.width,child: RaisedButton(color:Colors.lightBlueAccent,child: Text('Change Password' , style: TextStyle(color:Colors.white),), onPressed: (){},)),
                        Container(width: MediaQuery.of(context).size.width,child: RaisedButton(color:Colors.lightBlueAccent,child: Text('Log Out', style: TextStyle(color:Colors.white)), onPressed: (){},))
                      ],
                    ),
                  ),
                ),
              ),


            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical : 10.0 , horizontal: 30),
              child: Container( width: MediaQuery.of(context).size.width,
                  child: RaisedButton(color:Colors.lightBlueAccent,
                    child: Text('Done' ,
                      style: TextStyle(color:Colors.white),),
                    onPressed: (){},)),
            ),


          ],
        ),
      ),
    );
  }
}
