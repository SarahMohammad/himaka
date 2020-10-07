import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CustomerSupportScreen extends StatefulWidget {
  @override
  _CustomerSupportScreenState createState() => _CustomerSupportScreenState();
}

class _CustomerSupportScreenState extends State<CustomerSupportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.grey[900], //change your color here
        ),
        centerTitle:true,
        title: Text('Customer Support' , style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height/2 - 40,
        child: Card(
          elevation: 1.0,
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text('Call us' , style: TextStyle(fontSize: 20),),

                Icon(Icons.headset_mic , color: Colors.lightBlueAccent,),
              ],),
              SizedBox(height: 15,),
              Text("kldfjg kdlfjg dfklgj dglkjd gkldj lgdkj gdlkj glkj dgklj dlkgj dkljg dlkjg "),
              SizedBox(height: 15,),
              Container(child: Text("+87653456-0956"),
              width: MediaQuery.of(context).size.width,) ,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Divider(color: Colors.black,),
              ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Call us' , style: TextStyle(fontSize: 20),),

                    Icon(Icons.headset_mic , color: Colors.lightBlueAccent,),
                  ],),
                SizedBox(height: 15,),
                Text("kldfjg kdlfjg dfklgj dglkjd gkldj lgdkj gdlkj glkj dgklj dlkgj dkljg dlkjg "),
                SizedBox(height: 15,),
                Container(child: Text("+87653456-0956"),
                  width: MediaQuery.of(context).size.width,) ,
            ],),
          ),
        ),
      ),
    );
  }
}
