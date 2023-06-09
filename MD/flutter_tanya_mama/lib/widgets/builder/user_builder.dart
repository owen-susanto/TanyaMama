import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserBuilder extends StatefulWidget {
  final Function(User?) builder;
  final Widget widget;
  UserBuilder({required this.builder, required this.widget});

  @override
  _UserBuilderState createState() => _UserBuilderState();
}

class _UserBuilderState extends State<UserBuilder> {
  @override
  Widget build(BuildContext context) {
    var user = FirebaseAuth.instance.currentUser;
    return widget.builder(user);
  }
}
