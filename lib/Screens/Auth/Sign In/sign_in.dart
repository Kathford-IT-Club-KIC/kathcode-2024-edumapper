
import 'package:flutter/material.dart';
import 'package:hackathon_project/Screens/Home%20Page/home_page.dart';
import 'package:hackathon_project/Widgets/form.dart';
import 'package:hackathon_project/constants/height.dart';
import 'package:hackathon_project/constants/texts.dart';
import '../../../Widgets/form_footer.dart';
import '../../../Widgets/form_header.dart';
import '../../../utils/elevated_button.dart';

class SignInScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen
> {
  final _signUpFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController= TextEditingController();
  final TextEditingController _passwordController= TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20 ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  const AppFormHeader(text: TConstantTexts.appMoto ),
                  Form(
                    key: _signUpFormKey,
                    child: Column(
                      children: [
                        AppForm(controller: _emailController, hintText: 'Email',),
                        const SizedBox(height: TAppHeight.sizedboxHeight),
                        AppForm(controller: _passwordController, hintText: 'Password',),
                        const SizedBox(
                          height: TAppHeight.formheight,
                        ),
                        Align(alignment:Alignment.centerRight,
                          child : TextButton(onPressed: (){}, 
                          child: const Text("Forgot Password?"))
                        ),
                        const SizedBox(height: TAppHeight.sizedboxHeight),
                        AppElevatedButton(text: 'Login', onTap: (){
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            HomePage.routeName,
                            (route) => false,
                          );
                        }),
                        const SizedBox(height: TAppHeight.formheight,),
                        FormFooter(context, text: "Sign In With Google", onPressed: (){}, yesaccount: "Don't Have an Account ? ", option: "Sign Up")
                      ],
                    )
                  )
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
  @override
  void dispose(){
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }
}

