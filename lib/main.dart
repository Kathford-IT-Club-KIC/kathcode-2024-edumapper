import 'package:flutter/material.dart';
import 'package:hackathon_project/App%20Styles/ColorStyle/colors.dart';
import 'package:hackathon_project/Provider/user_provider.dart';
import 'package:hackathon_project/Screens/First%20Screen/first_screen.dart';
import 'package:hackathon_project/router.dart';
import 'package:provider/provider.dart';

import 'Services/auth_services.dart';

void main() {
  runApp(MultiProvider(providers:[
    ChangeNotifierProvider(create: (context)=>UserProvider())
  ], child : const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final AuthService authService = AuthService();
  @override
  void initState(){
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Edu Mapper',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: const ColorScheme.light(
          primary : TAppColor.buttonColor
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black)
        )
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: const FirstScreen(),
    );
  }
}
