import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:manabiplus/home_screen.dart';
import 'package:manabiplus/sinup/user_info_page.dart';
import 'package:manabiplus/text_entry_moel..dart';
import 'package:flutter/material.dart';
import '../main.dart';

/* --- 省略 --- */

class TextEntryPage extends StatefulWidget {
  @override
  _TextEntryPageState createState() => _TextEntryPageState();
}

class _TextEntryPageState extends State<TextEntryPage> {
  // メッセージ表示用

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
  DateTime nextday;
  String state = '';
  int page = 1;
  int retake = 0;
  DateTime laststudy;
  DateTime NextstudySchedule;
  String uid = FirebaseAuth.instance.currentUser.uid;
  List<DocumentSnapshot> textsDocumentList = [];
  List<dynamic> textIdList = [];
  String textid = '';

  int studyTimes;
  var _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  Future<void> uploadFile() async {
    final FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child('UL'); //保存するフォルダ
    UploadTask task =
        ref.child(DateTime.now().toString()).putFile(_image); //画像の名前

    try {
      var snapshot = await task;
    } catch (FirebaseException) {
      //エラー処理
    }
  }

  Future<void> addFilePath(
      String userId, String localPath, String remotePath) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    await users.doc('$uid').set({
      'localPath': localPath,
      'remotePath': remotePath,
    }, SetOptions(merge: true));
  }

  Future<String> _getImgs(String imgPathLocal, String imgPathRemote) async {
    bool existLocal = await File(imgPathLocal).exists();
    String imgPathUse = "";

    if (existLocal) {
      //ローカルに存在する場合はローカルの画像を使う
      imgPathUse = imgPathLocal;
    } else {
      if ((imgPathRemote != "") && (imgPathRemote != null)) {
        try {
          //ローカルに存在しない場合はリモートのデータをダウンロード
          imgPathUse = await FirebaseStorage.instance
              .ref()
              .child("images")
              .child(imgPathRemote)
              .getDownloadURL();
        } catch (FirebaseException) {
          imgPathUse = "";
        }
      } else {
        imgPathUse = "";
      }
    }
    return imgPathUse;
  }

  @override
  Widget build(BuildContext context) {
    final double devicewidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;
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
              TextField(
                decoration: InputDecoration(
                  hintText: '教材名を入力　例：英語基礎問題集',
                ),
                onChanged: (text) {
                  // TODO: ここで取得したtextを使う
                  textname = text;
                },
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'ページ数を数字で入力　例：315',
                ),
                onChanged: (text) {
                  // TODO:引数がわからない。 parseの使い方を調べる。
                  pages = int.parse(text);
                },
              ), //pages

              TextFormField(
                initialValue: "評価の基準を入力：間違えた数",
                onChanged: (value) {
                  // TODO: ここで取得したtextを使う
                  uselection = value;
                },
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'againの基準を入力：２問間違えた',
                ),
                onChanged: (value) {
                  // TODO: ここで取得したtextを使う
                  again = value;
                },
              ), //again
              TextField(
                decoration: InputDecoration(
                  hintText: 'normalの基準を入力：１問間違えた',
                ),
                onChanged: (value) {
                  // TODO: ここで取得したtextを使う
                  normal = value;
                },
              ), //normal
              TextField(
                decoration: InputDecoration(
                  hintText: 'goodの基準を入力：全問正解（自信なし）',
                ),
                onChanged: (value) {
                  // TODO: ここで取得したtextを使う
                  good = value;
                },
              ), //good
              TextField(
                decoration: InputDecoration(
                  hintText: 'greatの基準を入力：全問正解(自信あり)',
                ),
                onChanged: (value) {
                  // TODO: ここで取得したtextを使う
                  great = value;
                },
              ),

              IconButton(
                onPressed: getImage,
                // 表示アイコン
                icon: Icon(Icons.camera_alt_rounded),
                // アイコン色
                color: Color(0xff00FFD4).withOpacity(0.9),
                // サイズ
                iconSize: devicewidth * 0.15,
              ),

              Container(
                child: _image == null
                    ? Text('No image selected.')
                    : Image.file(_image),
              ),
              ElevatedButton(
                child: Text('新規教材を登録する'),
                onPressed: () async {
                  String uid = FirebaseAuth.instance.currentUser.uid;
                  uploadFile();

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

                  setState(() {
                    maxpage = '${getmaxpage['ページ数']}';
                  });
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
                  Navigator.of(context).pop(true);
                  // MaterialPageRoute(
                  //   builder: (context) => text_entry_model(), /
                  //   fullscreenDialog: true,
                  // ),
                },
              ),

              //great
            ],
          ),
        ),
        width: double.infinity,
      ),
    );
  }

  Future<int> GetText() async {
    return GetText();
  }

  Future makeMaxpage() async {
    return makeMaxpage;
  }
}
