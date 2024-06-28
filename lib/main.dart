import 'package:flutter/material.dart';
import 'package:hackathon_project/App%20Styles/ColorStyle/colors.dart';
import 'package:hackathon_project/Screens/First%20Screen/first_screen.dart';
import 'package:hackathon_project/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
