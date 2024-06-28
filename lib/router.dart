
import 'package:flutter/material.dart';
import 'package:hackathon_project/Screens/Auth/Sign%20In/sign_in.dart';
import 'package:hackathon_project/Screens/Home%20Page/home_page.dart';

import 'Screens/Auth/Sign Up/sign_up.dart';

Route<dynamic>generateRoute(RouteSettings routeSettings){
  switch(routeSettings.name){
    case HomePage.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const HomePage()
      );
    case SignInScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const SignInScreen()
      );
      case SignUpScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const SignUpScreen()
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
