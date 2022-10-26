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
import '../main.dart';
import 'package:intl/intl.dart';
import 'package:charts_flutter/flutter.dart' as charts;

String uid = FirebaseAuth.instance.currentUser.uid;

class resultToLearnPageModel extends ChangeNotifier {
  int currentCourse = 0;
  int isStudyTimes = 0;
  String item1 = '';
  String item2 = '';
  String item3 = '';
  String item4 = '';
  String rank = '';
  double days = 1.0;
  int addday = 0;
  DateTime nextday;
  DateTime laststudy;
  DateTime NextstudySchedule;
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
  List<String> nextdayList = ['', '', '', ''];
  List<DocumentSnapshot> pagesDocumentList = [];
  List<DocumentSnapshot> textsDocumentList = [];
  List<List<charts.Series<dynamic, String>>> seriesList = [];
  List<String> textNameList = [];

  List<int> newPageList = [];
  List<int> reviewPageList = [];
  List<int> retakePageList = [];

  List resultTextIdList;
  List resultTitleList;
  List resultRankList;
  int resultMaxpages;
  List AllLevelPagesDocumentList;
  double LearnedPagesRate;
  double ResevedPagesRate;

  int x = 0;

  Future initialize(String textid, int page) async {
    await GetTextPage(textid, page);
    await getRateFields(textid, page);
    await IfNextday(textid, page);
  }

  Future GetTextPage(textid, page) {
    this.textid = textid;
    this.page = page;
    print(textid + 'textid');
    print('$page' + 'page');
  }

  Future GetPage() async {
    await getRateFields(textid, page);
    await IfNextday(textid, page);
  }

  Future InputPageField(
      String item1, String item2, String item3, String item4) async {
    final snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc('$uid')
        .collection('text')
        .doc(textid)
        .get();

    final pages = (snapshot.data()['pages'] as List)
        .map((e) => e as Map<String, dynamic>)
        .toList();
    pages[page - 1]['item1'] = item1;
    pages[page - 1]['item2'] = item2;
    pages[page - 1]['item3'] = item3;
    pages[page - 1]['item4'] = item4;
    pages[page - 1]['state'] = state;

    await FirebaseFirestore.instance
        .collection('users')
        .doc('$uid')
        .collection('text')
        .doc(textid)
        .update({'pages': pages});
    notifyListeners();
  }

  Future getRateFields(textid, page) async {
    final snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc('$uid')
        .collection('text')
        .doc(textid)
        .get();

    final pages = (snapshot.data()['pages'] as List)
        .map((e) => e as Map<String, dynamic>)
        .toList();

    final getpageitem = pages[page - 1];
    item1 = getpageitem['item1'];
    item2 = getpageitem['item2'];
    item3 = getpageitem['item3'];
    item4 = getpageitem['item4'];
    rank = getpageitem['rank'];
    retake = getpageitem['isRetake'];
    print('$rank');

    // 取得したドキュメント一覧をUIに反映
    title = '${snapshot['name']}';
    rate = '${snapshot['評価基準']}';
    again = '${snapshot['again']}';
    normal = '${snapshot['normal']}';
    good = '${snapshot['good']}';
    great = '${snapshot['great']}';
    print('$title');

    notifyListeners();
  }

