import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_localizations.dart';

class RewardsWalletScreen extends StatefulWidget {
  @override
  _RewardsWalletScreenState createState() => _RewardsWalletScreenState();
}

class _RewardsWalletScreenState extends State<RewardsWalletScreen> {
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
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              AppLocalizations.of(context)
                                  .translate('rewards_wallet'),
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
                          color: Colors.white,
                          child: Column(
                            children: [
                              Container(
                                color: Color(0xFF58c6ef),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Row(
                                    children: [
                                      Icon(Icons.email,color: Colors.white,size: 25,),
                                      SizedBox(width: 15,),
                                      Text(AppLocalizations.of(context)
                                          .translate('your_rewards'),style: TextStyle(color: Colors.white,fontSize: 20),)
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 10,),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Icon(
                                          Icons.card_giftcard,
                                          color: Colors.orange,
                                        ),
                                        SizedBox(
                                          width: 25,
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('You have a reward'),
                                            Text('From 5himaka',style: TextStyle(color: Colors.grey),),
                                          ],
                                        ),
                                        Spacer(),
                                        Column(
                                          children: [
                                            Text('50.00\$',style: TextStyle(color: Colors.blue,decoration: TextDecoration.lineThrough),),
                                            Text('02/03/2019',style: TextStyle(color: Colors.grey))
                                          ],)
                                      ],
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Divider(
                                      color: Colors.black,
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 10,),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: double.infinity,
                                  child: RaisedButton(
                                    onPressed: (){
                                      // Navigator.push(
                                      //     context,
                                      //     new MaterialPageRoute(
                                      //         builder: (
                                      //             context) => new CompleteMoneyTransitionScreen()));


                                    },
                                    color: Color(0xFF58c6ef),
                                    child: Text(
                                      AppLocalizations.of(context).translate('transition_to_personal'),
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10,),

                            ],
                          ),
                        ),
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
