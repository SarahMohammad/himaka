//import 'package:flutter/gestures.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';
//
//class HomeScreen extends StatefulWidget {
//  @override
//  _HomeScreenState createState() => new _HomeScreenState();
//}
//
//class _HomeScreenState extends State<HomeScreen> {
//
//  final controller = PageController(
//    initialPage: 0,
//  );
//
//  @override
//  Widget build(BuildContext context) {
//
//
//
//
//    Expanded(child : Align(
//        alignment: FractionalOffset.bottomCenter,
//        child:
//
//        RichText(
//          textAlign: TextAlign.center,
//          text: new TextSpan(
//            text: 'by creating or logging to an account you agree to out ',
//            children: <TextSpan>[
//              new TextSpan(
//                  text: 'terms and conditions',
//                  style: new TextStyle(decoration: TextDecoration.underline,)
//              ),
//              new TextSpan(text: ' and '),
//              new TextSpan(
//                text: 'privacy policy',
//                style: new TextStyle(
//                  decoration: TextDecoration.underline,
//                ),
//                recognizer: new TapGestureRecognizer()..onTap = () => print('Tap Here onTap'),
//
//              ),
//            ],
//          ),
//        )
//    ));
//
//    return Scaffold(
//      body: Row(
//        children: [
//          Flexible(
//            flex: 1,
//            child: Container(
//              child: ListView(children: [
//                InkWell(child: Text('hi' , style: TextStyle(fontSize: 23),), onTap: (){
//                  controller.jumpToPage(0);
//                },),
//                InkWell(child: Text('non'), onTap: (){
//                  controller.jumpToPage(1);
//
//                },),
//                InkWell(child: Text('bbb'), onTap: (){
//                  controller.jumpToPage(2);
//
//                },),
//                InkWell(child: Text('bbb'), onTap: (){
//                  controller.jumpToPage(2);
//
//                },),
//                InkWell(child: Text('bbb'), onTap: (){
//                  controller.jumpToPage(2);
//
//                },),
//                InkWell(child: Text('bbb'), onTap: (){
//                  controller.jumpToPage(2);
//
//                },),
//              ],),
//            ),
//          ),
//
//
//
//          Flexible(
//            flex: 2,
//            child: Container(
//              child: PageView(
//              controller: controller,
//              onPageChanged: (page)=>{ print(page.toString()) },
//              pageSnapping: false,
//              children: <Widget>[
//                Container(
//                    color: Colors.pink,
//                    child: Center(
//                        child: Text('This is Widget 1',
//                          style: TextStyle(fontSize: 25,
//                              color: Colors.white),))
//                ),
//
//                Container(
//                    color: Colors.green,
//                    child: Center(
//                        child: Text('This is Widget - 2',
//                          style: TextStyle(fontSize: 25,
//                              color: Colors.white),))
//                ),
//
//                Container(
//                    color: Colors.lightBlue,
//                    child: Center(
//                        child: Text('This is Widget - 3',
//                          style: TextStyle(fontSize: 25,
//                              color: Colors.white),))
//                ),
//
//              ],
//            ),
//
//            ),
//          )
//
//
//
//        ],
//      ),
//    );
//  }
//}


