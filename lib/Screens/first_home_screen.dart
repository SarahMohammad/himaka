import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:himaka/Screens/add_product_service.dart';
import 'package:himaka/ViewModels/base_model.dart';
import 'package:himaka/ViewModels/home_view_model.dart';
import 'package:himaka/services/base_view.dart';
import 'package:himaka/utils/app_localizations.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import 'DetailsScreen/details_screen.dart';

class FirstHomeScreen extends StatefulWidget {
  @override
  _FirstHomeScreenState createState() => _FirstHomeScreenState();
}

class _FirstHomeScreenState extends State<FirstHomeScreen> {
  List images = [];

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
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 20) / 1.7;
    final double itemWidth = size.width / 2;

    return BaseView<HomeViewModel>(
        onModelReady: (model) {
          refreshScreen(model);
        },
        builder:
            (context, model, child) => LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints viewportConstraints) {
                  if (model.homeResponse != null) {
                    if (model.homeResponse.data.offers.length != 0) {
                      for (int i = 0; i < 5; i++) {
                        model.homeResponse.data.offers[i].mainImage != null
                            ? images.add(Image.network(
                                model.homeResponse.data.offers[i].mainImage))
                            : images.add(Image.asset("images/logo.png"));
                      }
                    }
                  }
                  return model.state == ViewState.Busy
                      ? Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.lightBlue,
                          ),
                        )
                      : model.homeResponse != null
                          ? Container(
                              child: ListView(
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
                                            Navigator.push(
                                                context,
                                                new MaterialPageRoute(
                                                    builder: (context) =>
                                                        new AddProductService()));
                                          },
                                          child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(19.0),
                                                color: Colors.white,
                                                border: Border.all(
                                                  color: Colors.white,
                                                ),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey,
                                                    offset: Offset(
                                                        0.0, 1.0), //(x,y)
                                                    blurRadius: 6.0,
                                                  ),
                                                ],
                                              ),
                                              alignment: Alignment.center,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.add,
                                                      color: Colors.blue,
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(AppLocalizations.of(
                                                            context)
                                                        .translate(
                                                            'add_product')),
                                                  ],
                                                ),
                                              )),
                                        ),
                                      ),

                                      //Horizontal list view begins here
//          HorizontalList(),

                                      //padding widget
                                      new Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                            alignment: Alignment.centerLeft,
                                            child: new Text('Recent products')),
                                      ),

                                      //grid view
