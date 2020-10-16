import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:himaka/utils/app_localizations.dart';

class UpgradeScreen extends StatefulWidget {
  @override
  _UpgradeScreenState createState() => _UpgradeScreenState();
}

class _UpgradeScreenState extends State<UpgradeScreen> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: Color(0xFFeeeeee),
              body: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: viewportConstraints.maxHeight,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 8.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.clear,
                                  color: Colors.white,
                                ),
                                Text(
                                  AppLocalizations.of(context)
                                      .translate('personal_wallet'),
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Icon(
                                    Icons.cancel,
                                    color: Colors.blue,
                                    size: 30,
                                  ),
                                ),
                              ],
                            ),
                            Icon(
                              Icons.airplanemode_inactive,
                              color: Colors.blue,
                              size: 300,
                            ),
                            Container(
                              height: 250,
                              child: ListView.builder(
                                itemCount: 3,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Color(0xFFf4f4f4),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30))),
                                      width: 210.0,
                                      child: Column(children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 16.0,
                                              left: 16.0,
                                              right: 16.0,
                                              bottom: 4),
                                          child: Row(children: [
                                            Icon(Icons.calendar_today,
                                              color: Color(0xFFaeaeae), size: 15,),
                                            Text(' 12 Months', style: TextStyle(
                                                color: Color(0xFFaeaeae),
                                                fontWeight: FontWeight.bold),),
                                            Text('-', style: TextStyle(
                                                color: Color(0xFFaeaeae),
                                                fontWeight: FontWeight.bold),),
                                            Text('360 Days', style: TextStyle(
                                                color: Color(0xFFaeaeae),
                                                fontWeight: FontWeight.bold),),
                                          ],),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 4.0),
                                          child: Divider(color: Colors.grey),
                                        ),
                                        Text(index==0?'Standard':index==2?'Second Upgrade':'First Upgrade', style: TextStyle(
                                            color: Color(0xFF727272),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),),
                                        SizedBox(height: 4,),
                                        Text(' \$36', style: TextStyle(
                                            color: Color(0xFF727272),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),),
                                        SizedBox(height: 10,),
                                        Container(
                                          width:double.infinity,
                                          decoration: BoxDecoration(
                                              color: Color(0xFFbcd8e3),
                                              borderRadius: new BorderRadius.only(
                                                topLeft: const Radius.circular(30.0),
                                                topRight: const Radius.circular(30.0),
                                              )),
                                          child: Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Center(
                                              child: Text(
                                                'The Commission can be\navailed by five people',
                                                style: TextStyle(color: Colors.black,
                                                    fontSize: 15),),
                                            ),
                                          ), ),
                                        Container(
                                          width:double.infinity,
                                          decoration: BoxDecoration(
                                              color: index==0?Color(0xFF45e16a):index==2?Color(0xFFd2d2d2):Colors.red,
                                              borderRadius: new BorderRadius.only(
                                                bottomLeft: const Radius.circular(30.0),
                                                bottomRight: const Radius.circular(30.0),
                                              )),
                                          child: Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Center(
                                              child: Text(
                                                'Upgrade now',
                                                style: TextStyle(color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15),),
                                            ),
                                          ), ),
                                      ],),
                                    ),
                                  );
                                },
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