import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  final List<Map<String, dynamic>> subcategory = [
    {"title": "Mobiles"},
    { "title": "Electronics"},
    {"title": "Home"},
    { "title": "Health and beauty"},
    {"title": "Supermarket"},
    { "title": "Fashion"},
    {"title": "Baby products"},
    { "title": "makeup"},
  ];

  final List<List<Map<String, dynamic>>> categoryItem = [
    [
      {
        'image':
        'https://static.digit.in/default/thumb_97296_default_td_480x480.jpeg',
        'title': 'Mobile',
      },
      {
        'image':
        'https://www.fewabazar.com/images/thumbs/000/0009941_cg-halogen-heater-cg-hh12c02.jpeg',
        'title': 'Heater',
      },
      {
        'image':
        'https://static.digit.in/default/thumb_97296_default_td_480x480.jpeg',
        'title': 'Mobile',
      },
      {
        'image':
        'https://www.fewabazar.com/images/thumbs/000/0009941_cg-halogen-heater-cg-hh12c02.jpeg',
        'title': 'Heater',
      },
    ],
    [
      {
        'image':
        'https://static.digit.in/default/thumb_97296_default_td_480x480.jpeg',
        'title': 'Mobile',
      },
      {
        'image':
        'https://fsmedia.imgix.net/b5/62/42/90/3869/4dbd/bffc/322850808ab7/dellxps131jpg.jpeg?rect=0%2C227%2C1280%2C640&auto=format%2Ccompress&dpr=2&w=650',
        'title': 'Laptop',
      },
    ],
    [
      {
        'image':
        'https://imgaz.staticbg.com/thumb/large/oaupload/banggood/images/90/95/071d6d84-b3a8-4a58-9314-e300dc0a8de7.jpg',
        'title': 'Earphone',
      },
      {
        'image':
        'https://images-na.ssl-images-amazon.com/images/I/81ClkOh2gpL._SX355_.jpg',
        'title': 'Memory Card',
      },
    ],
    [
      {
        'image':
        'https://static.digit.in/default/thumb_97296_default_td_480x480.jpeg',
        'title': 'Mobile',
      },
      {
        'image':
        'https://fsmedia.imgix.net/b5/62/42/90/3869/4dbd/bffc/322850808ab7/dellxps131jpg.jpeg?rect=0%2C227%2C1280%2C640&auto=format%2Ccompress&dpr=2&w=650',
        'title': 'Laptop',
      },
    ],
    [
      {
        'image':
        'https://imgaz.staticbg.com/thumb/large/oaupload/banggood/images/90/95/071d6d84-b3a8-4a58-9314-e300dc0a8de7.jpg',
        'title': 'Earphone',
      },
      {
        'image':
        'https://images-na.ssl-images-amazon.com/images/I/81ClkOh2gpL._SX355_.jpg',
        'title': 'Memory Card',
      },
    ],
    [
      {
        'image':
        'https://static.digit.in/default/thumb_97296_default_td_480x480.jpeg',
        'title': 'Mobile',
      },
      {
        'image':
        'https://fsmedia.imgix.net/b5/62/42/90/3869/4dbd/bffc/322850808ab7/dellxps131jpg.jpeg?rect=0%2C227%2C1280%2C640&auto=format%2Ccompress&dpr=2&w=650',
        'title': 'Laptop',
      },
    ],
    [
      {
        'image':
        'https://imgaz.staticbg.com/thumb/large/oaupload/banggood/images/90/95/071d6d84-b3a8-4a58-9314-e300dc0a8de7.jpg',
        'title': 'Earphone',
      },
      {
        'image':
        'https://images-na.ssl-images-amazon.com/images/I/81ClkOh2gpL._SX355_.jpg',
        'title': 'Memory Card',
      },
    ],
    [
      {
        'image':
        'https://static.digit.in/default/thumb_97296_default_td_480x480.jpeg',
        'title': 'Mobile',
      },
      {
        'image':
        'https://fsmedia.imgix.net/b5/62/42/90/3869/4dbd/bffc/322850808ab7/dellxps131jpg.jpeg?rect=0%2C227%2C1280%2C640&auto=format%2Ccompress&dpr=2&w=650',
        'title': 'Laptop',
      },
    ],
    [
      {
        'image':
        'https://imgaz.staticbg.com/thumb/large/oaupload/banggood/images/90/95/071d6d84-b3a8-4a58-9314-e300dc0a8de7.jpg',
        'title': 'Earphone',
      },
      {
        'image':
        'https://images-na.ssl-images-amazon.com/images/I/81ClkOh2gpL._SX355_.jpg',
        'title': 'Memory Card',
      },
    ],
  ];

  int selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(

      body: Container(
        height: screenSize.height,
        width: screenSize.width,
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                height: screenSize.height,
                child: ListView.builder(
                  itemCount: subcategory.length,
                  itemBuilder: (context, index) {
                    return LayoutBuilder(
                      builder: (context, constraint) {
                        double conHeight = constraint.maxWidth * 0.8;
                        double textHeight = conHeight / 10;
                        return InkWell(
                          onTap: () {
                            setState(() {
                              selectedCategory = index;
                            });
                          },
                          child: Container(
                            height: conHeight,
                            width: constraint.maxWidth,
                            padding: EdgeInsets.all(8),
                            color: index == selectedCategory
                                ? Colors.white
                                : Colors.grey[200],
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
//                                Icon(
//                                  subcategory[index]['icon'],
//                                  size: textHeight * 3,
//                                  color: index == selectedCategory
//                                      ? Colors.lightBlueAccent
//                                      : Colors.grey,
//                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Text(
                                  subcategory[index]['title'],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: index == selectedCategory
                                          ? Colors.lightBlueAccent
                                          : Colors.black,
                                      fontSize: textHeight * 1.5,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                height: screenSize.height,
                child: LayoutBuilder(
                  builder: (context, constraint) {
                    return Container(
                      padding: EdgeInsets.all(8),
                      width: constraint.maxWidth,
                      height: screenSize.height,
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1 / 1.1,
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 5,
                        ),
                        itemCount: categoryItem[selectedCategory].length,
                        itemBuilder: (context, index) {
                          return LayoutBuilder(
                            builder: (context, cons) {
                              return GridTile(
                                child: Column(
                                  children: <Widget>[
                                    ClipRRect(
                                      child: Container(
                                        color: Colors.grey ,
                                        child: Image.network(
                                          categoryItem[selectedCategory][index]
                                          ['image'],
                                          fit: BoxFit.contain,
                                          height: cons.maxHeight - 30,
                                        ),
                                      ),
                                      borderRadius: BorderRadius.circular(40.0),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      categoryItem[selectedCategory][index]
                                      ['title'],
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
