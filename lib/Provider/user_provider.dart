
import 'package:flutter/material.dart';
import 'package:hackathon_project/models/user_model.dart';

class UserProvider extends ChangeNotifier{
  User _user  = User(
    id: '',
    name: '',
    email: '', 
    password: '', 
    district: '',
    area : '',
    qualification : '', 
    token: ''
  );

  User get user => _user;

  void setUser(String user){
    _user = User.fromJson(user);
    notifyListeners();
  }
}