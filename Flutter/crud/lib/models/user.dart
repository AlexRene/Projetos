import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class User {
  String id;
  final String name;
  final int age;
  final DateTime birthday;

  User(
      {this.id = '',
      required this.name,
      required this.age,
      required this.birthday});

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'age': age,
        'birthday': birthday,
      };

  static User fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        name: json['name'],
        age: json['age'],
        birthday: (json['birthday'] as Timestamp).toDate(),
      );
}

Widget buildUser(User user) => ListTile(
      leading: CircleAvatar(
        child: Text('${user.age}'),
      ),
      title: Text(user.name),
      subtitle: Text(user.birthday.toIso8601String()),
    );
