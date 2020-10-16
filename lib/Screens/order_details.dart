import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:himaka/Screens/congratulation_order_details.dart';
import 'package:himaka/utils/app_localizations.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class OrderDetailsScreen extends StatefulWidget {
  @override
  _OrderDetailsScreenState createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  double rating = 5.0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(AppLocalizations.of(context).translate('your_order')),
          centerTitle: true,
        ),
        backgroundColor: Color(0xFFeeeeee),
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: viewportConstraints.maxHeight,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SmoothStarRating(
                                allowHalfRating: false,
                                onRated: (v) {
                                  rating = v;
                                },
                                starCount: 5,
                                rating: rating,
                                size: 25.0,
                                isReadOnly: true,
                                color: Colors.orange,
                                borderColor: Colors.orange,
                                spacing: 0.0),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Duane Street',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(AppLocalizations.of(context).translate('order') +
                            '#78653536'),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.calendar_today,
                                    color: Colors.blue,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text('8/20/2020')
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.timer,
                                    color: Colors.blue,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text('10:00 am')
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.monetization_on,
                                    color: Colors.blue,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text('\$21')
                                ],
                              )
                            ],
                          ),
                        ),
                        Divider(color: Colors.black),
                        SizedBox(
                          height: 4,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                AppLocalizations.of(context).translate('total'),
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Spacer(),
                              Text('(\$192)',
                                  style: TextStyle(
                                      decoration: TextDecoration.lineThrough)),
                              Text(' \$95'),
                            ],
                          ),
                        ),
                        Divider(color: Colors.black),
                        SizedBox(
                          height: 4,
                        ),
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
                        Divider(color: Colors.black),
                        SizedBox(
                          height: 4,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: double.infinity,
                            child: Text(
                              AppLocalizations.of(context).translate(
                                  'additional_taxes_and_fees_for_information_only'),
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
                                  .translate('city_taxes')),
                              Spacer(),
                              Text('(\$3)'),
                            ],
                          ),
                        ),
                        Divider(color: Colors.black),
                        SizedBox(
                          height: 4,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: double.infinity,
                            child: Text(
                              AppLocalizations.of(context)
                                  .translate('terms_and_conditions'),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                  fontSize: 15),
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: double.infinity,
                            child: Text(
                              AppLocalizations.of(context)
                                  .translate('pay_directly_at_app'),
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: double.infinity,
                            child: Text(
                              'booked are displayed \nexclusive of taxes or surcharges applied by the\nhotelier. Any additional taxes should be paid directly\nat the app',
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            AppLocalizations.of(context).translate('total'),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            '\$95',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Spacer(),
                          RaisedButton(
                            onPressed: (){
                              Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (
                                          context) => new CongratulationOrderDetailsScreen()));

                            },
                            color: Colors.blue,
                            child: Text(
                              AppLocalizations.of(context).translate('next'),
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
