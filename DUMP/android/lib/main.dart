import 'package:flutter/material.dart';
import 'App Styles/ColorStyle/colors.dart';
import 'Provider/user_provider.dart';
import 'Screens/First Screen/first_screen.dart';
import 'router.dart';
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
