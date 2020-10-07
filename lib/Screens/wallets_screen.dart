import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Wallets/EarningsWallet/earnings_wallet_screen.dart';
import 'Wallets/PersonalWallet/personal_wallet_screen.dart';



class WalletsScreen extends StatefulWidget {
  @override
  _WalletsScreenState createState() => _WalletsScreenState();
}

class _WalletsScreenState extends State<WalletsScreen> {

  @override
  Widget build(BuildContext context) {

    return ListView(
    children: [
      InkWell(
        child: Card(
          elevation: 2,
          child: ListTile(
            leading: Icon(Icons.person , color: Colors.lightBlue,),
            title: Text("Personal wallet" , style: TextStyle(color: Colors.lightBlue),),
            trailing: Icon(Icons.arrow_forward_ios , color: Colors.lightBlue,),
          ),
        ),
        onTap: (){
          Navigator.push(
              context,
              new MaterialPageRoute(
                  builder: (context) => new PersonalWalletScreen()));
        },
      ),
      SizedBox(height: 3,),

      Card(
        elevation: 2,
        child: ListTile(
          leading: Icon(Icons.person , color: Colors.lightBlue,),
          title: Text("Cashback wallet" , style: TextStyle(color: Colors.lightBlue),),
          trailing: Icon(Icons.arrow_forward_ios , color: Colors.lightBlue,),
        ),
      ),
      SizedBox(height: 3,),

      Card(
        elevation: 2,
        child: ListTile(
          leading: Icon(Icons.person , color: Colors.lightBlue,),
          title: Text("Commission wallet", style: TextStyle(color: Colors.lightBlue),),
          trailing: Icon(Icons.arrow_forward_ios , color: Colors.lightBlue,),
        ),
      ),
      SizedBox(height: 3,),

      Card(
        elevation: 2,
        child: ListTile(
          leading: Icon(Icons.person , color: Colors.lightBlue,),
          title: Text("Rewards wallet"  , style: TextStyle(color: Colors.lightBlue),),
          trailing: Icon(Icons.arrow_forward_ios , color: Colors.lightBlue,),
        ),
      ),
      SizedBox(height: 3,),

      InkWell(
        child: Card(
          elevation: 2,
          child: ListTile(
            leading: Icon(Icons.person , color: Colors.lightBlue,),
            title: Text("Earnings wallet" , style: TextStyle(color: Colors.lightBlue),),
            trailing: Icon(Icons.arrow_forward_ios , color: Colors.lightBlue,),
          ),
        ),
        onTap: (){
          Navigator.push(
              context,
              new MaterialPageRoute(
                  builder: (context) => new EarningsWallets()));

        },
      ),
      SizedBox(height: 3,),

      Card(
        elevation: 2,
        child: ListTile(
          leading: Icon(Icons.person , color: Colors.lightBlue,),
          title: Text("Upgrade", style: TextStyle(color: Colors.lightBlue),),
          trailing: Icon(Icons.arrow_forward_ios , color: Colors.lightBlue,),
        ),
      ),
      SizedBox(height: 3,),


    ],
    );
  }
}
