import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:himaka/Screens/complete_money_transition.dart';

import '../../../utils/app_localizations.dart';
import '../../../utils/globals.dart';

class CommissionWalletScreen extends StatefulWidget {
  @override
  _CommissionWalletScreenState createState() => _CommissionWalletScreenState();
}

class _CommissionWalletScreenState extends State<CommissionWalletScreen> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xFFf5f5f5),
          body: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Color(0xFFf5f5f5),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: (){
                                Navigator.of(context).pop();
                              },
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              AppLocalizations.of(context)
                                  .translate('commission_wallet'),
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              Icons.cancel,
                              color: Color(0xFFf5f5f5),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Container(
                          height: 100,
                          color: Color(0xFF58c6ef),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 8,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: Container(
                                  width: double.infinity,
                                  child: Text(
                                    Globals.userData.first_name +
                                        ' ' +
                                        Globals.userData.last_name,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 20),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xFFa5ddf2),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(50))),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.card_giftcard,
                                          color: Colors.red,
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Text('1,97848' +
                                            ' ' +
                                            AppLocalizations.of(context)
                                                .translate('points')),
                                        Spacer(),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          color: Color(0xFF595d5d),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          color: Colors.white,
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: 5,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Icon(
                                          Icons.person_pin,
                                          color: Colors.blue,
                                        ),
                                        SizedBox(
                                          width: 25,
                                        ),
                                        Text('Heba Emad Farouk'),
                                        Spacer(),
                                        Container(
                                          decoration: BoxDecoration(
                                              color: Colors.blue,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15))),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 4.0, horizontal: 32),
                                            child: Text(
                                              AppLocalizations.of(context)
                                                  .translate('view'),
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    (index == 4)
                                        ? Container()
                                        : Divider(
                                            color: Colors.grey,
                                          )
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:32.0,left: 32,right: 32),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppLocalizations.of(context)
                                    .translate('wallet_balance'),
                                style: TextStyle(color: Color(0xFF6d6d6d),fontSize: 15),
                              ),
                              Text(
                                '500,00\$',
                                style: TextStyle(color: Colors.blue),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 8,),
                        Divider(
                          color: Colors.grey,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:16.0,left: 32,right: 32),
                          child: Container(
                            width: double.infinity,
                            child: Text(
                              AppLocalizations.of(context)
                                  .translate('transition_to_personal'),
                              style: TextStyle(color: Color(0xFF6d6d6d),fontSize: 15),
                            ),
                          ),
                        ),
                        SizedBox(height: 8,),
                        Container(color: Colors.white,child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(children: [
                            SizedBox(width: 8,),
                            SvgPicture.asset(
                              'images/icon_money.svg',
                              height: 25.0,
                              width: 25.0,
                              color: Colors.black,
                              allowDrawingOutsideViewBox:
                              true,
                            ),
                            SizedBox(width: 15,),
                            Text(
                              AppLocalizations.of(context)
                                  .translate('enter_amount_to_load'),
                              style: TextStyle(color: Colors.black,fontSize: 15),
                            ),
                          ],),
                        ),),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: double.infinity,
                            child: RaisedButton(
                              onPressed: (){
                                Navigator.push(
                                    context,
                                    new MaterialPageRoute(
                                        builder: (
                                            context) => new CompleteMoneyTransitionScreen()));


                              },
                              color: Colors.blue,
                              child: Text(
                                AppLocalizations.of(context).translate('complete_your_transition'),
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        )

                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
