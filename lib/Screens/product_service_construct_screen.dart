import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'categories_tags_selection_screen.dart';


class ProductServiceConstructScreen extends StatefulWidget {
  @override
  _ProductServiceConstructScreenState createState() => _ProductServiceConstructScreenState();
}

class _ProductServiceConstructScreenState extends State<ProductServiceConstructScreen> {

 String ress = 'Select category';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text('Add pictures' , style: TextStyle(fontSize: 17),),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.white,
              ),
              boxShadow: [
                BoxShadow(
                  color : Colors.grey[300],
                  offset: Offset(0.0, 1.0), //(x,y)
                  blurRadius: 6.0,
                ),
              ],
            ),
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                      Flexible(
                        flex : 1 ,
                        child: Container(
                            color: Colors.lightBlue,
                          child : Center(child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.camera_alt , color: Colors.white,size: 55,),
                              Text('Add picture' , style:TextStyle(color: Colors.white))
                            ],
                          ),)
                        ),
                      ),
                      SizedBox(width: 13,),
                      Flexible(
                        flex : 1 ,
                        child: Container(
                            color : Colors.grey[300],
                            child : Center(child: Icon(Icons.add),)
                        ),
                      ),
                        SizedBox(width: 13,),

                        Flexible(
                        flex : 1 ,
                        child: Container(
                            color : Colors.grey[300],
                            child : Center(child: Icon(Icons.add),)
                        ),
                      )
                    ],),
                  ),
                ),

                SizedBox(height: 13,),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    height: 100,
                    child: Row(children: [
                      Flexible(
                        flex : 1 ,
                        child: Container(
                            color : Colors.grey[300],
                            child : Center(child: Icon(Icons.add),)
                        ),
                      ),
                      SizedBox(width: 13,),

                      Flexible(
                        flex : 1 ,
                        child: Container(
                            color : Colors.grey[300],
                            child : Center(child: Icon(Icons.add),)
                        ),
                      ),
                      SizedBox(width: 13,),

                      Flexible(
                        flex : 1 ,
                        child: Container(
                            color : Colors.grey[300],
                            child : Center(child: Icon(Icons.add),)
                        ),
                      )
                    ],),
                  ),
                ),


              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text('Details' , style: TextStyle(fontSize: 17),),
          ),
          Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.white,
                ),
                boxShadow: [
                  BoxShadow(
                    color : Colors.grey[300],
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 6.0,
                  ),
                ],
              ),
            child : Column(children: [
              TextFormField(
                initialValue: 'Title',

              ),


              InkWell(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical :10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Text(ress),
                    Icon(Icons.arrow_forward_ios)
                  ],),
                ),
                onTap: () async {

                  List<String> res = await Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (
                              context) => new CategoriesTagsSelectionScreen()));

                  if(res.length!=0) {
                    setState(() {
                      ress =res.toString();
                    });
                  }

                },
              ),

              Divider(color: Colors.grey[900],),
              TextFormField(
                initialValue: 'Description',

              ),
              TextFormField(
                initialValue: 'Price',

              ),

              TextFormField(
                initialValue: 'Discount',

              ),

            ],)
          )
        ]
      ),
    );
  }
}
