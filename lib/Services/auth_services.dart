import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hackathon_project/Features/snack_bar.dart';
import 'package:hackathon_project/constants/uri.dart';
import 'package:hackathon_project/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Error Handling/error_handling.dart';
import '../Provider/user_provider.dart';
import '../Screens/Profile/profile_screen.dart';

class AuthService {
  //sign up
  void signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
    required String district,
    required String area,
    required String qualification,
    required String photo,
  }) async {
    try {
      User user = User(
        id: '',
        name: name,
        email: email,
        password: password,
        district: district,
        area: area,
        qualification: qualification,
        photo: photo,
        token: '',
      );

      final jsonBody = jsonEncode(user.toJson());

      print('Sending SignUp JSON: $jsonBody'); // Debug the JSON data being sent

      http.Response res = await http.post(
        Uri.parse('$uri/api/signup'),
        body: jsonBody,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      print('SignUp Response: ${res.statusCode} ${res.body}'); // Debug response

      if (res.statusCode != 200) {
        showSnackBar(context, 'Error: ${res.body}');
        return;
      }

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, 'Account has been created');
        },
      );
    } catch (e) {
      print('SignUp Error: $e'); // Debug error
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
      final jsonBody = jsonEncode({
        'email': email,
        'password': password,
      });

      print('Sending SignIn JSON: $jsonBody'); // Debug the JSON data being sent

      http.Response res = await http.post(
        Uri.parse('$uri/api/signin'),
        body: jsonBody,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      print('SignIn Response: ${res.statusCode} ${res.body}'); // Debug response

      if (res.statusCode != 200) {
        showSnackBar(context, 'Error: ${res.body}');
        return;
      }

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          Provider.of<UserProvider>(context, listen: false).setUser(res.body);
          await prefs.setString('x-auth-token', jsonDecode(res.body)['token']);
          showSnackBar(context, 'Login Successful!');
          Navigator.pushNamedAndRemoveUntil(
            context,
            ProfileScreen.routeName,
            (route) => false,
          );
        },
      );
    } catch (e) {
      print('SignIn Error: $e'); // Debug error
      showSnackBar(context, e.toString());
    }
  }
}
