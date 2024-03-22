import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:intl/intl.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import '../learn/course_select_page_model.dart';

class resultToLearnPageModel extends ChangeNotifier {
  int listIndexNumber = 0;
  int currentCourse = 0;
  int isStudyTimes = 0;
  String item1 = '';
  String item2 = '';
  String item3 = '';
  String item4 = '';
  String rank = '';
  double days = 1.0;
  int addday = 0;
  DateTime? nextday;
  DateTime? laststudy;
  DateTime? NextstudySchedule;
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
  List<String> ifnextdayList = ['', '', '', ''];
  List<Map<String, dynamic>> pagesDocumentList = [];
  List<DocumentSnapshot> textsDocumentList = [];
  List<List<charts.Series<dynamic, String>>> seriesList = [];
  List<String> textNameList = [];

  List<int> newPageList = [];
  List<int> reviewPageList = [];
  List<int> retakePageList = [];

  List? resultTextIdList;
  List? resultTitleList;
  List? resultRankList;
  int? resultMaxpages;
  List? AllLevelPagesDocumentList;
  double? LearnedPagesRate;
  double? ResevedPagesRate;

  int x = 0;

  Future initialize(String textid, int page) async {
    await GetTextPage(textid, page);
    await getRateFields(textid, page);
    await IfNextday(textid, page);
  }

  Future GetTextPage(textid, page) async {
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
    List<int> pageList = [];
    final snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc('$uid')
        .collection('text')
        .doc(textid)
        .get();

    final pages = (snapshot.data()?['pages'] as List ?? [])
        .map((e) => e as Map<String, dynamic>)
        .toList();
    final getPageField = pages.toList();

    getPageField.sort((a, b) => (a['isPage'] as int).compareTo(b['isPage']));

    pagesDocumentList = getPageField;
    if (pagesDocumentList.length == 0) {
      tasks = false;
      print(tasks);
    } else {
      for (var map in pagesDocumentList) {
        pageList.add(map['isPage']);
      }
      listIndexNumber = pageList.indexOf(page);
    }

    pages[listIndexNumber]['item1'] = item1;
    pages[listIndexNumber]['item2'] = item2;
    pages[listIndexNumber]['item3'] = item3;
    pages[listIndexNumber]['item4'] = item4;
    pages[listIndexNumber]['state'] = state;

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

    final pages = (snapshot.data()?['pages'] as List ?? [])
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
    List<int> pageList = [];
    final snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc('$uid')
        .collection('text')
        .doc('$textid')
        .get();

    final pages = (snapshot.data()?['pages'] as List ?? [])
        .map((e) => e as Map<String, dynamic>)
        .toList();

    final getPageField = pages.toList();

    getPageField.sort((a, b) => (a['isPage'] as int).compareTo(b['isPage']));

    pagesDocumentList = getPageField;
    if (pagesDocumentList.length == 0) {
      tasks = false;
      print(tasks);
    } else {
      for (var map in pagesDocumentList) {
        pageList.add(map['isPage']);
      }
      listIndexNumber = pageList.indexOf(page);
    }

    final getdayfield = pages[listIndexNumber];

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

    pages[listIndexNumber]['days'] = days;
    pages[listIndexNumber]['nextDay'] = Timestamp.fromDate(nextday!);
    pages[listIndexNumber]['lastStudy'] = laststudy;
    pages[listIndexNumber]['isFirstTime'] = false;
    pages[listIndexNumber]['isStudyTimes'] = isStudyTimes;

    pages[listIndexNumber]['item1'] = item1;
    pages[listIndexNumber]['item2'] = item2;
    pages[listIndexNumber]['item3'] = item3;
    pages[listIndexNumber]['item4'] = item4;
    pages[listIndexNumber]['state'] = state;
    pages[listIndexNumber]['isRetake'] = retake;
    pages[listIndexNumber]['rank'] = rank;

    await FirebaseFirestore.instance
        .collection('users')
        .doc('$uid')
        .collection('text')
        .doc(textid)
        .update({'pages': pages});
    notifyListeners();
  }

  Future StateUpdate() async {
    List<int> pageList = [];
    final snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc('$uid')
        .collection('text')
        .doc('$textid')
        .get();

    final pages = (snapshot.data()?['pages'] as List ?? [])
        .map((e) => e as Map<String, dynamic>)
        .toList();
    final getPageField = pages.toList();
    getPageField.sort((a, b) => (a['isPage'] as int).compareTo(b['isPage']));

    pagesDocumentList = getPageField;
    if (pagesDocumentList.length == 0) {
      tasks = false;
      print(tasks);
    } else {
      for (var map in pagesDocumentList) {
        pageList.add(map['isPage']);
      }
      listIndexNumber = pageList.indexOf(page);
    }

    pages[listIndexNumber]['state'] =
        (pages[listIndexNumber]['state'] == 'Reseve') ? '' : 'Reseve';

    await FirebaseFirestore.instance
        .collection('users')
        .doc('$uid')
        .collection('text')
        .doc(textid)
        .update({'pages': pages});
    notifyListeners();
  }

  Future DeleteData() async {
    List<int> pageList = [];
    final snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc('$uid')
        .collection('text')
        .doc('$textid')
        .get();

    final pages = (snapshot.data()?['pages'] as List ?? [])
        .map((e) => e as Map<String, dynamic>)
        .toList();

    final getPageField = pages.toList();
    getPageField.sort((a, b) => (a['isPage'] as int).compareTo(b['isPage']));

    pagesDocumentList = getPageField;
    if (pagesDocumentList.length == 0) {
      tasks = false;
      print(tasks);
    } else {
      for (var map in pagesDocumentList) {
        pageList.add(map['isPage']);
      }
      listIndexNumber = pageList.indexOf(page);
    }

    pages.removeAt(listIndexNumber);

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
    final nextNewDayList = <String>[];
    List<double> rankNumberList = [0.8, 1.2, 2.8, 4.5];
    //todo retake>0でnextdayListに直接代入　2021/11/26

    if (retake != 0) {
      List<double> reviewIfNextDayList = [0, 0, 1, 4];
      for (var reviewIfNextDay in reviewIfNextDayList) {
        DateTime now = DateTime.now();
        addday = reviewIfNextDay.toInt();
        nextday = now.add(Duration(days: addday));
        DateFormat NextdayFormat = DateFormat('MM月dd日');
        String NextDayString = NextdayFormat.format(nextday!);
        ifnextdayList.add(NextDayString);
      }
    } else if (retake == 0) {
      for (var rankNumber in rankNumberList) {
        final snapshot = await FirebaseFirestore.instance
            .collection('users')
            .doc('$uid')
            .collection('text')
            .doc('$textid')
            .get();

        final pages = (snapshot.data()?['pages'] as List ?? [])
            .map((e) => e as Map<String, dynamic>)
            .toList();

        final getIfNextDayField = pages[page - 1];

        days = getIfNextDayField['days'];
        days = days *
            (rankNumber +
                ((0.1) -
                    (5.0 - rankNumber) * (0.08 + (5 - rankNumber) * 0.02)));

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
        String NextDayString = NextdayFormat.format(nextday!);
        nextNewDayList.add(NextDayString);
      }
    }
    ifnextdayList = nextNewDayList;
    notifyListeners();
  }
}
