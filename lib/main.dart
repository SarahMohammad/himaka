import 'package:flutter/material.dart';
import 'package:himaka/Screens/start_screen.dart';
import 'package:himaka/services/base_view.dart';
import 'package:himaka/services/locator.dart';
import 'package:himaka/utils/AppLanguage.dart';
import 'package:himaka/utils/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  AppLanguage appLanguage = AppLanguage();
  await appLanguage.fetchLocale();
  runApp(MyApp(
    appLanguage: appLanguage,
  ));
}

class MyApp extends StatefulWidget {
  final AppLanguage appLanguage;

  MyApp({this.appLanguage});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.appLanguage != null)
      locator<AppLanguage>().changeLanguage(widget.appLanguage.appLocal);
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<AppLanguage>(
        builder: (context, model, child) => LayoutBuilder(builder:
                (BuildContext context, BoxConstraints viewportConstraints) {
              return MaterialApp(
                locale: model.appLocal,
                supportedLocales: [
                  Locale('en', 'US'),
                  Locale('ar', ''),
                ],
                localizationsDelegates: [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                ],
                debugShowCheckedModeBanner: false,
                title: 'Flutter Demo',
                theme: ThemeData(
                    primarySwatch: Colors.blue,
                    visualDensity: VisualDensity.adaptivePlatformDensity,
                    inputDecorationTheme: const InputDecorationTheme(
                      labelStyle: TextStyle(color: Colors.white),
                      hintStyle: TextStyle(color: Colors.white),
                    )),
                home: SafeArea(child: StartScreen()),
              );
            }));
  }
}
