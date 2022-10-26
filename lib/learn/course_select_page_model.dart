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
    final snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc('$uid')
        .collection('text')
        .doc('$textid')
        .get();

    final pages = (snapshot.data()['pages'] as List)
        .map((e) => e as Map<String, dynamic>)
        .toList();

    final newGetPages = pages
        .where((element) => element['isFirstTime'])
        .where((element) => element['state'] == '')
        .toList();
    newGetPages.sort((a, b) => (a['isPage'] as int).compareTo(b['isPage']));

    for (var map in newGetPages) {
      newPageList.add(map['isPage']);
    }

    var today = Timestamp.fromDate(DateTime.now());
    final reviewGetPages = pages
        .where((element) => element['isFirstTime'] == false)
        .where((element) => element['state'] == '')
        .where((element) => element['isisRetake'] == 0)
        .where((element) =>
            (element['nextDay'] as Timestamp).compareTo(today) <= 0)
        .toList();
    reviewGetPages
        .sort((a, b) => (a['nextDay'] as Timestamp).compareTo(b['nextDay']));

    for (var map in reviewGetPages) {
      print(map['isPage'].toString());
      reviewPageList.add(map['isPage']);
    }

    final retakeGetPages = pages
        .where((element) => element['isFirstTime'] == false)
        .where((element) => element['state'] == '')
        .where((element) => element['isRetake'] != 0)
        .toList();

    retakeGetPages
        .sort((a, b) => (a['isRetake'] as int).compareTo(b['isRetake']));
    retakeGetPages.sort((a, b) => (a['days'] as double).compareTo(b['days']));

    for (var map in retakeGetPages) {
      print(map['isPage'].toString());
      retakePageList.add(map['isPage']);
    }
  }

  notifyListeners();
}
