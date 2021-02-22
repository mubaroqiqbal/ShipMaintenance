import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ship_maintenance/view/activity/home_activity.dart';
import 'package:ship_maintenance/view/activity/login_activity.dart';

const bool isProduction = false;//bool.fromEnvironment('dart.vm.product');

main(){

  if (isProduction) {
    debugPrint = (String message, {int wrapWidth}) {};
  }

  runApp(
    MaterialApp(
      title: 'Ship Maintenance',
      localizationsDelegates: [
        // ... app-specific localization delegate[s] here
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('id', 'ID'), // Englsh, no country code
      ],
      debugShowCheckedModeBanner: isProduction? false : true,
      routes: <String, WidgetBuilder> {
        '/login' : (BuildContext context) => new LoginActivity(),
        '/home' : (BuildContext context) => new HomeActivity(),
      },
      theme: ThemeData(
          fontFamily: 'Lato',
          appBarTheme: AppBarTheme(
              brightness: Brightness.light
          )
      ),
      home: LoginActivity(),
    ),
  );
}

