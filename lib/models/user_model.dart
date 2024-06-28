import 'dart:convert';

class User {
  final String id;
  final String name;
  final String email;
  final String password;
  final String district;
  final String area;
  final String qualification;
  final String token;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.district,
    required this.area,
    required this.qualification,
    required this.token,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'email': email});
    result.addAll({'password': password});
    result.addAll({'district': district});
    result.addAll({'area': area});
    result.addAll({'qualification': qualification});
    result.addAll({'token': token});
  
    return result;
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      district: map['district'] ?? '',
      area: map['area'] ?? '',
      qualification: map['qualification'] ?? '',
      token: map['token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
