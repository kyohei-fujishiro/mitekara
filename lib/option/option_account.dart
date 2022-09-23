import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
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
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "アカウント設定",
                style: TextStyle(
                    fontSize: 20.0,
                    color: Color(0xff707070),
                    fontFamily: 'Material',
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Divider(
                    color: Colors.grey,
                    indent: 30,
                    endIndent: 30,
                    thickness: 2.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        'アドレス',
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Color(0xff707070),
                            fontFamily: 'Material',
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'abcdefg@gmail.com',
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                            fontFamily: 'Material',
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ), //アドレス
            Container(
              child: Column(
                children: <Widget>[
                  Divider(
                    color: Colors.grey,
                    indent: 30,
                    endIndent: 30,
                    thickness: 2.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        'パスワード',
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Color(0xff707070),
                            fontFamily: 'Material',
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '※※※※※※※※',
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                            fontFamily: 'Material',
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ), //パスワード
            Container(
              child: Column(
                children: <Widget>[
                  Divider(
                    color: Colors.grey,
                    indent: 30,
                    endIndent: 30,
                    thickness: 2.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        'ニックネーム',
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Color(0xff707070),
                            fontFamily: 'Material',
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '田中　太郎',
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                            fontFamily: 'Material',
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Divider(
                    color: Colors.grey,
                    indent: 30,
                    endIndent: 30,
                    thickness: 2.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        '学年',
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Color(0xff707070),
                            fontFamily: 'Material',
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '高校1年生',
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                            fontFamily: 'Material',
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Divider(
                    color: Colors.grey,
                    indent: 30,
                    endIndent: 30,
                    thickness: 2.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        '生年月日',
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Color(0xff707070),
                            fontFamily: 'Material',
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '1989/08/19',
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                            fontFamily: 'Material',
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
