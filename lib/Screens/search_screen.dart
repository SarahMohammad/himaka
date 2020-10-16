import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:himaka/Screens/DetailsScreen/details_screen.dart';
import 'package:himaka/Screens/filter_screen.dart';
import 'package:himaka/ViewModels/base_model.dart';
import 'package:himaka/ViewModels/search_view_model.dart';
import 'package:himaka/services/base_view.dart';
import 'package:himaka/services/locator.dart';
import 'package:himaka/utils/AppLanguage.dart';
import 'package:himaka/utils/app_localizations.dart';
import 'package:rect_getter/rect_getter.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class SearchScreen extends StatefulWidget {
  final String sKey;

  SearchScreen(this.sKey);

  @override
  _SearchScreenState createState() => _SearchScreenState(sKey);
}

class _SearchScreenState extends State<SearchScreen> {
  String searchKey;
  var _keys = {};

  _SearchScreenState(this.searchKey);

  TextEditingController searchKeyController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchKey = widget.sKey;
    searchKeyController = new TextEditingController(text: searchKey);
  }

  @override
  Widget build(BuildContext context) {
    var listViewKey = RectGetter.createGlobalKey();
    List<int> getVisible() {
      /// First, get the rect of ListView, and then traver the _keys
      /// get rect of each item by keys in _keys, and if this rect in the range of ListView's rect,
      /// add the index into result list.
      var rect = RectGetter.getRectFromKey(listViewKey);
      var _items = <int>[];
      _keys.forEach((index, key) {
        var itemRect = RectGetter.getRectFromKey(key);
        if (itemRect != null &&
            !(itemRect.top > rect.bottom || itemRect.bottom < rect.top))
          _items.add(index);
      });

      /// so all visible item's index are in this _items.
      return _items;
    }

    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 20) / 1.7;
    final double itemWidth = size.width / 2;
    return BaseView<SearchViewModel>(
        onModelReady: (model) {
          refreshScreen(model);
        },
        builder:
            (context, model, child) => LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints viewportConstraints) {
                  return Scaffold(
                    appBar: AppBar(
                      backgroundColor: Color(0xFFf5f5f5),
                      iconTheme: IconThemeData(
                        color: Colors.grey[900], //change your color here
                      ),
                      elevation: 0.0,
                      title: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius:
                              new BorderRadius.all(Radius.circular(30)),
                        ),
                        child: TextFormField(
                          controller: searchKeyController,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 16),
                            suffixIcon: InkWell(
                              onTap: () {
                                print('ff');
                              },
                              child: Icon(
                                Icons.search,
                                color: Colors.black38,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            hintStyle:
                                TextStyle(color: Colors.black38, fontSize: 13),
                            hintText: AppLocalizations.of(context)
                                .translate('search_hint'),
                          ),
                        ),
                      ),
                    ),
                    body: model.response != null
                        ? Stack(
                            children: [
                              NotificationListener<ScrollUpdateNotification>(
                                onNotification: (notification) {
                                  List<int> x = getVisible();
                                  print(x);
                                  if (x != null && x.length > 0) {
                                    model.visibleItemsCount =
                                        (x[x.length - 1] + 1).toString();
                                  }

                                  return true;
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0, vertical: 8),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              new MaterialPageRoute(
                                                  builder: (context) =>
                                                      new FilterScreen()));
                                        },
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .35,
                                          // width: 130,
                                          height: 50,
                                          decoration: BoxDecoration(
                                              color: Color(0xFF45afe1),
                                              borderRadius:
                                                  BorderRadius.circular(5.0)),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 16.0, vertical: 8),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.filter_list,
                                                  color: Colors.white,
                                                  size: 30,
                                                ),
                                                SizedBox(
                                                  width: 4,
                                                ),
                                                Text(
                                                  AppLocalizations.of(context)
                                                      .translate('filter'),
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: RectGetter(
                                          key: listViewKey,
                                          child: GridView.count(
                                            shrinkWrap: true,
                                            childAspectRatio:
                                                (itemWidth / itemHeight),
                                            crossAxisCount: 2,
                                            padding: EdgeInsets.only(
                                                top: 8,
                                                left: 6,
                                                right: 6,
                                                bottom: 12),
                                            children:
                                                List.generate(1000, (index) {
                                              _keys[index] =
                                                  RectGetter.createGlobalKey();
                                              return RectGetter(
                                                key: _keys[index],
                                                child: Container(
                                                  child: Card(
                                                    clipBehavior:
                                                        Clip.antiAlias,
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
                                                                              new DetailsScreen()));

//                                    Navigator.pushNamed(
//                                        context, '/products',
//                                        arguments: i);
                                                            },
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .end,
                                                              children: <
                                                                  Widget>[
                                                                Container(
                                                                  child: Icon(
                                                                    Icons
                                                                        .favorite_border,
                                                                    color: Colors
                                                                        .blue,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 130,
                                                                  child:
                                                                      CachedNetworkImage(
                                                                    fit: BoxFit
                                                                        .fill,
                                                                    imageUrl:
                                                                        "https://static.digit.in/default/thumb_97296_default_td_480x480.jpeg",
                                                                    placeholder: (context,
                                                                            url) =>
                                                                        Center(
                                                                            child:
                                                                                CircularProgressIndicator()),
                                                                    errorWidget: (context,
                                                                            url,
                                                                            error) =>
                                                                        new Icon(
                                                                            Icons.error),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 20,
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      Alignment
                                                                          .centerLeft,
                                                                  child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        'Two Gold Rings',
                                                                        style: TextStyle(
                                                                            color: Colors
                                                                                .black,
                                                                            fontSize:
                                                                                14,
                                                                            fontWeight:
                                                                                FontWeight.bold),
                                                                      ),
                                                                      Text(
                                                                          '#200',
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                Colors.grey,
                                                                          ))
                                                                    ],
                                                                  ),
                                                                ),
                                                                Row(children: [
                                                                  RichText(
                                                                    text:
                                                                        new TextSpan(
                                                                      text:
                                                                          '700\$    ',
                                                                      style: new TextStyle(
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          color:
                                                                              Colors.black),
                                                                      children: <
                                                                          TextSpan>[
                                                                        new TextSpan(
                                                                            text:
                                                                                '900\$',
                                                                            style:
                                                                                new TextStyle(
                                                                              fontWeight: FontWeight.bold,
                                                                              color: Colors.black,
                                                                              decoration: TextDecoration.lineThrough,
                                                                            )),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          Alignment
                                                                              .centerRight,
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            51,
                                                                        height:
                                                                            51,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          border: Border.all(
                                                                              width: 3,
                                                                              color: Colors.orange),
                                                                          borderRadius:
                                                                              BorderRadius.all(
                                                                            Radius.circular(600),
                                                                          ),
                                                                          color:
                                                                              Colors.orange,
                                                                        ),
                                                                        child: Center(
                                                                            child: Text(
                                                                          '-55%',
                                                                          style: TextStyle(
                                                                              color: Colors.white,
                                                                              fontSize: 11,
                                                                              fontWeight: FontWeight.bold),
                                                                        )),
                                                                      ),
                                                                    ),
                                                                  )
                                                                ]),
                                                                Align(
                                                                  alignment:
                                                                      Alignment
                                                                          .centerLeft,
                                                                  child: SmoothStarRating(
                                                                      allowHalfRating: false,
                                                                      onRated: (value) {
//                                            _rating = value;
                                                                      },
                                                                      starCount: 5,
                                                                      rating: 4,
                                                                      size: 15.0,
                                                                      isReadOnly: true,
                                                                      color: Colors.deepOrangeAccent,
                                                                      borderColor: Colors.deepOrangeAccent,
                                                                      spacing: 0.0),
                                                                ),
                                                                SizedBox(
                                                                  height: 12,
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Container(
                                                                    width: double
                                                                        .infinity,
                                                                    color: Colors
                                                                        .blue,
                                                                    child: Center(
                                                                        child: Text(
                                                                      'Add to cart',
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.white),
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
                                                ),
                                              );
                                            }),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              model.visibleItemsCount.isNotEmpty
                                  ? Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            borderRadius: new BorderRadius.all(
                                                Radius.circular(15)),
                                            color: Color(0xFF45afe1),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 16.0, vertical: 8),
                                            child: Text(
                                              '1000 / ' +
                                                  model.visibleItemsCount,
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ))
                                  : Container()
                            ],
                          )
                        : model.state == ViewState.Idle
                            ? Scaffold(
                                backgroundColor: Colors.transparent,
                                body: Container(
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          AppLocalizations.of(context)
                                              .translate('network_failed'),
                                        ),
                                        RaisedButton(
                                          onPressed: () {
                                            refreshScreen(model);
                                          },
                                          color:
                                              Color.fromRGBO(235, 85, 85, 100),
                                          child: Icon(Icons.refresh),
                                          shape: new RoundedRectangleBorder(
                                              borderRadius:
                                                  new BorderRadius.circular(30),
                                              side: BorderSide(
                                                  color: Color.fromRGBO(
                                                      235, 85, 85, 100))),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            : Center(
                                child: CircularProgressIndicator(
                                  backgroundColor: Colors.lightBlue,
                                ),
                              ),
                  );
                }));
  }

  refreshScreen(SearchViewModel model) {
    model.search(locator<AppLanguage>().appLocal.languageCode, searchKey);
  }
}
