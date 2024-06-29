
import 'package:flutter/material.dart';
import '../../../Widgets/form.dart';
import '../../../constants/height.dart';
import '../../../constants/texts.dart';
import '../../../Services/auth_services.dart';
import '../../../Widgets/form_footer.dart';
import '../../../Widgets/form_header.dart';
import '../../../utils/elevated_button.dart';

class SignInScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen>{
  final AuthService authService = AuthService();

  final _signInFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController= TextEditingController();
  final TextEditingController _passwordController= TextEditingController();

  void signInUser(){
  authService.signInUser(
    context: context,
    email: _emailController.text,
    password: _passwordController.text, 
  );
  }
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
                    key: _signInFormKey,
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
                          if (_signInFormKey.currentState!.validate()){
                            signInUser();
                          }
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

