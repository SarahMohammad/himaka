import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:himaka/Screens/first_home_screen.dart';
import 'package:himaka/Screens/categories_screen.dart';
import 'package:himaka/Screens/settings_screen.dart';
import 'package:himaka/Screens/wallets_screen.dart';
import 'package:himaka/Screens/wish_list_screen.dart';
import 'package:himaka/utils/app_localizations.dart';
import 'package:himaka/utils/searchDialog.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedTab = 0;
  TextEditingController searchKeyController = new TextEditingController();

  final _pageOptions = [
    FirstHomeScreen(),
    FirstHomeScreen(),
    HomeScreen(),
    WalletsScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFf5f5f5),
          elevation: 0.0,
          title: InkWell(
            onTap: () {
              showSearchDialog(context,
                  searchKeyController: searchKeyController);
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: new BorderRadius.all(Radius.circular(25)),
              ),
              child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                          child: Text(
                        AppLocalizations.of(context).translate('search_hint'),
                        style: TextStyle(color: Colors.black38, fontSize: 13),
                        overflow: TextOverflow.ellipsis,
                      )),
                      Icon(
                        Icons.search,
                        color: Colors.black38,
                      )
                    ],
                  )),
            ),
          ),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('images/logo.png'),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.favorite,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new WishListScreen()));
              },
            ),
            IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: _pageOptions[_selectedTab],
        bottomNavigationBar: new Theme(
          data: Theme.of(context).copyWith(
            // sets the background color of the `BottomNavigationBar`
            canvasColor: Colors.blue,
          ),
          child: BottomNavigationBar(
            currentIndex: _selectedTab,
            onTap: (int index) {
              setState(() {
                _selectedTab = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.blue[900],
                ),
                title: Text(
                  "",
                ),
                activeIcon: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.lightbulb_outline,
                  color: Colors.blue[900],
                ),
                title: Text(
                  "",
                ),
                activeIcon: Icon(
                  Icons.lightbulb_outline,
                  color: Colors.white,
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.list,
                  color: Colors.blue[900],
                ),
                title: Text(
                  "",
                ),
                activeIcon: Icon(
                  Icons.list,
                  color: Colors.white,
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.folder_shared,
                  color: Colors.blue[900],
                ),
                title: Text(
                  "",
                ),
                activeIcon: Icon(
                  Icons.folder_shared,
                  color: Colors.white,
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                  color: Colors.blue[900],
                ),
                title: Text(
                  "",
                ),
                activeIcon: Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ));
  }
}
