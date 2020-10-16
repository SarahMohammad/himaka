import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/app_localizations.dart';
import '../utils/globals.dart';

class CompleteMoneyTransitionScreen extends StatefulWidget {
  @override
  _CompleteMoneyTransitionScreenState createState() =>
      _CompleteMoneyTransitionScreenState();
}

class _CompleteMoneyTransitionScreenState
    extends State<CompleteMoneyTransitionScreen> {
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
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                "images/blur_bg.jpg",
                                height: 120,
                                width: MediaQuery.of(context).size.width,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '1,9650' +
                                        ' ' +
                                        AppLocalizations.of(context)
                                            .translate('points'),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    'when you reach 9000 points\nconvert your points\ninto money',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          color: Colors.grey,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 8,
                              ),
                              SvgPicture.asset(
                                'images/icon_money.svg',
                                height: 25.0,
                                width: 25.0,
                                color: Colors.black,
                                allowDrawingOutsideViewBox: true,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                AppLocalizations.of(context)
                                    .translate('convert_your_points'),
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15),
                              ),
                              Spacer(),
                              Text(
                                '9000',
                                style: TextStyle(color: Colors.blue),
                              ),

                            ],
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
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
                              color: Colors.blue,
                              child: Text(
                                AppLocalizations.of(context).translate('convert'),
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
