import 'package:flutter/material.dart';
import 'package:hackathon_project/App%20Styles/ColorStyle/colors.dart';
import 'package:hackathon_project/App%20Styles/Text%20Style/text_style.dart';
import 'package:hackathon_project/Screens/Auth/Sign%20In/sign_in.dart';
import 'package:hackathon_project/constants/texts.dart';
import 'package:hackathon_project/utils/elevated_button.dart';
import 'package:hackathon_project/utils/outlined_button.dart';

import '../../constants/images.dart';
import '../Auth/Sign Up/sign_up.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final TAppColor tAppColor = TAppColor();
  @override
  Widget build(BuildContext context) {
  var device = MediaQuery.of(context);
  Size screenSize =device.size;
    return Scaffold(
      backgroundColor: tAppColor.scaffoldColor,
      body:Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(image: const AssetImage(TAppImages.logo),
              height: screenSize.height*0.5
            ),
            Column(
              children: [
                Text(TConstantTexts.appMoto,style: TTextStyle.elevatedButtonText,
                textAlign: TextAlign.center,),
              ],
            ),
            const SizedBox(height:20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: [
                  Expanded(child: AppElevatedButton(
                    text: "Sign In", 
                    onTap: (){
                      Navigator.pushNamed(context, SignInScreen.routeName);
                    })
                  ),
                  const SizedBox(width: 20,),
                  Expanded(
                    child: AppOutlinedButton(
                      text: "Sign Up",
                      onTap: (){
                        Navigator.pushNamed(context, SignUpScreen.routeName);
                      }
                    )
                  )
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}