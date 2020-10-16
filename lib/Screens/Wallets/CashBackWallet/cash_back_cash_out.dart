import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/app_bar.dart';
import '../../../utils/app_localizations.dart';

class CashBackCashOutScreen extends StatefulWidget {
  @override
  _CashBackCashOutScreenState createState() => _CashBackCashOutScreenState();
}

class _CashBackCashOutScreenState extends State<CashBackCashOutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      setAppBar(AppLocalizations.of(context).translate('cash_back_wallet')),
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
                    SizedBox(
                      width: 16,
                    ),
                    Text('Cash Out', style: TextStyle(color: Colors.white)),
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
                      Text('Wallet Balance'),
                      Text('500.00\$',
                          style: TextStyle(color: Colors.lightBlueAccent))
                    ],
                  ),
                )),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
              child: Text(AppLocalizations.of(context)
                  .translate('transition_to_personal')),
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              autofocus: false,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SvgPicture.asset(
                    'images/icon_money.svg',
                    height: 25.0,
                    width: 25.0,
                    color: Colors.black,
                    allowDrawingOutsideViewBox: true,
                  ),
                ),
                hintText: 'Enter amount to load',
                hintStyle: TextStyle(
                    color: Colors.black, textBaseline: TextBaseline.alphabetic),
                contentPadding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical:16.0,horizontal: 32),
                child: RaisedButton(
                  child: Text(
                    AppLocalizations.of(context)
                        .translate('complete_your_transition'),
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {},
                  color: Colors.lightBlueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
