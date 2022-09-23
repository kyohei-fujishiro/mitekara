import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

String uid = FirebaseAuth.instance.currentUser.uid;

class TextSelectPageModel extends ChangeNotifier {
  int currentCourse = 2;
  String item1 = '';
  String item2 = '';
  String item3 = '';
  String item4 = '';
  String rank = '';
  double days = 1;
  int addday = 0;
  DateTime nextday;
  DateTime laststudy;
  DateTime NextstudySchedule;
  int retake = 0;
  String state = '';
  String textid = '';

  double rankNumber = 0;
  int page = 1;
  String rate = '';
  String again = '';
  String normal = '';
  String good = '';
  String great = '';
  String title = '';
  List<dynamic> titleList = [];
  List<String> nextdayList = ['', '', '', ''];
  List<DocumentSnapshot> pagesDocumentList = [];
  List<DocumentSnapshot> textsDocumentList = [];
  List<dynamic> textIdList = [];
  List<int> newPageList = [];
  List<int> reviewPageList = [];
  List<int> retakePageList = [];


  Future<int> GetText() async {
    textIdList = [];
    titleList = [];
    final gettext = await FirebaseFirestore.instance
        .collection('users')
        .doc('$uid')
        .collection('text')
        .get();

    gettext.docs.forEach((doc) async {
      textid = doc.id;
      textIdList.add(doc.id);
    });
    for (dynamic textId in textIdList) {
      final gettextfield = await FirebaseFirestore.instance
          .collection('users')
          .doc('$uid')
          .collection('text')
          .doc('$textId')
          .get();
      // 取得したドキュメント一覧をUIに反映
      title = '${gettextfield['name']}';
      titleList.add(title);
    }
    notifyListeners();
  }

  Future DeleteText(String textid) async {
    print(textid);
    final DeleteText = await FirebaseFirestore.instance
        .collection('users')
        .doc('$uid')
        .collection('text')
        .doc('$textid')
        .delete();
    notifyListeners();
  }



}
