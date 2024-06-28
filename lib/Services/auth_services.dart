import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hackathon_project/Features/snack_bar.dart';
import 'package:hackathon_project/Provider/user_provider.dart';
import 'package:hackathon_project/constants/uri.dart';
import 'package:hackathon_project/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Error Handling/error_handling.dart';
import '../Screens/Home Page/home_page.dart';

class AuthService {
  //sign up
  void signUpUser({
    required BuildContext context,
    required String email,
    required String name,
    required String password,
    required String district,
    required String area,
  }) async {
    try {
      User user = User(
        id: '',
        name: name,
        email: email,
        password: password,
        district : district,
        area : area,
        qualification : '',
        token: '',
      );
      http.Response res = await http.post(
        Uri.parse('$uri/api/user/register'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, 'Account has been created');
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  //sign in 
  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/user/login'),
        body: jsonEncode({
          'email':email,
          'password':password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      
      httpErrorHandle (
        response: res,
        context: context,
        onSuccess: () async {
          SharedPreferences prefs =  await SharedPreferences.getInstance();
          Provider.of<UserProvider>(context , listen: false).setUser(res.body);
          await prefs.setString('x-auth-token',jsonDecode(res.body)['token']);
          showSnackBar(context, 'Login Successfull !');
          Navigator.pushNamedAndRemoveUntil(
            context, 
            HomePage.routeName, 
            (route) => false);
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}