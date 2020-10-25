import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:himaka/Screens/Chat/chatroom.dart';
import 'package:himaka/Screens/DetailsScreen/reviews_container.dart';
import 'package:himaka/ViewModels/base_model.dart';
import 'package:himaka/ViewModels/product_service_details_view_model.dart';
import 'package:himaka/services/base_view.dart';
import 'package:himaka/utils/globals.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import 'desciption_container.dart';

class DetailsScreen extends StatefulWidget {
  int id;
  @override
  _DetailsScreenState createState() => _DetailsScreenState();

  DetailsScreen({this.id});
}

class _DetailsScreenState extends State<DetailsScreen>
    with TickerProviderStateMixin {
  List<Tab> tabList = List();
  TabController _tabController;

  Widget imageCarousel(List images) {
    print("hh" + images.toString());
    return Container(
      height: 200.0,
      child: Container(
        color: Colors.white,
        child: new Carousel(
          boxFit: BoxFit.cover,
          images: images,
          autoplay: true,
          animationCurve: Curves.fastOutSlowIn,
          animationDuration: Duration(milliseconds: 500),
          dotSize: 5.0,
          indicatorBgPadding: 2.0,
          dotBgColor: Colors.transparent,
          dotIncreasedColor: Colors.lightBlueAccent,
        ),
      ),
    );
  }

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

//    tabList.add(new Tab(
//      text: 'Delivery info',
//    ));

    _tabController = new TabController(vsync: this, length: tabList.length);
  }

  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List images = [];

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
      body: BaseView<ProductServiceDetailsViewModel>(
          onModelReady: (model) {
            refreshScreen(model);
          },
          builder: (context, model, child) => LayoutBuilder(builder:
                  (BuildContext context, BoxConstraints viewportConstraints) {
                if (model.productOrServiceDetailsResponse != null &&
                    images.length == 0) {
                  if (model.productOrServiceDetailsResponse.data.item.images
                          .length !=
                      0) {
                    for (int i = 0;
                        i <
                            model.productOrServiceDetailsResponse.data.item
                                .images.length;
                        i++) {
                      images.add(Image.network(model
                          .productOrServiceDetailsResponse
                          .data
                          .item
                          .images[i]));
                    }
                  }
                }

                return model.state == ViewState.Busy
                    ? Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.lightBlue,
                        ),
                      )
                    : model.productOrServiceDetailsResponse != null
                        ? ListView(
                            children: [
                              new Column(
                                children: <Widget>[
                                  //image carousel begins here
                                  imageCarousel(images),

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
                                            borderRadius:
                                                BorderRadius.circular(13.0),
                                            color: Colors.white,
                                            border: Border.all(
                                              color: Colors.white,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey[400],
                                                offset:
                                                    Offset(0.0, 1.0), //(x,y)
                                                blurRadius: 6.0,
                                              ),
                                            ],
                                          ),
                                          alignment: Alignment.center,
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      model
                                                          .productOrServiceDetailsResponse
                                                          .data
                                                          .item
                                                          .name,
                                                      style: TextStyle(
                                                          fontSize: 24,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        _moveTochatRoom(
                                                            "e0NN0LS6OU0:APA91bHqYRfDu8mvccDSTa90nL_XhN8CI_AxcEyvj7B4mZXFETq06tCS6vVylc8eqOTSCfp3jmK6bqEl3luo4u1LpLEuNhqdrX7OAdkzdNfOiRHFMVlo1ehpT0js1VOA3V_1rtlUPzCp",
                                                            "sarah65652",
                                                            "sarah");
//                                    Navigator.push(
//                                        context,
//                                        new MaterialPageRoute(
//                                            builder: (context) =>
//                                                new ChatScreen()));
                                                      },
                                                      child: Icon(
                                                          Icons.favorite,
                                                          color: Colors
                                                              .lightBlueAccent),
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  child: Text(
                                                    '#' +
                                                        model
                                                            .productOrServiceDetailsResponse
                                                            .data
                                                            .item
                                                            .id
                                                            .toString(),
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 11),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                        '\$' +
                                                            model
                                                                .productOrServiceDetailsResponse
                                                                .data
                                                                .item
                                                                .oldPrice
                                                                .toString(),
                                                        style: new TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black,
                                                          decoration: model
                                                                      .productOrServiceDetailsResponse
                                                                      .data
                                                                      .item
                                                                      .oldPrice !=
                                                                  model
                                                                      .productOrServiceDetailsResponse
                                                                      .data
                                                                      .item
                                                                      .newPrice
                                                              ? TextDecoration
                                                                  .lineThrough
                                                              : TextDecoration
                                                                  .none,
                                                        )),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    model.productOrServiceDetailsResponse.data
                                                                .item.oldPrice !=
                                                            model
                                                                .productOrServiceDetailsResponse
                                                                .data
                                                                .item
                                                                .newPrice
                                                        ? Text(
                                                            '\$' +
                                                                model
                                                                    .productOrServiceDetailsResponse
                                                                    .data
                                                                    .item
                                                                    .newPrice
                                                                    .toString(),
                                                            style: new TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black))
                                                        : Container(),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    model.productOrServiceDetailsResponse.data
                                                                .item.oldPrice !=
                                                            model
                                                                .productOrServiceDetailsResponse
                                                                .data
                                                                .item
                                                                .newPrice
                                                        ? Container(
                                                            decoration: BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                color: Colors
                                                                    .lightBlue),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .all(
                                                                      10.0),
                                                              child: Text(
                                                                model
                                                                        .productOrServiceDetailsResponse
                                                                        .data
                                                                        .item
                                                                        .specialPricePercent
                                                                        .toString() +
                                                                    "%",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                            ))
                                                        : Container(),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 11,
                                                ),
