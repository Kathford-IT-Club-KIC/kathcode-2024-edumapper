import 'package:flutter/material.dart';

class User {
  final String id;
  final String name;
  final String email;
  final String password;
  final String district;
  final String area;
  final String qualification;
  final String token;
  final String photo; // File path to the photo asset

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.district,
    required this.area,
    required this.qualification,
    required this.token,
    required this.photo,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'district': district,
      'area': area,
      'qualification': qualification,
      'token': token,
      'photo': photo,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      district: json['district'] ?? '',
      area: json['area'] ?? '',
      qualification: json['qualification'] ?? '',
      token: json['token'] ?? '',
      photo: json['photo'] ?? '', 
    );
  }

  Image getPhotoImage() {
    return Image.asset("assets/images/profile.jpeg");
  }
}
