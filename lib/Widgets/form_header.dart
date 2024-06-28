import 'package:flutter/material.dart';

import '../App Styles/Text Style/text_style.dart';
import '../constants/height.dart';
import '../constants/images.dart';

class AppFormHeader extends StatelessWidget {
  final String text;
  const AppFormHeader({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(TAppImages.logo, 
            width:250,
            height: 150,
          ),
          const SizedBox(
            height:TAppHeight.sizedboxHeight
          ),
          Text(text , 
            style: TTextStyle.motoText ,textAlign: TextAlign.center
          ),
          const SizedBox(
            height:TAppHeight.sizedboxHeight
          ),
        ],
      ),
    );
  }
}
