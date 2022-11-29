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

class LearnModel extends ChangeNotifier {
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
  List<Map<String, dynamic>> pagesDocumentList = [];
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

  Future initialize(String textid, int course) async {
    await GetTextId(textid);
    await JagdeCourse(course);
    await getRateFields(textid);
    await IfNextday(textid);
  }

  Future GetTextId(textid) {
    this.textid = textid;
    print(textid + 'textid');
  }

  Future JagdeCourse(course) async {
    if (course == 1) {
      await NewGetPageField();

      print('new');
      currentCourse = 1;
    } else if (course == 2) {
      await ReviewGetPageField();

      currentCourse = 2;
      print('Review');
    } else {
      await RetakeGetPageField();
      currentCourse = 3;
      print('Retake');
    }

    await getRateFields(textid);
    await IfNextday(textid);
  }

  Future GetPage() async {
    if (currentCourse == 1) {
      await NewGetPageField();
    } else if (currentCourse == 2) {
      await ReviewGetPageField();
    } else if (currentCourse == 3) {
      await RetakeGetPageField();
    }
    await getRateFields(textid);
    await IfNextday(textid);
  }

  Future NewGetPageField() async {
    print(textid + 'NewGetPageFieldのtextid');
    List<int> pageList = [];
    final snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc('$uid')
        .collection('text')
        .doc(textid)
        .get();

    final pages = (snapshot.data()['pages'] as List)
        .map((e) => e as Map<String, dynamic>)
        .toList();

    final getPageField = pages
        .where((element) => element['isFirstTime'])
        .where((element) => element['state'] == '')
        .toList();

    getPageField.sort((a, b) => (a['isPage'] as int).compareTo(b['isPage']));

    pagesDocumentList = getPageField;
    if (pagesDocumentList.length == 0) {
      tasks = false;
      print(tasks);
    } else {
      for (var map in pagesDocumentList) {
        print(map['isPage'].toString());
        pageList.add(map['isPage']);
        tasks = true;
        print(tasks);
        var maxPage = pageList[0];

        print('$maxPage');
        i = maxPage;
      }
    }

    notifyListeners();
  } // course = 1

  Future ReviewGetPageField() async {
    var today = Timestamp.fromDate(DateTime.now());
    List<int> pageList = [];
    final snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc('$uid')
        .collection('text')
        .doc(textid)
        .get();

    final pages = (snapshot.data()['pages'] as List)
        .map((e) => e as Map<String, dynamic>)
        .toList();

    final getPageField = pages
        .where((element) => element['isFirstTime'] == false)
        .where((element) => element['state'] == '')
        .where((element) => element['isRetake'] == 0)
        .where((element) =>
            (element['nextDay'] as Timestamp).compareTo(today) <= 0)
        .toList();

    getPageField
        .sort((a, b) => (a['nextDay'] as Timestamp).compareTo(b['nextDay']));

    pagesDocumentList = getPageField;
    if (pagesDocumentList.length == 0) {
      tasks = false;
      print(tasks);
    } else {
      for (var map in pagesDocumentList) {
        print(map['isPage'].toString());
        pageList.add(map['isPage']);
        tasks = true;
        print(tasks);
        var maxPage = pageList[0];
        print('$maxPage');
        i = maxPage;
      }
    }

    notifyListeners();
  } // course = 2

  Future RetakeGetPageField() async {
    List<int> pageList = [];
    final snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc('$uid')
        .collection('text')
        .doc(textid)
        .get();

    final pages = (snapshot.data()['pages'] as List)
        .map((e) => e as Map<String, dynamic>)
        .toList();

    final getPageField = pages
        .where((element) => element['isFirstTime'] == false)
        .where((element) => element['state'] == '')
        .where((element) => element['isRetake'] != 0)
        .toList();
    getPageField
        .sort((a, b) => (a['isRetake'] as int).compareTo(b['isRetake']));
    getPageField.sort((a, b) => (a['days'] as double).compareTo(b['days']));

    pagesDocumentList = getPageField;
    if (pagesDocumentList.length == 0) {
      tasks = false;
      print(tasks);
    } else {
      for (var map in pagesDocumentList) {
        print(map['isPage'].toString());
        pageList.add(map['isPage']);
        tasks = true;
        print(tasks);
        var maxPage = pageList[0];
        print('$maxPage');
        i = maxPage;
      }
    }

    notifyListeners();
  } //course = 3

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
    pages[i - 1]['item1'] = item1;
    pages[i - 1]['item2'] = item2;
    pages[i - 1]['item3'] = item3;
    pages[i - 1]['item4'] = item4;
    pages[i - 1]['state'] = state;

    await FirebaseFirestore.instance
        .collection('users')
        .doc('$uid')
        .collection('text')
        .doc(textid)
        .update({'pages': pages});

    notifyListeners();
  }

  Future getRateFields(textid) async {
    final snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc('$uid')
        .collection('text')
        .doc(textid)
        .get();

    final pages = (snapshot.data()['pages'] as List)
        .map((e) => e as Map<String, dynamic>)
        .toList();

    final getpageitem = pages[i - 1];
    item1 = getpageitem['item1'];
    item2 = getpageitem['item2'];
    item3 = getpageitem['item3'];
    item4 = getpageitem['item4'];
    rank = getpageitem['rank'];
    retake = getpageitem['isRetake'];
    page = i;
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

    final getdayfield = pages[i - 1];

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

    if (currentCourse <= 2) {
      if (isStudyTimes == null) {
        isStudyTimes = 0;
      }
      isStudyTimes = isStudyTimes + 1;
    }

    pages[i - 1]['days'] = days;
    pages[i - 1]['nextDay'] = Timestamp.fromDate(nextday);
    pages[i - 1]['lastStudy'] = laststudy;
    pages[i - 1]['isFirstTime'] = false;
    pages[i - 1]['isStudyTimes'] = isStudyTimes;

    pages[i - 1]['item1'] = item1;
    pages[i - 1]['item2'] = item2;
    pages[i - 1]['item3'] = item3;
    pages[i - 1]['item4'] = item4;
    pages[i - 1]['state'] = state;
    pages[i - 1]['isRetake'] = retake;
    pages[i - 1]['rank'] = rank;

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

    pages[i - 1]['state'] = 'Reseve';

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

    pages.removeAt(i - 1);

    await FirebaseFirestore.instance
        .collection('users')
        .doc('$uid')
        .collection('text')
        .doc(textid)
        .update({'pages': pages});
    notifyListeners();
  }

  Future IfNextday(textid) async {
    final newNextdayList = <String>[];
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
        newNextdayList.add(NextDayString);
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

        final getIfNextDayField = pages[i - 1];
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
        newNextdayList.add(NextDayString);
      }
    }
    nextdayList = newNextdayList;
    notifyListeners();
  }
}
