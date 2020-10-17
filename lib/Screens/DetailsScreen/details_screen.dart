import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:himaka/Screens/Chat/chat_screen.dart';
import 'package:himaka/Screens/DetailsScreen/reviews_container.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import 'delivery_container.dart';
import 'desciption_container.dart';

class DetailsScreen extends StatefulWidget {
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen>
    with TickerProviderStateMixin {
  List<Tab> tabList = List();
  TabController _tabController;

  Widget image_carousel = new Container(
    height: 200.0,
    child: Container(
      color: Colors.orange,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          Image.network(
              'https://static.digit.in/default/thumb_97296_default_td_480x480.jpeg'),
          Image.network(
              'https://static.digit.in/default/thumb_97296_default_td_480x480.jpeg'),
          Image.network(
              'https://static.digit.in/default/thumb_97296_default_td_480x480.jpeg'),
          Image.network(
              'https://static.digit.in/default/thumb_97296_default_td_480x480.jpeg'),
          Image.network(
              'https://static.digit.in/default/thumb_97296_default_td_480x480.jpeg'),
        ],
        autoplay: false,
//      animationCurve: Curves.fastOutSlowIn,
//      animationDuration: Duration(milliseconds: 1000),
        dotSize: 5.0,
        indicatorBgPadding: 2.0,
        dotBgColor: Colors.transparent,
        dotIncreasedColor: Colors.lightBlueAccent,
      ),
    ),
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabList.add(new Tab(
      text: 'Description',
    ));

    tabList.add(new Tab(
      text: 'Reviews',
    ));

    tabList.add(new Tab(
      text: 'Delivery info',
    ));

    _tabController = new TabController(vsync: this, length: tabList.length);
  }

  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Details',
          style: TextStyle(color: Colors.grey[900]),
        ),
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.grey[900], //change your color here
        ),
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        children: [
          new Column(
            children: <Widget>[
              //image carousel begins here
              image_carousel,

              //padding widget
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                  onTap: () {
//                    Navigator.push(
//                        context,
//                        new MaterialPageRoute(
//                            builder: (
//                                context) => new AddProductService()));
                  },
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13.0),
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.white,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[400],
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'String boots',
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                                InkWell(
                                  onTap: () {
//                                    Navigator.push(
//                                        context,
//                                        new MaterialPageRoute(
//                                            builder: (context) =>
//                                                new ChatScreen()));
                                  },
                                  child: Icon(Icons.favorite,
                                      color: Colors.lightBlueAccent),
                                ),
                              ],
                            ),
                            Container(
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  '#12345',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 11),
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text('\$456',
                                    style: new TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      decoration: TextDecoration.lineThrough,
                                    )),
                                SizedBox(
                                  width: 10,
                                ),
                                Text('\$87',
                                    style: new TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black)),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                    color: Colors.lightBlue, child: Text('5')),
                              ],
                            ),
                            SizedBox(
                              height: 11,
                            ),
                            Container(
                                width: MediaQuery.of(context).size.width,
                                child: Text('brand name : NIKE')),
                            SizedBox(
                              height: 11,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                children: [
                                  SmoothStarRating(
                                      allowHalfRating: false,
                                      onRated: (value) {
//                                            _rating = value;
                                      },
                                      starCount: 5,
                                      rating: 4,
                                      size: 19.0,
                                      isReadOnly: true,
                                      color: Colors.deepOrangeAccent,
                                      borderColor: Colors.deepOrangeAccent,
                                      spacing: 0.0),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text('Rating 4'),
                                  Spacer(),
                                  Icon(
                                    Icons.home,
                                    color: Colors.red,
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                          ],
                        ),
                      )),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(19.0),
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.white,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.remove,
                          color: Colors.blue,
                        ),
                        Text('5'),
                        Icon(
                          Icons.add,
                          color: Colors.blue,
                        )
                      ],
                    ),
                  ),
                ),
              ),

              Container(
                decoration: new BoxDecoration(color: Colors.white),
                child: new TabBar(
                  labelColor: Colors.lightBlue,
                  controller: _tabController,
                  unselectedLabelColor: Colors.grey[800],
                  indicatorColor: Colors.lightBlue,
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: tabList,
                  labelStyle: TextStyle(fontSize: 12),
                ),
              ),

              new Container(
                height: MediaQuery.of(context).size.height / 1.6,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: new TabBarView(
                    controller: _tabController,
                    children: <Widget>[
                      DescriptionContainer(),
                      ReviewsContainer(),
                      DeliveryContainer()
                    ],
                  ),
                ),
              ),
              RaisedButton(
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Add to cart',
                        style: TextStyle(fontSize: 23, color: Colors.white),
                      ),
                      SizedBox(width: 4),
                      Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
                color: Colors.lightBlue,
              )
            ],
          )
        ],
      ),
    );
  }
}
