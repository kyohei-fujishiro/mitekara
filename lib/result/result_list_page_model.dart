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

class resultListPageModel extends ChangeNotifier {
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

  List resultTextIdList = [];
  List resultTitleList = [];
  List resultRankList = [];
  int resultMaxpages;
  List<Map<String, dynamic>> AllLevelPagesDocumentList;
  double LearnedPagesRate;
  double ResevedPagesRate;
  int x = 0;
  int LearnedPagesListLength;
  int ReservedPagesDocumentListLength;

  Future getGraphData() async {
    // firebaseからresultDateを取得
    resultTextIdList.clear();
    // notifyListeners();
    textNameList.clear();
    seriesList.clear();

    AllLevelPagesDocumentList = [];
    List LearnedPagesDocumentList = [];
    List LearnedPagesList = [];
    List ReservedPagesDocumentList = [];
    List ResevedPagesList = [];

    double Level1Rate = 0;
    double Level2Rate = 0;
    double Level3Rate = 0;
    double Level4Rate = 0;
    double Level5Rate = 0;

    final gettext = await FirebaseFirestore.instance
        .collection('users')
        .doc('$uid')
        .collection('text')
        .get();
    gettext.docs.forEach((doc) async {
      resultTextIdList.add(doc.id);
    });

    //

    for (dynamic textId in resultTextIdList) {
      List<int> AllLevelPagesList = [];
      final gettextName = await FirebaseFirestore.instance
          .collection('users')
          .doc('$uid')
          .collection('text')
          .doc('$textId')
          .get();
      String textName = '${gettextName['name']}';
      textNameList.add(textName);

      //全ページ数を取得
      final snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc('$uid')
          .collection('text')
          .doc('$textId')
          .get();

      final pages = (snapshot.data()['pages'] as List)
          .map((e) => e as Map<String, dynamic>)
          .toList();

      AllLevelPagesDocumentList = pages;

      for (var map in AllLevelPagesDocumentList) {
        AllLevelPagesList.add(map['isPage']);
      }
      // AllLevelPageListLength = AllLevelPagesDocumentList.length;
      final LearnedPages =
          pages.where((element) => element['isFirstTime'] == false).toList();

      LearnedPagesDocumentList = LearnedPages;
      if (LearnedPagesDocumentList.length == 0) {
        LearnedPagesListLength = 0;
      } else {
        for (var map in LearnedPagesDocumentList) {
          LearnedPagesList.add(map['isPage']);
        }
        LearnedPagesListLength = LearnedPagesDocumentList.length;
      }
      print('$LearnedPagesListLength' + 'LearnedPagesListLength');

      final ResevedPages =
          pages.where((element) => element['state'] == 'Reseve').toList();

      ReservedPagesDocumentList = ResevedPages;
      if (ReservedPagesDocumentList.length == 0) {
        ReservedPagesDocumentListLength = 0;
      } else {
        for (var map in ReservedPagesDocumentList) {
          ResevedPagesList.add(map['isPage']);
        }
        ReservedPagesDocumentListLength = ReservedPagesDocumentList.length;
      }
      print('$ReservedPagesDocumentListLength' +
          'ReservedPagesDocumentListLength');

      LearnedPagesRate =
          (LearnedPagesListLength / (AllLevelPagesList.length)) * 100;
      ResevedPagesRate =
          (ReservedPagesDocumentListLength / (AllLevelPagesList.length)) * 100;

      Level1Rate = await calcLevel('Level1', textId, AllLevelPagesList.length);
      Level2Rate = await calcLevel('Level2', textId, AllLevelPagesList.length);
      Level3Rate = await calcLevel('Level3', textId, AllLevelPagesList.length);
      Level4Rate = await calcLevel('Level4', textId, AllLevelPagesList.length);
      Level5Rate = await calcLevel('Level5', textId, AllLevelPagesList.length);
      // firebaseから取得した値を、resultDateに格納
      final resultDate = [
        Level('', 100, charts.MaterialPalette.white),
        Level(
            '進捗', LearnedPagesRate, charts.MaterialPalette.green.shadeDefault),
        Level(
            '保留', ResevedPagesRate, charts.MaterialPalette.yellow.shadeDefault),
        Level('Level1', Level1Rate, charts.MaterialPalette.blue.shadeDefault),
        Level('Level2', Level2Rate, charts.MaterialPalette.blue.shadeDefault),
        Level('Level3', Level3Rate, charts.MaterialPalette.blue.shadeDefault),
        Level('Level4', Level4Rate, charts.MaterialPalette.blue.shadeDefault),
        Level('Level5', Level5Rate, charts.MaterialPalette.blue.shadeDefault),
      ];

      List<charts.Series<Level, String>> chart = [
        charts.Series<Level, String>(
          id: 'Sales',
          domainFn: (Level sales, _) => sales.level,
          measureFn: (Level sales, _) => sales.rate,
          data: resultDate,
          colorFn: (Level segment, _) => segment.color,
          // fillColorFn: (Level sales, _) {
          //   return charts.MaterialPalette.cyan.shadeDefault;
          // },
        ),
      ];
      seriesList.add(chart);
      notifyListeners();
    }

    // });
  }
}

Future<double> calcLevel(
    String level, dynamic textId, int AllLevelPageListLength) async {
  List LevelPagesList = [];
  List LevelDocumentPagesList = [];

  final snapshot = await FirebaseFirestore.instance
      .collection('users')
      .doc('$uid')
      .collection('text')
      .doc('$textId')
      .get();

  final pages = (snapshot.data()['pages'] as List)
      .map((e) => e as Map<String, dynamic>)
      .toList();

  final getLevel = pages.where((element) => element['rank'] == level).toList();

  // 取得したドキュメント一覧をUIに反映
  LevelDocumentPagesList = getLevel;

  if (LevelDocumentPagesList.length == 0) {
    return 0;
  } else {
    for (var map in LevelDocumentPagesList) {
      LevelPagesList.add(map['isPage']);
    }
    return ((LevelPagesList.length) / (AllLevelPageListLength)) * 100;
  }
}

class Level {
  final String level;
  final double rate;
  final charts.Color color;

  Level(this.level, this.rate, this.color);
}
