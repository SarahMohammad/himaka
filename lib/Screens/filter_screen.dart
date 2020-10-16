import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:himaka/services/locator.dart';
import 'package:himaka/utils/AppLanguage.dart';
import 'package:himaka/utils/app_localizations.dart';
import 'package:flutter_range_slider/flutter_range_slider.dart' as frs;
import 'package:smooth_star_rating/smooth_star_rating.dart';

import 'categories_tags_selection_screen.dart';

class FilterScreen extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  double _lowerValue = 20.0;
  double _upperValue = 80.0;
  int tag = 1;
  List<String> tags = [];
  List<int> isChecked = [];

  List<String> options = [
    'News',
    'Entertainment',
    'Politics',
    'Automotive',
    'Sports',
    'Education',
    'Fashion',
    'Travel',
    'Food',
    'Tech',
    'Science',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).translate('filter'),
          style: TextStyle(color: Colors.grey[900]),
        ),
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.grey[900], //change your color here
        ),
        backgroundColor: Color(0xFFf5f5f5),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.refresh,
              color: Colors.grey[900],
            ),
          )
        ],
      ),
      backgroundColor: Color(0xFFf5f5f5),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.of(context).translate('price'),
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Text('85\$ - 780\$'),
                    ],
                  ),
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    overlayColor: Colors.black,
                    activeTickMarkColor: Colors.white,
                    activeTrackColor: Colors.orange,
                    inactiveTrackColor: Colors.white,
                    //trackHeight: 8.0,
                    thumbColor: Colors.black,
                    trackHeight: 8.0,
                    valueIndicatorColor: Colors.orange,
                  ),
                  child: frs.RangeSlider(
                    min: 0.0,
                    max: 100.0,
                    lowerValue: _lowerValue,
                    upperValue: _upperValue,
                    divisions: 10,
                    showValueIndicator: true,
                    valueIndicatorMaxDecimals: 1,
                    onChanged: (double newLowerValue, double newUpperValue) {
                      setState(() {
                        _lowerValue = newLowerValue;
                        _upperValue = newUpperValue;
                      });
                    },
                    onChangeStart:
                        (double startLowerValue, double startUpperValue) {
                      print(
                          'Started with values: $startLowerValue and $startUpperValue');
                    },
                    onChangeEnd: (double newLowerValue, double newUpperValue) {
                      print(
                          'Ended with values: $newLowerValue and $newUpperValue');
                    },
                  ),
                ),
                Divider(
                  color: Colors.black,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                  child: Container(
                    width: double.infinity,
                    child: Text(
                      AppLocalizations.of(context).translate('star_rating'),
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 8,
                          ),
                          SmoothStarRating(
                              allowHalfRating: false,
                              starCount: index == 0
                                  ? 5
                                  : index == 1
                                      ? 4
                                      : index == 2 ? 3 : index == 3 ? 2 : 1,
                              rating: 5,
                              size: 20.0,
                              isReadOnly: true,
                              filledIconData: Icons.star,
                              defaultIconData: Icons.star,
                              color: Colors.deepOrangeAccent,
                              borderColor: Colors.black38,
                              spacing: 0.0),
                          Expanded(
                            child: Align(
                              alignment: locator<AppLanguage>()
                                          .appLocal
                                          .languageCode ==
                                      'en'
                                  ? Alignment.centerRight
                                  : Alignment.centerLeft,
                              child: Checkbox(
                                value: isChecked.contains(index),
                                onChanged: (value) {
                                  if (value) {
                                    setState(() {
                                      isChecked.add(index);
                                    });
                                  } else {
                                    setState(() {
                                      isChecked.remove(index);
                                    });
                                  }
                                },
                                checkColor: Colors.blue,
                                focusColor: Colors.blue,
                                // color of tick Mark
                                activeColor: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                        ],
                      );
                    }),
                Divider(
                  color: Colors.black,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                  child: Container(
                    width: double.infinity,
                    child: Text(
                      AppLocalizations.of(context).translate('categories'),
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.all(5),
                  children: <Widget>[
                    Content(
                      child: ChipsChoice<String>.multiple(
                        value: tags,
                        options: ChipsChoiceOption.listFrom<String, String>(
                          source: options,
                          value: (i, v) => v,
                          label: (i, v) => v,
                        ),
                        onChanged: (val) => setState(() => tags = val),
                        isWrapped: true,
                      ),
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 32),
                    child: RaisedButton(
                      child: Text(
                        AppLocalizations.of(context).translate('done'),
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {},
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
