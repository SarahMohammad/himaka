import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:himaka/utils/app_localizations.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class CongratulationOrderDetailsScreen extends StatefulWidget {
  @override
  _CongratulationOrderDetailsScreenState createState() =>
      _CongratulationOrderDetailsScreenState();
}

class _CongratulationOrderDetailsScreenState
    extends State<CongratulationOrderDetailsScreen> {
  double rating = 5.0;

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
                                InkWell(
                                  onTap: (){
                                    Navigator.of(context).pop();
                                  },
                                  child: Icon(
                                    Icons.clear,
                                    color: Colors.red,
                                  ),
                                ),
                                Text(
                                  AppLocalizations.of(context)
                                      .translate('congratulation'),
                                  style: TextStyle(fontSize: 20),
                                ),
                                Icon(
                                  Icons.clear,
                                  color: Colors.white,
                                )
                              ],
                            ),
                            Icon(
                              Icons.email,
                              color: Colors.blue,
                              size: 150,
                            ),
                            Text(
                              AppLocalizations.of(context)
                                  .translate('your_booking_confirmed'),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                  fontSize: 20),
                            ),
                            Text(
                              AppLocalizations.of(context)
                                  .translate('your_booking_request'),
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            Text('by email: fyrouz@gmail.com',
                                style: TextStyle(
                                  fontSize: 15,
                                )),
                            SizedBox(
                              height: 8,
                            ),
                            Divider(color: Colors.black),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.event,
                                    color: Colors.blue,
                                    size: 40,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    children: [
                                      Text('Saturday, january, 18,2020',
                                          style: TextStyle(
                                            fontSize: 15,
                                          )),
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Text('From 10:00 AM to 10:00 PM',
                                          style: TextStyle(
                                            fontSize: 15,
                                          )),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Divider(color: Colors.black),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.blue,
                                    size: 40,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Duane Street',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                      SmoothStarRating(
                                          allowHalfRating: false,
                                          onRated: (v) {
                                            rating = v;
                                          },
                                          starCount: 5,
                                          rating: rating,
                                          size: 18.0,
                                          isReadOnly: true,
                                          color: Colors.orange,
                                          borderColor: Colors.orange,
                                          spacing: 0.0),
                                      Text('130 Duane street, New York, NY, USA',
                                          style: TextStyle(
                                            fontSize: 15,
                                          )),
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Text('Phone (062) 0 766744949',
                                          style: TextStyle(
                                            fontSize: 15,
                                          )),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Divider(color: Colors.black),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.speaker_notes,
                                    color: Colors.blue,
                                    size: 40,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    'Order 7865666',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold, fontSize: 15),
                                  ),
                                  Spacer(),
                                  Column(children: [
                                    Text(
                                      '(\$192)',
                                      style: TextStyle(
                                          decoration: TextDecoration.lineThrough,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '\$95',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],)
                                ],
                              ),
                            ),
                            Divider(color: Colors.black),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: double.infinity,
                                child: Text(
                                  AppLocalizations.of(context)
                                      .translate('pricing_details'),
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Row(
                                children: [
                                  Text(AppLocalizations.of(context)
                                      .translate('to_be_paid_now')),
                                  Spacer(),
                                  Text('(\$0)'),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Row(
                                children: [
                                  Text(AppLocalizations.of(context)
                                      .translate('to_be_paid_at_hotel')),
                                  Spacer(),
                                  Text('(\$192)',
                                      style: TextStyle(
                                          decoration: TextDecoration.lineThrough)),
                                  Text(' \$95'),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical:4.0,horizontal:8.0),
                              child: Container(
                                width: double.infinity,
                                child: Text(AppLocalizations.of(context)
                                    .translate('free_return'),style: TextStyle(color: Colors.red),textAlign: TextAlign.start,),
                              ),
                            ),
                            Divider(color: Colors.black),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: double.infinity,
                                child: RaisedButton(
                                  onPressed: (){

                                  },
                                  color: Colors.blue,
                                  child: Text(
                                    AppLocalizations.of(context).translate('done'),
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