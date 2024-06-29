
import 'package:flutter/material.dart';
import '../App Styles/ColorStyle/colors.dart';

import '../App Styles/Text Style/text_style.dart';

class AppElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const AppElevatedButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5)
        ),
        minimumSize: const Size(double.infinity, 34),
        backgroundColor: TAppColor.buttonColor,
        foregroundColor: TAppColor.backgroundColor,
      ), 
      child: Text(text , style: TTextStyle.elevatedButtonText ,),
    );
  }
}