import 'package:flutter/material.dart';
import 'package:himaka/Screens/first_home_screen.dart';
import 'package:himaka/Screens/categories_screen.dart';
import 'package:himaka/Screens/settings_screen.dart';
import 'package:himaka/Screens/wallets_screen.dart';
import 'package:himaka/Screens/wish_list_screen.dart';
import 'package:himaka/utils/app_localizations.dart';
import 'package:himaka/utils/globals.dart';
import 'package:himaka/utils/searchDialog.dart';
import 'package:himaka/Screens/Chat/utils.dart';

import 'Chat/chatlist.dart';
import 'Chat/firebaseController.dart';
import 'Chat/notificationController.dart';

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

//  TextEditingController _nameTextController = TextEditingController();
//  TextEditingController _introTextController = TextEditingController();
//  File _userImageFile = File('');
//  String _userImageUrlFromFB = '';

  bool _isLoading = true;

  @override
  void initState() {
    NotificationController.instance.takeFCMTokenWhenAppLaunch();
    NotificationController.instance.initLocalNotification();
    setCurrentChatRoomID('none');
    _takeUserInformationFromFBDB();
    _saveDataToServer();
    super.initState();
  }

  _moveToChatList(data) {
    setState(() {
      _isLoading = false;
    });
    if (data != null) {
      print('go to chat');
//      Navigator.push(
//          context,
//          MaterialPageRoute(
//              builder: (context) => ChatList(data, "name")));
    } else {
      _showDialog('Save user data error');
    }
  }

  _takeUserInformationFromFBDB() async {
    FirebaseController.instanace
        .takeUserInformationFromFBDB()
        .then((documents) {
      if (documents.length > 0) {
        print('there is a user saved in FBDB');
//        _nameTextController.text = documents[0]['name'];
//        _introTextController.text = documents[0]['intro'];
//        setState(() {
//          _userImageUrlFromFB = documents[0]['userImageUrl'];
//        });
      }
      setState(() {
        _isLoading = false;
      });
    });
  }

  _showDialog(String msg) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(msg),
          );
        });
  }

  _saveDataToServer() {
    setState(() {
      _isLoading = true;
    });
    String alertString = checkValidUserData(Globals.userData.first_name,
        Globals.userData.last_name, Globals.userData.token);

    if (alertString.trim() != '') {
      _showDialog(alertString);
    } else {
      FirebaseController.instanace
          .saveUserDataToFirebaseDatabase(
        randomIdWithName(Globals.userData.first_name),
        Globals.userData.first_name,
      )
          .then((data) {
        _moveToChatList(data);
      });
//      _userImageUrlFromFB != ''
//          ? FirebaseController.instanace
//          .saveUserDataToFirebaseDatabase(
//          randomIdWithName(_nameTextController.text),
//          _nameTextController.text,
//          _introTextController.text,
//          _userImageUrlFromFB)
//          .then((data) {
//        _moveToChatList(data);
//      })
//          : FirebaseController.instanace
//          .saveUserImageToFirebaseStorage(
//          randomIdWithName(_nameTextController.text),
//          _nameTextController.text,
//          _introTextController.text,
//          _userImageFile)
//          .then((data) {
//        _moveToChatList(data);
//      });
    }
  }
}
