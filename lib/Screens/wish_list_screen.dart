import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
        title: Text('My Wishlist' , style: TextStyle(color:Colors.grey[900] ),),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body:ListView.separated(
        separatorBuilder: (context, index) => SizedBox(height: 5,),
        itemCount: 9,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.all(1.0),
          child: InkWell(
            onTap: () {
            },
            child: Card(
              color: Colors.white,
              elevation: 3.0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal : 9.0 , vertical: 1),
                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.camera_alt, size: 80,),
                    SizedBox(width: 20,),
                    Expanded(
                      child: Container(
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment
                              .start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Black Boots",
                                  style: TextStyle(
                                      fontSize: 20),
                                ),

                                Icon(Icons.favorite , color: Colors.blueAccent)
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "#345678",
                              style: TextStyle(
                                  fontSize: 12 , color: Colors.grey[400]),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  "180 ",
                                  style: TextStyle(
                                      color: Colors
                                          .grey),
                                ),
                                Text(
                                  "170",
                                  style: TextStyle(
                                      color: Colors
                                          .grey),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                              SmoothStarRating(
                                  allowHalfRating: false,
                                  onRated: (value) {
//                                            _rating = value;
                                  },
                                  starCount: 5,
                                  rating: 4,
                                  size: 15.0,
                                  isReadOnly:true,
                                  color: Colors.deepOrangeAccent,
                                  borderColor: Colors.deepOrangeAccent,
                                  spacing:0.0

                              ),
                              Icon(Icons.home , color: Colors.red[700],)
                            ],),
                            Divider(),
                            SizedBox(height: 3,),
                            Center(
                              child: Container(
                                width: MediaQuery.of(context).size.width/2-30,
                                child: FlatButton(
                                color: Colors.lightBlue
                                ,onPressed: (){},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Buy now' , style: TextStyle(color : Colors.white),),
                                    SizedBox(width: 5,),
                                    Icon(Icons.shopping_cart , color: Colors.white,)
                                  ],
                                ),),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),

                  ],
                )
              ),
            ),
          ),
        ),
      ),

    );
  }
}
