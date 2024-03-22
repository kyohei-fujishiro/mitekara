import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:manabiplus/home_screen.dart';
import 'package:manabiplus/sinup/user_info_page.dart';
import 'package:manabiplus/text_entry_moel..dart';
import 'package:provider/provider.dart';

import '../main.dart';
import 'learn_model.dart';
import 'learn_page.dart';

/* --- 省略 --- */

// ログイン画面用Widget
class LeanPageItem extends StatefulWidget {
  @override
  _LeanPageItemState createState() => _LeanPageItemState();
}

class _LeanPageItemState extends State<LeanPageItem> {
  // メッセージ表示用
  String item1 = '';
  String item2 = '';
  String item3 = '';
  String item4 = '';
  int tag = 0;
  int i = 0;

  @override
  Widget build(BuildContext context) {
    print('itemepage');
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
      body: Consumer<LearnModel>(builder: (context, model, child) {
        // model.getRateFields();
        return Container(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextField(
                  controller: TextEditingController(
                    text: model.item1 ?? '',
                  ),
                  decoration: InputDecoration(
                    hintText: '項目①',
                  ),
                  onChanged: (text) {
                    item1 = text;
                  },
                ),
                TextField(
                  controller: TextEditingController(
                    text: model.item2 ?? '',
                  ),
                  decoration: InputDecoration(
                    hintText: '項目②',
                  ),
                  onChanged: (text) {
                    // TODO: ここで取得したtextを使う
                    item2 = text;
                  },
                ),
                TextField(
                  controller: TextEditingController(
                    text: model.item3 ?? '',
                  ),
                  decoration: InputDecoration(
                    hintText: '項目3',
                  ),
                  onChanged: (text) {
                    // TODO: ここで取得したtextを使う
                    item3 = text;
                  },
                ),
                TextField(
                  controller: TextEditingController(
                    text: model.item4 ?? '',
                  ),
                  decoration: InputDecoration(
                    hintText: '項目4',
                  ),
                  onChanged: (text) {
                    // TODO: ここで取得したtextを使う
                    item4 = text;
                  },
                ),

                ElevatedButton(
                  child: Text('変更決定'),
                  onPressed: () async {
                    await model.InputPageField(item1, item2, item3, item4);
                    Navigator.of(context).pop(); //todo　画面が更新されないよ
                  },
                ),

                //great
              ],
            ),
          ),
          width: double.infinity,
        );
      }),
    );
  }
}
