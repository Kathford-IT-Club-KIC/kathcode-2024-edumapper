
import 'package:flutter/material.dart';
import 'package:hackathon_project/App%20Styles/ColorStyle/colors.dart';
import '../utils/icon_button.dart';

class TAppbar extends StatelessWidget {
  const TAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.grey[100],
      title:const Text("EduMapper",style: TextStyle(
        letterSpacing: 1.2,
        fontWeight: FontWeight.bold,
        fontSize: 24,
        color: TAppColor.buttonColor
      ),
    ),
    centerTitle: false,
    floating: true,
    actions: [
      TIconButton(iconData: Icons.search, iconSize: 30, onPressed: (){}),
      TIconButton(iconData: Icons.message, iconSize: 30, onPressed: (){}),
    ],
    );
  }
}

