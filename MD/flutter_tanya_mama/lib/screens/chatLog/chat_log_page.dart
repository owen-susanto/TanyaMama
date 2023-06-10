import 'dart:convert';
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter/material.dart';

import 'package:flutter_tanya_mama/basics/widgets/core_stateful_widget.dart';
import 'package:flutter_tanya_mama/models/session/session.dart';
import 'package:flutter_tanya_mama/models/session/session_helper.dart';
import 'package:flutter_tanya_mama/widgets/custom/custom_text.dart';

class ChatLogPage extends CoreStatefulWidget {
  const ChatLogPage({super.key});

  @override
  CoreStatefulWidgetState<ChatLogPage> createState() => _ChatLogPageState();
}

class _ChatLogPageState extends CoreStatefulWidgetState<ChatLogPage> {
  late User user;
  late Session session;
  late SessionHelper _sessionHelper;
  late String mamaEmotion;
  late bool isInitial;

  @override
  void initState() {
    user = FirebaseAuth.instance.currentUser!;
    // _scrollController = ScrollController();
    _sessionHelper = SessionHelper();
    mamaEmotion = "smile";
    isInitial = false;

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var instance = FirebaseAuth.instance;
    user = instance.currentUser!;

    return FutureBuilder(
        future: _sessionHelper.getSessionList(user.uid),
        builder: (context, snapshot) {
          if (snapshot.data != [] && snapshot.hasData) {
            List<Session> session_list = snapshot.data!;
            return ListView.builder(
                itemBuilder: (context, i) {
                  return CustomText((session_list[i].item ?? "") +
                      "-" +
                      (session_list[i].price.toString()) +
                      " " +
                      session_list[i].createDate!.toIso8601String());
                },
                itemCount: session_list.length);
          }
          return Container();
        });
  }

  String randomString() {
    final random = Random.secure();
    final values = List<int>.generate(16, (i) => random.nextInt(255));
    return base64UrlEncode(values);
  }
}

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _rnd = Random();
String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
    length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