//          Flexible(child: Products()),

                                      Container(
                                        child: GridView.count(
                                          shrinkWrap: true,
                                          childAspectRatio:
                                              (itemWidth / itemHeight),
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          crossAxisCount: 2,
                                          padding: EdgeInsets.only(
                                              top: 8,
                                              left: 6,
                                              right: 6,
                                              bottom: 12),
                                          children: List.generate(
                                              model.homeResponse.data.products
                                                  .length, (index) {
                                            return Container(
                                              child: Card(
                                                clipBehavior: Clip.antiAlias,
                                                child: InkWell(
                                                  onTap: () {
                                                    print('Card tapped.');
                                                  },
                                                  child: Container(
                                                    width: 160.0,
                                                    child: Card(
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      child: InkWell(
                                                        onTap: () {
                                                          Navigator.push(
                                                              context,
                                                              new MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          new DetailsScreen(
                                                                            id: model.homeResponse.data.products[index].id,
                                                                          )));

//                                    Navigator.pushNamed(
//                                        context, '/products',
//                                        arguments: i);
                                                        },
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .end,
                                                          children: <Widget>[
                                                            Container(
                                                              child: Icon(
                                                                Icons
                                                                    .favorite_border,
                                                                color:
                                                                    Colors.blue,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 130,
                                                              child: Center(
                                                                child:
                                                                    CachedNetworkImage(
                                                                  fit: BoxFit
                                                                      .fill,
                                                                  imageUrl: model
                                                                              .homeResponse
                                                                              .data
                                                                              .products[
                                                                                  index]
                                                                              .mainImage !=
                                                                          null
                                                                      ? model
                                                                          .homeResponse
                                                                          .data
                                                                          .products[
                                                                              index]
                                                                          .mainImage
                                                                      : "images/logo.png",
                                                                  placeholder: (context,
                                                                          url) =>
                                                                      Center(
                                                                          child:
                                                                              CircularProgressIndicator()),
                                                                  errorWidget: (context,
                                                                          url,
                                                                          error) =>
                                                                      new Icon(Icons
                                                                          .error),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 20,
                                                            ),
                                                            Align(
                                                              alignment: Alignment
                                                                  .centerLeft,
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    model
                                                                        .homeResponse
                                                                        .data
                                                                        .products[
                                                                            index]
                                                                        .name,
                                                                    maxLines: 1,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            14,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  Text(
                                                                      '#' +
                                                                          model
                                                                              .homeResponse
                                                                              .data
                                                                              .products[
                                                                                  index]
                                                                              .id
                                                                              .toString(),
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .grey,
                                                                      ))
                                                                ],
                                                              ),
                                                            ),
                                                            Row(children: [
                                                              RichText(
                                                                text:
                                                                    new TextSpan(
                                                                  text: (double.parse(model.homeResponse.data.products[index].price.amount)
                                                                              .toInt())
                                                                          .toString() +
                                                                      '\$  ',
                                                                  style: new TextStyle(
                                                                      decoration: model.homeResponse.data.products[index].price.amount != model.homeResponse.data.products[index].sellingPrice.amount
                                                                          ? TextDecoration
                                                                              .lineThrough
                                                                          : TextDecoration
                                                                              .none,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color: Colors
                                                                          .black),
                                                                  children: <
                                                                      TextSpan>[
                                                                    model.homeResponse.data.products[index].price.amount !=
                                                                            model
                                                                                .homeResponse
                                                                                .data
                                                                                .products[
                                                                                    index]
                                                                                .sellingPrice
                                                                                .amount
                                                                        ? new TextSpan(
                                                                            text: (double.parse(model.homeResponse.data.products[index].sellingPrice.amount).toInt()).toString() +
                                                                                '\$',
                                                                            style:
                                                                                new TextStyle(
                                                                              fontWeight: FontWeight.bold,
                                                                              color: Colors.black,
                                                                              decoration: TextDecoration.none,
                                                                            ))
                                                                        : TextSpan(
                                                                            text:
                                                                                ""),
                                                                  ],
                                                                ),
                                                              ),
                                                              model
                                                                          .homeResponse
                                                                          .data
                                                                          .products[
                                                                              index]
                                                                          .price
                                                                          .amount !=
                                                                      model
                                                                          .homeResponse
                                                                          .data
                                                                          .products[
                                                                              index]
                                                                          .sellingPrice
                                                                          .amount
                                                                  ? Expanded(
                                                                      child:
                                                                          Align(
                                                                        alignment:
                                                                            Alignment.centerRight,
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              51,
                                                                          height:
                                                                              51,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            border:
                                                                                Border.all(width: 3, color: Colors.orange),
                                                                            borderRadius:
                                                                                BorderRadius.all(
                                                                              Radius.circular(600),
                                                                            ),
                                                                            color:
                                                                                Colors.orange,
                                                                          ),
                                                                          child: Center(
                                                                              child: model.homeResponse.data.products[index].price.amount != model.homeResponse.data.products[index].sellingPrice.amount
                                                                                  ? Text(
                                                                                      '77%',
                                                                                      style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
                                                                                    )
                                                                                  : Container()),
                                                                        ),
                                                                      ),
                                                                    )
                                                                  : Container(
                                                                      width: 51,
                                                                      height:
                                                                          51,
                                                                    )
                                                            ]),
                                                            Align(
                                                              alignment: Alignment
                                                                  .centerLeft,
                                                              child:
                                                                  SmoothStarRating(
                                                                      allowHalfRating:
                                                                          false,
                                                                      onRated:
                                                                          (value) {
//                                            _rating = value;
                                                                      },
                                                                      starCount:
                                                                          5,
                                                                      rating: 4,
                                                                      size:
                                                                          15.0,
                                                                      isReadOnly:
                                                                          true,
                                                                      color: Colors
                                                                          .deepOrangeAccent,
                                                                      borderColor:
                                                                          Colors
                                                                              .deepOrangeAccent,
                                                                      spacing:
                                                                          0.0),
                                                            ),
                                                            SizedBox(
                                                              height: 12,
                                                            ),
                                                            Expanded(
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                color:
                                                                    Colors.blue,
                                                                child: Center(
                                                                    child: Text(
                                                                  'Add to cart',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white),
                                                                )),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          }),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          : Center(
                              child: Text('empty'),
                            );
                }));
  }

  void refreshScreen(HomeViewModel model) {
    model.getHome("");
  }
}
