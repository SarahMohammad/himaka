import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:himaka/ViewModels/base_model.dart';
import 'package:himaka/ViewModels/wish_list_view_model.dart';
import 'package:himaka/services/base_view.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class WishListScreen extends StatefulWidget {
  @override
  _WishListScreenState createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.grey[900], //change your color here
          ),
          title: Text(
            'My Wishlist',
            style: TextStyle(color: Colors.grey[900]),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: BaseView<WishListViewModel>(
            onModelReady: (model) {
              refreshScreen(model);
            },
            builder: (context, model, child) => LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints viewportConstraints) {
                  if (model.wishListResponse != null) {}
                  return model.state == ViewState.Busy
                      ? Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.lightBlue,
                          ),
                        )
                      : model.wishListResponse != null
                          ? ListView.separated(
                              separatorBuilder: (context, index) => SizedBox(
                                height: 5,
                              ),
                              itemCount:
                                  model.wishListResponse.data.wishlist.length,
                              itemBuilder: (context, index) => Padding(
                                padding: EdgeInsets.all(1.0),
                                child: InkWell(
                                  onTap: () {},
                                  child: Card(
                                    color: Colors.white,
                                    elevation: 3.0,
                                    child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 9.0, vertical: 1),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            Image.network(
                                              model
                                                  .wishListResponse
                                                  .data
                                                  .wishlist[index]
                                                  .baseImage
                                                  .path,
                                              width: 80,
                                              height: 80,
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Expanded(
                                              child: Container(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          model
                                                              .wishListResponse
                                                              .data
                                                              .wishlist[index]
                                                              .name,
                                                          style: TextStyle(
                                                              fontSize: 20),
                                                        ),
                                                        Icon(Icons.favorite,
                                                            color: Colors
                                                                .blueAccent)
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                      "# " +
                                                          model
                                                              .wishListResponse
                                                              .data
                                                              .wishlist[index]
                                                              .id
                                                              .toString(),
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color:
                                                              Colors.grey[400]),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Row(
                                                      children: <Widget>[
                                                        Text(
                                                          model
                                                              .wishListResponse
                                                              .data
                                                              .wishlist[index]
                                                              .price
                                                              .amount
                                                              .toString(),
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              decoration:
                                                                  TextDecoration
                                                                      .lineThrough),
                                                        ),
                                                        SizedBox(
                                                          width: 8,
                                                        ),
                                                        Text(
                                                          model
                                                              .wishListResponse
                                                              .data
                                                              .wishlist[index]
                                                              .sellingPrice
                                                              .amount
                                                              .toString(),
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        SmoothStarRating(
                                                            allowHalfRating:
                                                                false,
                                                            onRated: (value) {
//                                            _rating = value;
                                                            },
                                                            starCount: 5,
                                                            rating: 4,
                                                            size: 15.0,
                                                            isReadOnly: true,
                                                            color: Colors
                                                                .deepOrangeAccent,
                                                            borderColor: Colors
                                                                .deepOrangeAccent,
                                                            spacing: 0.0),
                                                        Icon(
                                                          Icons.home,
                                                          color:
                                                              Colors.red[700],
                                                        )
                                                      ],
                                                    ),
                                                    Divider(),
                                                    SizedBox(
                                                      height: 3,
                                                    ),
                                                    Center(
                                                      child: Container(
                                                        width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width /
                                                                2 -
                                                            30,
                                                        child: FlatButton(
                                                          color:
                                                              Colors.lightBlue,
                                                          onPressed: () {},
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                'Buy now',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                              SizedBox(
                                                                width: 5,
                                                              ),
                                                              Icon(
                                                                Icons
                                                                    .shopping_cart,
                                                                color: Colors
                                                                    .white,
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        )),
                                  ),
                                ),
                              ),
                            )
                          : Center(
                              child: Text('empty'),
                            );
                })));
  }

  void refreshScreen(WishListViewModel model) {
    model.getWishList("");
  }
}
