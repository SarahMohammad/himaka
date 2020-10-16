import 'package:flutter/material.dart';
import 'package:himaka/Screens/search_screen.dart';
import 'package:himaka/utils/app_localizations.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Future<void> showSearchDialog(context,
    {TextEditingController searchKeyController}) async {
  Alert(
      title: '',
      type: AlertType.none,
      context: context,
      content: Column(
        children: <Widget>[
          TextField(
            controller: searchKeyController,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              labelStyle: TextStyle(color: Colors.black38),
              hintStyle: TextStyle(color: Colors.black38),
              labelText: AppLocalizations.of(context).translate('search'),
              hintText: AppLocalizations.of(context).translate('search_hint'),
              border: OutlineInputBorder(
                gapPadding: 0.0,
                borderRadius: BorderRadius.circular(1.5),
              ),
            ),
          ),
        ],
      ),
      buttons: [
        DialogButton(
          onPressed: () {
            if(searchKeyController.text.isNotEmpty)
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (
                        context) => new SearchScreen(searchKeyController.text)));
            else
              Navigator.pop(context);
          },
          child: Text(
            AppLocalizations.of(context).translate('search'),
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ]).show();
}
