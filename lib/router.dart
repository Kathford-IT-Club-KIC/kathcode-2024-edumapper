
import 'package:flutter/material.dart';
import 'package:hackathon_project/Screens/Home%20Page/home_page.dart';

Route<dynamic>generateRoute(RouteSettings routeSettings){
  switch(routeSettings.name){
    case HomePage.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const HomePage()
      );
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Screen does not exist ! '),
          ),
        )
      );
  }
}
