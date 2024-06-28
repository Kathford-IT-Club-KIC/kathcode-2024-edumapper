
import 'package:flutter/material.dart';
import 'package:hackathon_project/Screens/Home%20Page/home_page.dart';
import 'package:hackathon_project/Widgets/form.dart';
import 'package:hackathon_project/Widgets/form_footer.dart';
import 'package:hackathon_project/constants/height.dart';
import 'package:hackathon_project/constants/texts.dart';
import '../../../Widgets/form_header.dart';
import '../../../utils/elevated_button.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = '/signup-screen';
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen
> {
  final _signUpFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController= TextEditingController();
  final TextEditingController _passwordController= TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _areaController = TextEditingController();
  final TextEditingController _qualificationController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
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
                          AppForm(controller: _usernameController, hintText: 'User Name',),
                          const SizedBox(height: TAppHeight.formheight),
                          AppForm(controller: _emailController, hintText: 'Email',),
                          const SizedBox(height: TAppHeight.formheight),
                          AppForm(controller: _passwordController, hintText: 'Password',),
                          const SizedBox(height: TAppHeight.formheight),
                          AppForm(controller: _districtController, hintText: 'District',),
                          const SizedBox(height: TAppHeight.formheight),
                          AppForm(controller: _areaController, hintText: 'Area',),
                          const SizedBox(height: TAppHeight.formheight),
                          AppForm(controller: _qualificationController, hintText: 'Qualification',), 
                          const SizedBox(height: TAppHeight.formheight),
                          AppElevatedButton(text: 'Sign Up', onTap: (){
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              HomePage.routeName,
                              (route) => false,
                            );
                          }),
                          const SizedBox(height: TAppHeight.formheight,),
                          FormFooter(context, text: "Sign In With Google", onPressed: (){}, yesaccount: "Already Have an Account ? ", option: "Login")
                        ],
                      )
                    )
                  ],
                ),
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
    _usernameController.dispose();
    _districtController.dispose();
    _areaController.dispose();
    _qualificationController.dispose();
  }
}