  Future Days(double rankNumber, int RetakeNumber) async {
    final snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc('$uid')
        .collection('text')
        .doc('$textid')
        .get();

    final pages = (snapshot.data()['pages'] as List)
        .map((e) => e as Map<String, dynamic>)
        .toList();

    final getdayfield = pages[page - 1];

    days = getdayfield['days'];
    isStudyTimes = getdayfield['isStudyTimes'];
    days = days *
        (rankNumber +
            ((0.1) - (5 - rankNumber) * (0.08 + (5 - rankNumber) * 0.02)));

    if (days <= 1) {
      days = 1;
      rank = 'Level1';
    } else if (days < 7) {
      rank = 'Level1';
    } else if (days < 30) {
      rank = 'Level2';
    } else if (days < 120) {
      rank = 'Level3';
    } else if (days < 240) {
      rank = 'Level4';
    } else if (240 < days) {
      rank = 'Level5';
      days = 240;
    }

    // print('$rank');
    addday = days.round(); //四捨五入して整数へ
    addday = addday.toInt(); //int型に直す
    DateTime now = DateTime.now();
    laststudy = now;
    nextday = now.add(Duration(days: addday));

    //todo retake>0のときnextdayを直接代入　2021/11/26
    if (retake != 0) {
      // todo
      if (rankNumber == 2.5) {
        nextday = now.add(Duration(days: 1));
      } else if (rankNumber == 3.0) {
        nextday = now.add(Duration(days: 2));
      }
    }

    if (RetakeNumber == 0) {
      retake = retake * RetakeNumber;
    } else {
      retake = retake + RetakeNumber;
    }

    if (isStudyTimes == null) {
      isStudyTimes = 0;
    }
    isStudyTimes = isStudyTimes + 1;

    pages[page - 1]['days'] = days;
    pages[page - 1]['nextDay'] = Timestamp.fromDate(nextday);
    pages[page - 1]['lastStudy'] = laststudy;
    pages[page - 1]['isFirstTime'] = false;
    pages[page - 1]['isStudyTimes'] = isStudyTimes;

    pages[page - 1]['item1'] = item1;
    pages[page - 1]['item2'] = item2;
    pages[page - 1]['item3'] = item3;
    pages[page - 1]['item4'] = item4;
    pages[page - 1]['state'] = state;
    pages[page - 1]['isRetake'] = retake;
    pages[page - 1]['rank'] = rank;

    await FirebaseFirestore.instance
        .collection('users')
        .doc('$uid')
        .collection('text')
        .doc(textid)
        .update({'pages': pages});
    notifyListeners();
  }

  Future StateUpdate() async {
    final snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc('$uid')
        .collection('text')
        .doc('$textid')
        .get();

    final pages = (snapshot.data()['pages'] as List)
        .map((e) => e as Map<String, dynamic>)
        .toList();

    pages[page - 1]['state'] = 'Reseve';

    await FirebaseFirestore.instance
        .collection('users')
        .doc('$uid')
        .collection('text')
        .doc(textid)
        .update({'pages': pages});
    notifyListeners();
  }

  Future DeleteData() async {
    final snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc('$uid')
        .collection('text')
        .doc('$textid')
        .get();

    final pages = (snapshot.data()['pages'] as List)
        .map((e) => e as Map<String, dynamic>)
        .toList();

    pages.removeAt(page - 1);

    await FirebaseFirestore.instance
        .collection('users')
        .doc('$uid')
        .collection('text')
        .doc(textid)
        .update({'pages': pages});
    notifyListeners();
  }

  // ignore: non_constant_identifier_names
  Future IfNextday(textid, page) async {
    nextdayList = ['', '', '', ''];
    List<double> rankNumberList = [0.8, 1.2, 2.7, 3.7];
    //todo retake>0でnextdayListに直接代入　2021/11/26

    if (retake != 0) {
      List<double> reviewIfNextDayList = [0, 0, 1, 4];
      for (var reviewIfNextDay in reviewIfNextDayList) {
        DateTime now = DateTime.now();
        addday = reviewIfNextDay.toInt();
        nextday = now.add(Duration(days: addday));
        DateFormat NextdayFormat = DateFormat('MM月dd日');
        String NextDayString = NextdayFormat.format(nextday);
        nextdayList.add(NextDayString);
      }
    } else if (retake == 0) {
      for (var rankNumber in rankNumberList) {
        final snapshot = await FirebaseFirestore.instance
            .collection('users')
            .doc('$uid')
            .collection('text')
            .doc('$textid')
            .get();

        final pages = (snapshot.data()['pages'] as List)
            .map((e) => e as Map<String, dynamic>)
            .toList();

        final getIfNextDayField = pages[page - 1];

        days = getIfNextDayField['days'];
        days = days *
            (rankNumber +
                ((0.1) - (5 - rankNumber) * (0.08 + (5 - rankNumber) * 0.02)));

        if (days <= 1) {
          days = 1;
        } else if (240 < days) {
          days = 240;
        }

        addday = days.round(); //四捨五入して整数へ
        addday = addday.toInt(); //int型に直す
        DateTime now = DateTime.now();
        nextday = now.add(Duration(days: addday));
        DateFormat NextdayFormat = DateFormat('MM月dd日');
        String NextDayString = NextdayFormat.format(nextday);
        nextdayList.add(NextDayString);
      }
    }

    notifyListeners();
  }
}
