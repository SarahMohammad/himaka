import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:himaka/utils/app_bar.dart';

class MethodOfCashOutScreen extends StatefulWidget {
  @override
  _MethodOfCashOutScreenState createState() => _MethodOfCashOutScreenState();
}

class _MethodOfCashOutScreenState extends State<MethodOfCashOutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: setAppBar('Personal Wallet'),
      body: ListView(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.lightBlueAccent,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Icon(Icons.mail_outline, color: Colors.white),
                    Text('Method of cash out', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),
            Card(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Method of cash out'),
                      Text('Orange cash', style: TextStyle(color: Colors.lightBlueAccent))
                    ],
                  ),
                )),
            SizedBox(
              height: 15,
            ),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal :25.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: RaisedButton(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text('change' , style: TextStyle(color: Colors.white),),
                  ),
                  onPressed: () {},
                  color: Colors.lightBlueAccent,
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal :25.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: RaisedButton(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text('Done' , style: TextStyle(color: Colors.white),),
                  ),
                  onPressed: () {},
                  color: Colors.lightBlueAccent,
                ),
              ),
            ),

          ],
        ),
      ]),
    );
  }
}
