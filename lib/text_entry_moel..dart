import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:manabiplus/home_screen.dart';
import 'package:manabiplus/sinup/user_info_page.dart';
import 'package:flutter/material.dart';
import '../main.dart';

// Future<void> main() async {
//   // Fireabse初期化
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }

/* --- 省略 --- */

// ログイン画面用Widget
class text_entry_model extends StatefulWidget {
  @override
  _text_entry_modelState createState() => _text_entry_modelState();
}

class _text_entry_modelState extends State<text_entry_model> {
  String orderDocumentInfo = '';
  String rate = '';
  String again = '';
  String normal = '';
  String good = '';
  String great = '';

  String maxpage = '';
  String item1 = '';
  String item2 = '';
  String item3 = '';
  String item4 = '';
  String rank = '';
  int days = 1;
  int nextday = 1;
  int tag = 0;
  int page = 1;
  bool retake = false;
  DateTime laststudy;
  DateTime NextstudySchedule;
  String uid = FirebaseAuth.instance.currentUser.uid;

  @override
  void initState() {
    super.initState();
    makeMaxpage();
    print('終わったよ');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff00FFD4).withOpacity(0.8),
        title: Center(
          child: const Text(
            "ミテカラ",
            style: TextStyle(
                fontSize: 35,
                color: Color(0xff707070),
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text(rate,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Color(0xff707070))),
              Text(again,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Color(0xff707070))),
              Text(normal,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Color(0xff707070))),
              Text(good,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Color(0xff707070))),
              Text(great,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Color(0xff707070))),
            ],
          ),
        ),
      ),
    );
  }

  Future makeMaxpage() async {
    final getmaxpage = await FirebaseFirestore.instance
        .collection('users')
        .doc('$uid')
        .collection('text')
        .doc('3333')
        .get();

    setState(() {
      maxpage = '${getmaxpage['ページ数']}';
    });
    var maxPageInt = int.parse(maxpage);

    for (int i = 1; i <= maxPageInt; i++) {
      page = i;

      final makepagefiled = FirebaseFirestore.instance
          .collection('users')
          .doc('$uid')
          .collection('text')
          .doc('3333')
          .collection('pages')
          .doc('$page')
          .set({
        'isPage': page,
        'item1': '$item1',
        'item2': '$item2',
        'item3': '$item3',
        'item4': '$item4',
        'rank': rank,
        'days': days,
        'nextDay': nextday,
        'nextStudySchedule': NextstudySchedule,
        'lastStudy': laststudy,
        'isFirstTime': true,
        'tag': tag,
        'isRetake': false,
      });
    }
    return makeMaxpage;
  }
}
