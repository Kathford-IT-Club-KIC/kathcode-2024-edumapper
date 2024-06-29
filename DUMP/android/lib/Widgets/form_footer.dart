import 'package:flutter/material.dart';
import '../constants/images.dart';

import '../constants/height.dart';

class FormFooter extends StatelessWidget {
  final String text;
  final String option;
  final String yesaccount;
  final VoidCallback onPressed;

  const FormFooter(BuildContext context, {
    super.key,
    required this.text,
    required this.onPressed, 
    required this.yesaccount,
    required this.option
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text("OR",style: TextStyle(fontWeight: FontWeight.w700)),
        const SizedBox(height: TAppHeight.formheight),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            icon: const Image(image: AssetImage(TAppImages.google),width: 30),
            onPressed: (){}, 
            label : Text(text,style: const  TextStyle(fontWeight: FontWeight.w600),)
          ),
        ),
        const SizedBox(height: TAppHeight.formheight),
        TextButton(
          onPressed: onPressed,
          child: Text.rich(
            TextSpan(
              text: yesaccount,
              style: Theme.of(context).textTheme.titleSmall,
              children:  [
                TextSpan(
                  text: option,
                  style: const TextStyle(color: Colors.blue)
                )
              ]
            )
          )
        )
      ],
    );
  }
}