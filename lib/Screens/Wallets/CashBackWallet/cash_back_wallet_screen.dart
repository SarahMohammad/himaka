import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:himaka/Screens/Wallets/CashBackWallet/cash_back_cash_out.dart';

import '../../../utils/app_bar.dart';
import '../../../utils/app_localizations.dart';

class CashBackWalletScreen extends StatefulWidget {
  @override
  _CashBackWalletScreenState createState() => _CashBackWalletScreenState();
}

class _CashBackWalletScreenState extends State<CashBackWalletScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: setAppBar(AppLocalizations.of(context)
          .translate('cash_back_wallet')),
      body: ListView(
        children: [
          InkWell(
            onTap: (){
            },
            child: InkWell(
              child: Card(
                elevation: 2,
                child: ListTile(
                  leading: Icon(Icons.person , color: Colors.lightBlue,),
                  title: Text("Cash out", style: TextStyle(color: Colors.lightBlue),),
                  trailing: Icon(Icons.arrow_forward_ios , color: Colors.lightBlue,),
                ),
              ),
              onTap: (){
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new CashBackCashOutScreen()));

              },
            ),
          ),

        ],
      ),
    );
  }
}
