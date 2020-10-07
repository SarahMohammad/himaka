import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:himaka/utils/app_bar.dart';


class AddressScreen extends StatefulWidget {
  @override
  _AddressScreenState createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
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
                    Icon(Icons.pin_drop, color: Colors.white),
                    SizedBox(width: 5,),
                    Text('Address', style: TextStyle(color: Colors.white)),
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Additional address details' , style: TextStyle(color:Colors.grey),),
                          SizedBox(height: 10,),
                          Text('67 st, in front of saint ddddd' ,  style: TextStyle(fontSize: 18 )),

                        ],
                      ),
                      Row(
                        children: [

                          Text('edit', style: TextStyle(color: Colors.lightBlueAccent)),
                          Icon(Icons.edit ,color: Colors.lightBlueAccent , size: 16, )
                        ],
                      )
                    ],
                  ),
                )),

          ],
        ),
      ]),
    );

  }
}
