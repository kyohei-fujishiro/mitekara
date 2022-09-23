import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:manabiplus/home_screen.dart';
import 'package:manabiplus/main.dart';
// import 'package:firebase/firebase.dart';

Future<void> main() async {
  // Fireabse初期化
  await Firebase.initializeApp();
  runApp(MyApp());
}

class UserIn extends StatefulWidget {
  @override
  _UserInState createState() => _UserInState();
}

class _UserInState extends State<UserIn> {
  String nickname = '';
  var birthday = '';
  String grade = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff00FFD4).withOpacity(0.8),
        title: Center(
          child: const Text(
            "ミテカラ",
            style: TextStyle(
                fontSize: 30,
                color: Color(0xff707070),
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                hintText: 'ニックネーム',
              ),
              onChanged: (text) {
                // TODO: ここで取得したtextを使う
                nickname = text;
              },
            ),
            TextField(
              decoration: InputDecoration(
                hintText: '誕生日 19891020',
              ),
              onChanged: (value) {
                // TODO: ここで取得したtextを使う
                birthday = value;
              },
            ),
            TextField(
              decoration: InputDecoration(
                hintText: '高校生',
              ),
              onChanged: (text) {
                // TODO: ここで取得したtextを使う
                grade = text;
              },
            ),
            ElevatedButton(
              child: Text('新規登録'),
              onPressed: () async {
                String uid = FirebaseAuth.instance.currentUser.uid;
                await FirebaseFirestore.instance
                    // ドキュメント作成
                    .collection('users')
                    .doc('$uid')
                    .set({
                  'name': nickname,
                  'birthday': birthday,
                  'grade': grade,
                });
                await Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) {
                    return HomeScreen();
                  }),
                );
              },
            ),
            // ElevatedButton(
            //   child: Text('教材作成'),
            //   onPressed: () async {
            //     await FirebaseFirestore.instance
            //     // ドキュメント作成
            //         .collection('kyozai')
            //         .doc('00001')
            //         .set({'name': 'ネクステージ', 'ページ数': 5, '単元名': '現在sof形'});
            //   },
            // ),
          ],
        ),
        width: double.infinity,
      ),
    );
  }
}
