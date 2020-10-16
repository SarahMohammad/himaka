import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ReviewsContainer extends StatefulWidget {
  @override
  _ReviewsContainerState createState() => _ReviewsContainerState();
}

class _ReviewsContainerState extends State<ReviewsContainer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child:  ListView.separated(
            separatorBuilder: (context, index) => SizedBox(height: 5,),
            itemCount: 9,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.all(1.0),
              child: InkWell(
                onTap: () {
                },
                child: Card(
                  color: Colors.white,
                  elevation: 0.2,
                  child: ListTile(
                    leading: Icon(Icons.casino , size: 26,),
                    title: Text('Britney doe' , style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                    subtitle: Text('this is a review fot this product'  , style: TextStyle(fontSize: 11),),
                    trailing: SmoothStarRating(
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
                ),
              ),
            ),
          ),
        ),
        Container(width:MediaQuery.of(context).size.width,child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Add a review'  , style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
        )),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0 , vertical: 5),
              child: Text('Your rating:'),
            ),
            SizedBox(height: 3,),
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
          ],
        ),
        TextFormField(
          decoration: InputDecoration(

            hintText: 'type message here',
            fillColor: Colors.white,
            filled: true,
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          ),
        ),
        SizedBox(height: 10,),
        RaisedButton(
          child: Text('submit' , style: TextStyle(color: Colors.white),),
          color: Colors.lightBlue, onPressed: (){},
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        )
      ],
    );
  }
}
