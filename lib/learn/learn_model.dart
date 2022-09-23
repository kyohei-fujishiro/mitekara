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
  int currentCourse = 0;
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
    final getpagefield = await FirebaseFirestore.instance
        .collection('users')
        .doc('$uid')
        .collection('text')
        .doc(textid)
        .collection('pages')
        .where('isFirstTime', isEqualTo: true)
        .where('state', isEqualTo: '')
        .orderBy('isPage')
        .get();
    pagesDocumentList = getpagefield.docs;
    if(pagesDocumentList.length == 0){
      tasks = false;
      print(tasks);
    }else{
      for (var document in pagesDocumentList) {
        var map = new Map<String, dynamic>.from(document.data());
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
    final getpagefield = await FirebaseFirestore.instance
        .collection('users')
        .doc('$uid')
        .collection('text')
        .doc(textid)
        .collection('pages')
        .where('isFirstTime', isEqualTo: false)
        .where('state', isEqualTo: "")
        .where('isRetake', isEqualTo: 0)
        .where('nextDay', isLessThanOrEqualTo: today)
        .orderBy('nextDay') //todo
        .get();

    pagesDocumentList = getpagefield.docs;
    if(pagesDocumentList.length == 0){
      tasks = false;
      print(tasks);
    }else{
      for (var document in pagesDocumentList) {
        var map = new Map<String, dynamic>.from(document.data());
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
    final getpagefield = await FirebaseFirestore.instance
        .collection('users')
        .doc('$uid')
        .collection('text')
        .doc(textid)
        .collection('pages')
        .where('isFirstTime', isEqualTo: false)
        .where('state', isEqualTo: "")
        .where('isRetake', isNotEqualTo: 0)
        .orderBy('isRetake')
        .orderBy('days')
        .get();

    pagesDocumentList = getpagefield.docs;
    if(pagesDocumentList.length == 0){
      tasks = false;
      print(tasks);
    }else{
      for (var document in pagesDocumentList) {
        var map = new Map<String, dynamic>.from(document.data());
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
    final inputpagefiled = await FirebaseFirestore.instance
        .collection('users')
        .doc('$uid')
        .collection('text')
        .doc(textid)
        .collection('pages')
        .doc('$i')
        .update({
      'item1': item1,
      'item2': item2,
      'item3': item3,
      'item4': item4,
      'state': state,
    });

    notifyListeners();
  }

  Future getRateFields(textid) async {
    final getpageitem = await FirebaseFirestore.instance
        .collection('users')
        .doc('$uid')
        .collection('text')
        .doc(textid)
        .collection('pages')
        .doc('$i')
        .get();
    item1 = getpageitem['item1'];
    item2 = getpageitem['item2'];
    item3 = getpageitem['item3'];
    item4 = getpageitem['item4'];
    rank = getpageitem['rank'];
    retake = getpageitem['isRetake'];
    page = i;
    print('$rank');

    final getratefield = await FirebaseFirestore.instance
        .collection('users')
        .doc('$uid')
        .collection('text')
        .doc(textid)
        .get();
    // 取得したドキュメント一覧をUIに反映
    title = '${getratefield['name']}';
    rate = '${getratefield['評価基準']}';
    again = '${getratefield['again']}';
    normal = '${getratefield['normal']}';
    good = '${getratefield['good']}';
    great = '${getratefield['great']}';
    print('$title');

    notifyListeners();
  }


  Future Days(double rankNumber, int RetakeNumber) async {
    final getdayfield = await FirebaseFirestore.instance
        .collection('users')
        .doc('$uid')
        .collection('text')
        .doc(textid)
        .collection('pages')
        .doc('$i')
        .get();
    days = getdayfield['days'];
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
    if (retake != 0) {// todo
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

    final updatedaysfiled = await FirebaseFirestore.instance
        .collection('users')
        .doc('$uid')
        .collection('text')
        .doc(textid)
        .collection('pages')
        .doc('$i')
        .update({
      'days': days,
      'nextDay': Timestamp.fromDate(nextday),
      'lastStudy': laststudy,
      'isFirstTime': false,
      'item1': item1,
      'item2': item2,
      'item3': item3,
      'item4': item4,
      'state': state,
      'isRetake': retake,
      'rank': rank,
    });
    notifyListeners();
  }

  Future StateUpdate() async {
    final StateUpDate = await FirebaseFirestore.instance
        .collection('users')
        .doc('$uid')
        .collection('text')
        .doc(textid)
        .collection('pages')
        .doc('$i')
        .update({
      'state': 'Reseve',
    });
    notifyListeners();
  }

  Future DeleteData() async {
    final DeleteData = await FirebaseFirestore.instance
        .collection('users')
        .doc('$uid')
        .collection('text')
        .doc(textid)
        .collection('pages')
        .doc('$i')
        .delete();
    notifyListeners();
  }

  Future IfNextday(textid) async {

    nextdayList = [];
    List<double> rankNumberList = [0.65, 0.9, 2.5, 3.0];
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
        final getIfNextDayField = await FirebaseFirestore.instance
            .collection('users')
            .doc('$uid')
            .collection('text')
            .doc(textid)
            .collection('pages')
            .doc('$i')
            .get();
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