//                                                Container(
//                                                    width:
//                                                        MediaQuery.of(context)
//                                                            .size
//                                                            .width,
//                                                    child: Text(
//                                                        'brand name : NIKE')),
                                                SizedBox(
                                                  height: 11,
                                                ),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  child: Row(
                                                    children: [
                                                      SmoothStarRating(
                                                          allowHalfRating:
                                                              false,
                                                          onRated: (value) {
//                                            _rating = value;
                                                          },
                                                          starCount: 5,
                                                          rating: double.parse(model
                                                              .productOrServiceDetailsResponse
                                                              .data
                                                              .item
                                                              .ratingPercent
                                                              .toString()),
                                                          size: 19.0,
                                                          isReadOnly: true,
                                                          color: Colors
                                                              .deepOrangeAccent,
                                                          borderColor: Colors
                                                              .deepOrangeAccent,
                                                          spacing: 0.0),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text('Rating ' +
                                                          model
                                                              .productOrServiceDetailsResponse
                                                              .data
                                                              .item
                                                              .ratingPercent
                                                              .toString()),
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
                                        borderRadius:
                                            BorderRadius.circular(19.0),
                                        color: Colors.white,
                                        border: Border.all(
                                          color: Colors.white,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
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
                                    decoration:
                                        new BoxDecoration(color: Colors.white),
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
                                    height: MediaQuery.of(context).size.height /
                                        1.6,
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: new TabBarView(
                                        controller: _tabController,
                                        children: <Widget>[
                                          DescriptionContainer(
                                              desc: model
                                                  .productOrServiceDetailsResponse
                                                  .data
                                                  .item
                                                  .description,
                                              related_products: model
                                                  .productOrServiceDetailsResponse
                                                  .data
                                                  .item
                                                  .relatedProducts),
                                          ReviewsContainer(
                                              id: model
                                                  .productOrServiceDetailsResponse
                                                  .data
                                                  .item
                                                  .id,
                                              reviews: model
                                                  .productOrServiceDetailsResponse
                                                  .data
                                                  .item
                                                  .reviews),
//                                          DeliveryContainer()
                                        ],
                                      ),
                                    ),
                                  ),
                                  RaisedButton(
                                    onPressed: () {},
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Add to cart',
                                            style: TextStyle(
                                              fontSize: 23,
                                              color: Colors.white,
                                            ),
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
                          )
                        : Center(
                            child: Text('empty'),
                          );
              })),
    );
  }

  String makeChatId(myID, selectedUserID) {
    String chatID;
    if (myID.hashCode > selectedUserID.hashCode) {
      chatID = '$selectedUserID-$myID';
    } else {
      chatID = '$myID-$selectedUserID';
    }
    return chatID;
  }

  Future<void> _moveTochatRoom(
      selectedUserToken, selectedUserID, selectedUserName) async {
    try {
      String chatID = makeChatId(Globals.userData.token, selectedUserID);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ChatRoom(
                    Globals.userData.token,
                    Globals.userData.first_name,
                    selectedUserToken,
                    selectedUserID,
                    chatID,
                    selectedUserName,
                  )));
    } catch (e) {
      print(e.message);
    }
  }

  void refreshScreen(ProductServiceDetailsViewModel model) {
    model.getProductOrServiceDetails(widget.id);
  }
}
