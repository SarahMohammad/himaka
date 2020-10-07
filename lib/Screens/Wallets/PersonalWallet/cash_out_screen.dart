import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:himaka/utils/app_bar.dart';

class CashOutScreen extends StatefulWidget {
  @override
  _CashOutScreenState createState() => _CashOutScreenState();
}

class _CashOutScreenState extends State<CashOutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: setAppBar('Personal Wallet'),
      body: ListView(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.lightBlueAccent,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Icon(Icons.mail_outline, color: Colors.white),
                    Text('Cash Out', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),
            Card(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                  Text('Wallet Balance'),
                  Text('876\$', style: TextStyle(color: Colors.lightBlueAccent))
              ],
            ),
                )),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal : 20.0 , vertical: 8),
              child: Text('Cash out immediately'),
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              autofocus: false,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Icon(Icons.email),
                ),
                hintText: 'Enter amount to load',
                hintStyle: TextStyle(color: Colors.black , textBaseline: TextBaseline.alphabetic),
                contentPadding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),

              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal : 20.0 , vertical: 8),
              child: Text('Method of Cash out'),
            ),
            Center(
              child: RaisedButton(
                child: Text('Complete your transtion' , style: TextStyle(color: Colors.white),),
                onPressed: () {},
                color: Colors.lightBlueAccent,

                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),

          ],
        ),
        SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal :15.0),
          child: Row(
            children: [
              Icon(Icons.schedule),
              SizedBox(width: 14,),
              Text('Recent transactions'),
            ],
          ),
        ),

        ListView.separated(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          separatorBuilder: (context, index) => Divider(color: Colors.grey[900],),
          itemCount: 9,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.all(1.0),
            child: InkWell(
              onTap: () {},
              child: ListTile(
                leading: Icon(
                  Icons.check,
                  size: 26,
                ),
                title: Text(
                  'Orange cash',
                ),
                subtitle: Text(
                  '0123456789',
                ),
                trailing: Column(
                  children: [Text('56 \$' , style: TextStyle(color: Colors.lightBlueAccent),
                  ), Text('567/98')],
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
