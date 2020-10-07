import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:himaka/Screens/bookings_screen.dart';
import 'package:himaka/Screens/customer_support_screen.dart';
import 'package:himaka/Screens/profile_screen.dart';
import 'package:himaka/utils/simple_account_menu.dart';



class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  @override
  Widget build(BuildContext context) {

    return Container(
      height: MediaQuery.of(context).size.height/2 ,
      child: Card(
        elevation: 2,
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.search, color: Colors.grey[800]),
              title: Text("Search" , style: TextStyle(color: Colors.grey[800]),),
              trailing: Icon(Icons.arrow_forward_ios , color: Colors.lightBlue,),
            ),
            InkWell(
              child: ListTile(
                leading: Icon(Icons.person, color: Colors.grey[800]),
                title: Text("My profile", style: TextStyle(color: Colors.grey[800]),),
                trailing: Icon(Icons.arrow_forward_ios , color: Colors.lightBlue,),
              ),
              onTap: (){
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (
                            context) => new ProfileScreen()));
              },
            ),
            InkWell(
              onTap: (){
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (
                            context) => new BookingsScreen()));

              },
              child: ListTile(
                leading: Icon(Icons.favorite, color: Colors.grey[800]),
                title: Text("My bookings" , style: TextStyle(color: Colors.grey[800]),),
                trailing: Icon(Icons.arrow_forward_ios , color: Colors.lightBlue,),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (
                            context) => new CustomerSupportScreen()));
              },
              child: ListTile(
                leading: Icon(Icons.call, color: Colors.grey[800]),
                title: Text("Customer support", style: TextStyle(color: Colors.grey[800]),),
                trailing: Icon(Icons.arrow_forward_ios , color: Colors.lightBlue,),
              ),
            ),
            InkWell(
              child:
              Container(
                  child: SimpleAccountMenu(
                    stringList: [
                      Text('english' , style: TextStyle(color: Colors.white ,)),
                      Text('arabic'),
                    ],
                    iconColor: Colors.white,
                    onChange: (index) {
                      print(index);
                    },
                  )),
//              ListTile(
//                leading:  Icon(Icons.language, color: Colors.grey[800]),
//                title: Text("English" , style: TextStyle(color: Colors.grey[800]),),
//                trailing: Icon(Icons.arrow_forward_ios , color: Colors.lightBlue,),
//              ),
            ),
          ],

        ),
      ),
    );
  }

}
class WalletData {
  String title;
  Icon walletIcon;

  WalletData({this.title, this.walletIcon});

}

