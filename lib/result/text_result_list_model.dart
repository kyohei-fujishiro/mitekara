import 'dart:core';
import 'dart:developer';

import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:manabiplus/learn/lern_page_filed.dart';
import '../learn/course_select_page_model.dart';
import '../main.dart';
import 'package:intl/intl.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class PagesModel {
  DateFormat outputFormat = DateFormat('MM月dd日');
  String item1 = '';
  String item2 = '';
  String item3 = '';
  String item4 = '';
  String rank = '';
  double days = 1;
  int addDay = 0;

  Timestamp nextDay;
  Timestamp lastStudy;
  Timestamp? NextStudySchedule;
  int retake = 0;
  String state = '';
  int i = 0;
  String textid = '';
  String resultTextid = '';
  bool tasks = true;

  double rankNumber = 0;
  int page = 1;
  String rate = '';
  String again = '';
  String normal = '';
  String good = '';
  String great = '';
  String title = '';
  int isPage;
  int isRetake;
  // dynamic pages;
  int studyTimes;

  PagesModel(
    this.isPage,
    this.isRetake,
    this.item1,
    this.item2,
    this.item3,
    this.item4,
    this.lastStudy,
    this.nextDay,
    this.rank,
    this.state,
    this.studyTimes,
  );
}

class textResultListPageModel extends ChangeNotifier {
  List<PagesModel> pages = [];

  Future initialize(String textid) async {
    await getPages(textid);
    notifyListeners();
  }

  Future getPages(textid) async {
    final snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc('$uid')
        .collection('text')
        .doc('$textid')
        .get();

    final pagesMap = (snapshot.data()?['pages'] as List ?? [])
        .map((e) => e as Map<String, dynamic>)
        .toList();

    pagesMap.sort((a, b) => (a['isPage'] as int).compareTo(b['isPage']));

    pages = pagesMap
        .map((doc) => PagesModel(
              doc['isPage'],
              doc['isRetake'],
              doc['item1'],
              doc['item2'],
              doc['item3'],
              doc['item4'],
              doc['lastStudy'], //todo
              doc['nextDay'],
              doc['rank'],
              doc['state'],
              doc['isStudyTimes'],
            ))
        .toList();

    this.pages = pages;
    notifyListeners();
  }

  Future stateUpate(String textid, int UpdatePage) async {
    final snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc('$uid')
        .collection('text')
        .doc('$textid')
        .get();

    final pages = (snapshot.data()?['pages'] as List ?? [])
        .map((e) => e as Map<String, dynamic>)
        .toList();
    print(pages);

    pages[UpdatePage]['state'] =
        (pages[UpdatePage]['state'] == 'Reseve') ? '' : 'Reseve';

    await FirebaseFirestore.instance
        .collection('users')
        .doc('$uid')
        .collection('text')
        .doc(textid)
        .update({'pages': pages});
    notifyListeners();
    getPages(textid);
  }
}
