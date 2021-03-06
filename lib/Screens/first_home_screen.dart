
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:himaka/Screens/add_product_service.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import 'DetailsScreen/details_screen.dart';

class FirstHomeScreen extends StatefulWidget {
  @override
  _FirstHomeScreenState createState() => _FirstHomeScreenState();
}

class _FirstHomeScreenState extends State<FirstHomeScreen> {



  Widget image_carousel = new Container(
    height: 200.0,
    child:  Container(
      color: Colors.orange,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          Image.network('https://static.digit.in/default/thumb_97296_default_td_480x480.jpeg'),
          Image.network('https://static.digit.in/default/thumb_97296_default_td_480x480.jpeg'),
          Image.network('https://static.digit.in/default/thumb_97296_default_td_480x480.jpeg'),
          Image.network('https://static.digit.in/default/thumb_97296_default_td_480x480.jpeg'),
          Image.network('https://static.digit.in/default/thumb_97296_default_td_480x480.jpeg'),
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
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 20) / 1.7;
    final double itemWidth = size.width / 2;

    return  Container(
        child:  ListView(
          children: [
            new Column(
              children: <Widget>[
                //image carousel begins here
                image_carousel,

                //padding widget
                new Padding(padding: const EdgeInsets.all(10.0),
                  child: InkWell(
                    onTap: (){

                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (
                                  context) => new AddProductService()));
                    },
                    child: Container(

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(19.0),
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.white,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.0, 1.0), //(x,y)
                              blurRadius: 6.0,
                            ),
                          ],
                        ),
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.add , color: Colors.blue,),
                              SizedBox(width: 5,),
                              Text('Categories' ),
                            ],
                          ),
                        )
                    ),
                  ),),

                //Horizontal list view begins here
//          HorizontalList(),

                //padding widget
                new Padding(padding: const EdgeInsets.all(8.0),
                  child: Container(

                      alignment: Alignment.centerLeft,
                      child: new Text('Recent products')),),

                //grid view
//          Flexible(child: Products()),

                Container(
                  child: GridView.count(
                    shrinkWrap: true,
                    childAspectRatio: (itemWidth / itemHeight),
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    padding: EdgeInsets.only(
                        top: 8, left: 6, right: 6, bottom: 12),
                    children: List.generate(4, (index) {
                      return Container(
                        child: Card(
                          clipBehavior: Clip.antiAlias,
                          child: InkWell(
                            onTap: () {
                              print('Card tapped.');
                            },
                            child:
                            Container(
                              width: 160.0,
                              child: Card(
                                clipBehavior: Clip.antiAlias,
                                child: InkWell(
                                  onTap: () {

                                    Navigator.push(
                                        context,
                                        new MaterialPageRoute(
                                            builder: (
                                                context) => new DetailsScreen()));

//                                    Navigator.pushNamed(
//                                        context, '/products',
//                                        arguments: i);
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.end,
                                    children: <Widget>[
                                      Container(child: Icon(Icons.favorite_border , color: Colors.blue,),),
                                      SizedBox(
                                        height: 130,
                                        child: CachedNetworkImage(
                                          fit: BoxFit.fill,
                                          imageUrl: "https://static.digit.in/default/thumb_97296_default_td_480x480.jpeg",
                                          placeholder: (context, url) =>
                                              Center(
                                                  child:
                                                  CircularProgressIndicator()),
                                          errorWidget:
                                              (context, url, error) =>
                                          new Icon(Icons.error),
                                        ),
                                      ),
                                      SizedBox(height: 20,),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Two Gold Rings',
                                              style: TextStyle(color: Colors.black , fontSize: 14 , fontWeight: FontWeight.bold),
                                            ),
                                            Text('#200',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    ))
                                          ],
                                        ),
                                      ),
                                      Row(
                                        children: [
                                         RichText(

                                          text: new TextSpan(
                                            text: '700\$    ',
                                              style: new TextStyle( fontWeight: FontWeight.bold ,  color: Colors.black),

                                              children: <TextSpan>[
                                              new TextSpan(
                                                  text: '900\$',
                                                  style: new TextStyle( fontWeight: FontWeight.bold, color: Colors.black , decoration: TextDecoration.lineThrough,)
                                              ),
                                            ],
                                          ),
                                        ),
                                         Expanded(
                                           child: Align(
                                             alignment: Alignment.centerRight,
                                             child: Container(
                                               width: 51,
                                               height: 51,
                                               decoration: BoxDecoration(
                                               border: Border.all(width: 3 , color: Colors.orange),
                                               borderRadius: BorderRadius.all(
                                                 Radius.circular(600),

                                               ),
                                               color: Colors.orange,
                                             ),
                                             child: Center(child: Text('-55%' , style: TextStyle(color: Colors.white , fontSize: 11 , fontWeight: FontWeight.bold),)),
                                             ),
                                           ),
                                         )
                              ]
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: SmoothStarRating(
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
                                      ),
                                      SizedBox(height: 12,),
                                      Expanded(
                                        child: Container(
                                          width: double.infinity,
                                          color: Colors.blue,
                                        child: Center(child: Text('Add to cart' , style: TextStyle(color: Colors.white),)),),
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
      );
  }
}
