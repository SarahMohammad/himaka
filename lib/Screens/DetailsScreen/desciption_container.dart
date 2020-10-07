import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class DescriptionContainer extends StatefulWidget {
  @override
  _DescriptionContainerState createState() => _DescriptionContainerState();
}

class _DescriptionContainerState extends State<DescriptionContainer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: ListView(
            children: [
              Card(
              color: Colors.white,
              elevation: 3.2,
              child: Text(" GitHub.ves open source contribution on GitHub.ves opencontribution on GitHub.ves open source contribution on GitHub.ves open source contribution on GitHub.ves open source contribution on GitHub.ves open source contribution on GitHub.ves open source contribution on GitHub."),
            )],
          ),
        ),
//         Spacer(),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
            child: Text('Related Items')),
      ),
         Expanded(
           flex: 3,
           child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(separatorBuilder: (context, index) => SizedBox(height: 5,),
            scrollDirection: Axis.horizontal,
            itemCount: 9,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.all(1.0),
              child: InkWell(
                onTap: () {
                },
                child: Container(
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

//                              Navigator.push(
//                                  context,
//                                  new MaterialPageRoute(
//                                      builder: (
//                                          context) => new DetailsScreen()));

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
                                  height: 50,
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
                ),
              ),
            ),)
        ),
         ),

      ],
    );
  }
}
