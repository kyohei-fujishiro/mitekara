import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

String uid = FirebaseAuth.instance.currentUser.uid;

class CourseSelectModel extends ChangeNotifier {
  String state = '';
  String textid = '';
  double rankNumber = 0;
  int page = 1;
  String title = '';
  List<dynamic> titleList = [];
  List<String> nextdayList = ['', '', '', ''];
  List<DocumentSnapshot> pagesDocumentList = [];
  List<DocumentSnapshot> textsDocumentList = [];
  List<dynamic> textIdList = [];
  List<int> newPageList = [];
  List<int> reviewPageList = [];
  List<int> retakePageList = [];

  Future initialize(String textid) async {
    await getTextFields(textid);
    await GetPageNumber(textid);
    notifyListeners();
  }

  Future getTextFields(textid) async {
    final gettextfield = await FirebaseFirestore.instance
        .collection('users')
        .doc('$uid')
        .collection('text')
        .doc('$textid')
        .get();

    // 取得したドキュメント一覧をUIに反映
    title = '${gettextfield['name']}';
    notifyListeners();
    return title;
  }

  Future GetPageNumber(textid) async {
    newPageList = [];
    reviewPageList = [];
    retakePageList = [];
    final newGetPage = await FirebaseFirestore.instance
        .collection('users')
        .doc('$uid')
        .collection('text')
        .doc('$textid')
        .collection('pages')
        .where('isFirstTime', isEqualTo: true)
        .where('state', isEqualTo: '')
        .orderBy('isPage')
        .get();
    pagesDocumentList = newGetPage.docs;
    for (var document in pagesDocumentList) {
      var map = new Map<String, dynamic>.from(document.data());
      print(map['isPage'].toString());
      newPageList.add(map['isPage']);
    }

    var today = Timestamp.fromDate(DateTime.now());
    final revieGetPage = await FirebaseFirestore.instance
        .collection('users')
        .doc('$uid')
        .collection('text')
        .doc('$textid')
        .collection('pages')
        .where('isFirstTime', isEqualTo: false)
        .where('state', isEqualTo: "")
        .where('isRetake', isEqualTo: 0)
        .where('nextDay', isLessThanOrEqualTo: today)
        .orderBy('nextDay') //todo
        .get();

    pagesDocumentList = revieGetPage.docs;

    for (var document in pagesDocumentList) {
      var map = new Map<String, dynamic>.from(document.data());
      print(map['isPage'].toString());
      reviewPageList.add(map['isPage']);
    }

    final retakeGetPage = await FirebaseFirestore.instance
        .collection('users')
        .doc('$uid')
        .collection('text')
        .doc('$textid')
        .collection('pages')
        .where('isFirstTime', isEqualTo: false)
        .where('state', isEqualTo: "")
        .where('isRetake', isNotEqualTo: 0)
        .orderBy('isRetake')
        .orderBy('days')
        .get();
    pagesDocumentList = retakeGetPage.docs;
    for (var document in pagesDocumentList) {
      var map = new Map<String, dynamic>.from(document.data());
      print(map['isPage'].toString());
      retakePageList.add(map['isPage']);
    }
  }

  notifyListeners();
}
