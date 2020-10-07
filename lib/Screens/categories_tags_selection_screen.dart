import 'package:flutter/material.dart';
import 'package:chips_choice/chips_choice.dart';
import 'package:async/async.dart';
import 'package:dio/dio.dart';


class CategoriesTagsSelectionScreen extends StatefulWidget {

  @override
  _CategoriesTagsSelectionScreenState createState() => _CategoriesTagsSelectionScreenState();
}

class _CategoriesTagsSelectionScreenState extends State<CategoriesTagsSelectionScreen> {

  int tag = 1;
  List<String> tags = [];

  List<String> options = [
    'News', 'Entertainment', 'Politics',
    'Automotive', 'Sports', 'Education',
    'Fashion', 'Travel', 'Food', 'Tech',
    'Science',
  ];

//  String user;
//  final usersMemoizer = AsyncMemoizer<List<ChipsChoiceOption<String>>>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.grey[900], //change your color here
        ),
        title: Text('Choose a category' , style: TextStyle(color:Colors.grey[900] ),),
        actions: [
          IconButton(
            icon: Icon(Icons.check , color: Colors.blueAccent,),
            onPressed: (){
              print(tags.length);
              Navigator.of(context).pop(tags);
            },
          )
        ],

        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: ListView(
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
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


class Content extends StatelessWidget {

  final Widget child;

  Content({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.all(5),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
//          Container(
//            width: double.infinity,
//            padding: EdgeInsets.all(15),
//            color: Colors.blueGrey[50],
//            child: Text(
//              title,
//              style: TextStyle(
//                  color: Colors.blueGrey,
//                  fontWeight: FontWeight.w500
//              ),
//            ),
//          ),
          child,
        ],
      ),
    );
  }
}

