import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:manabiplus/home_screen.dart';
import 'package:manabiplus/sinup/user_info_page.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import 'learn/course_select_page_model.dart';

// Future<void> main() async {
//   // Fireabse初期化
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }

/* --- 省略 --- */

// ログイン画面用Widget

class TextEntryModel extends ChangeNotifier {
  String textname = '間違えた数';
  int pages = 0;
  String uselection = '間違えた数';
  String again = '';
  String normal = '';
  String good = '';
  String great = '';

  String orderDocumentInfo = '';
  String rate = '';
  String maxpage = '';
  String item1 = '';
  String item2 = '';
  String item3 = '';
  String item4 = '';
  String rank = '';
  double days = 1.0;
  DateTime? nextday;
  String state = '';
  int page = 1;
  int retake = 0;
  DateTime? laststudy;
  DateTime? NextstudySchedule;
  List<DocumentSnapshot> textsDocumentList = [];
  List<dynamic> textIdList = [];
  String textid = '';

  int? studyTimes;
  var _image;

  Future makeNewText() async {
    final textEntry = await FirebaseFirestore.instance
        // ドキュメント作成
        .collection('users')
        .doc('$uid')
        .collection('text')
        .doc()
        .set({
      'name': '$textname',
      'ページ数': pages,
      '評価基準': '$uselection',
      'again': '$again',
      'normal': '$normal',
      'good': '$good',
      'great': '$great',
      '作成日': Timestamp.now()
    });

    textIdList = [];
    final gettext = await FirebaseFirestore.instance
        .collection('users')
        .doc('$uid')
        .collection('text')
        .orderBy('作成日', descending: false)
        .get();

    gettext.docs.forEach((doc) async {
      textid = doc.id;
      textIdList.add(doc.id);
    });
    textid = textIdList.last;
    print(textid);

    final getmaxpage = await FirebaseFirestore.instance
        .collection('users')
        .doc('$uid')
        .collection('text')
        .doc(textid)
        .get();
    maxpage = '${getmaxpage['ページ数']}';

    var maxPageInt = int.parse(maxpage);

    for (int i = 1; i <= maxPageInt; i++) {
      page = i;
      final makepagefiled = await FirebaseFirestore.instance
          .collection('users')
          .doc('$uid')
          .collection('text')
          .doc(textid)
          .collection('pages')
          .doc('$page')
          .set({
        'isPage': page,
        'item1': '$item1',
        'item2': '$item2',
        'item3': '$item3',
        'item4': '$item4',
        'rank': 'Level1',
        'days': days,
        'nextDay': nextday,
        'nextStudySchedule': NextstudySchedule,
        'lastStudy': laststudy,
        'isFirstTime': true,
        'state': state,
        'isRetake': retake,
        'isStudyTimes': studyTimes,
      });
    }
  }
}
