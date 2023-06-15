import 'dart:convert';
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
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
            session_list.sort((a, b) => b.createDate!.compareTo(a.createDate!));
            return ListView.builder(
                itemBuilder: (context, i) {
                  return Card(
                    color: session_list[i].verdict == true
                        ? Colors.lightGreen[200]
                        : session_list[i].rejectType == 1
                            ? Colors.yellow[200]
                            : session_list[i].rejectType == 0
                                ? Colors.pink[200]
                                : Colors.grey[200],
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 10.0,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  session_list[i].createDate!.year.toString() +
                                      "-" +
                                      session_list[i]
                                          .createDate!
                                          .month
                                          .toString() +
                                      "-" +
                                      session_list[i]
                                          .createDate!
                                          .day
                                          .toString(),
                                  fontSize: 20 * fontRatio,
                                  fontWeight: FontWeight.bold,
                                ),
                                CustomText(
                                  session_list[i].item ?? "Item not found",
                                  fontSize: 14 * fontRatio,
                                ),
                              ],
                            ),
                          ),
                          CustomText(
                            session_list[i].verdict == true
                                ? "Ok Buy"
                                : session_list[i].rejectType == 1
                                    ? "Hold"
                                    : session_list[i].rejectType == 0
                                        ? "Don't"
                                        : "Not Finished",
                            color: session_list[i].verdict == true
                                ? Colors.green[800]!
                                : session_list[i].rejectType == null
                                    ? Colors.black54
                                    : Colors.red[800]!,
                          ),
                        ],
                      ),
                    ),
                  );
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
