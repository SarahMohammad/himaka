import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:himaka/Screens/Wallets/PersonalWallet/address_screen.dart';
import 'package:himaka/Screens/Wallets/PersonalWallet/cash_out_screen.dart';
import 'package:himaka/Screens/Wallets/PersonalWallet/method_of_cashout_screen.dart';
import 'package:himaka/utils/app_bar.dart';

class PersonalWalletScreen extends StatefulWidget {
  @override
  _PersonalWalletScreenState createState() => _PersonalWalletScreenState();
}

class _PersonalWalletScreenState extends State<PersonalWalletScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: setAppBar("Personal Wallet"),
      body: ListView(
        children: [
          InkWell(
            child: Card(
              elevation: 2,
              child: ListTile(
                leading: Icon(Icons.person , color: Colors.lightBlue,),
                title: Text("Cash out" , style: TextStyle(color: Colors.lightBlue),),
                trailing: Icon(Icons.arrow_forward_ios , color: Colors.lightBlue,),
              ),
            ),
            onTap: (){
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new CashOutScreen()));
            },
          ),
          SizedBox(height: 3,),

          InkWell(
            onTap: (){
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new MethodOfCashOutScreen()));
            },
            child: Card(
              elevation: 2,
              child: ListTile(
                leading: Icon(Icons.person , color: Colors.lightBlue,),
                title: Text("Method of cash out" , style: TextStyle(color: Colors.lightBlue),),
                trailing: Icon(Icons.arrow_forward_ios , color: Colors.lightBlue,),
              ),
            ),
          ),
          SizedBox(height: 3,),

          InkWell(
            onTap: (){
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new AddressScreen()));
            },
            child: Card(
              elevation: 2,
              child: ListTile(
                leading: Icon(Icons.person , color: Colors.lightBlue,),
                title: Text("Address", style: TextStyle(color: Colors.lightBlue),),
                trailing: Icon(Icons.arrow_forward_ios , color: Colors.lightBlue,),
              ),
            ),
          ),
          SizedBox(height: 3,),

          Card(
            elevation: 2,
            child: ListTile(
              leading: Icon(Icons.person , color: Colors.lightBlue,),
              title: Text("Order"  , style: TextStyle(color: Colors.lightBlue),),
              trailing: Icon(Icons.arrow_forward_ios , color: Colors.lightBlue,),
            ),
          ),
          SizedBox(height: 3,),
        ],
      ),
    );
  }
}
