import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manabiplus/learn/course_select_page.dart';

enum Speed { normalspeed, quickspeed, slowlyspeed }

class OptionTextPlan extends StatefulWidget {
  @override
  _OptionTextPlanState createState() => _OptionTextPlanState();
}

class _OptionTextPlanState extends State<OptionTextPlan> {
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
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, top: 15.0),
                  child: Center(
                    child: Text(
                      'NextStage', //
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  '評価設定',
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Color(0xff707070),
                      fontFamily: 'Material',
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  width: 65,
                  height: 35,
                  decoration: BoxDecoration(
                    border: const Border(
                      bottom: const BorderSide(
                        color: Colors.blue,
                        width: 5,
                      ),
                    ),
                  ),
                  child: const Text(
                    '計    画',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Color(0xff707070),
                        fontFamily: 'Material',
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  '範囲',
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Color(0xff707070),
                      fontFamily: 'Material',
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Divider(
              color: Colors.grey,
              indent: 30,
              endIndent: 30,
              thickness: 2.0,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '   学習速度',
                          style: TextStyle(
                              fontSize: 25.0,
                              color: Color(0xff707070),
                              fontFamily: 'Material',
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              '◎標準',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: Color(0xff707070),
                                  fontFamily: 'Material',
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '〇速習',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: Color(0xff707070),
                                  fontFamily: 'Material',
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '〇丁寧',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: Color(0xff707070),
                                  fontFamily: 'Material',
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ), //todo　ラジオボタン
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '   学習量',
                          style: TextStyle(
                              fontSize: 25.0,
                              color: Color(0xff707070),
                              fontFamily: 'Material',
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              '新規ページ',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: Color(0xff707070),
                                  fontFamily: 'Material',
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              width: 50,
                              height: 35,
                              child: TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.greenAccent, width: 1),
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              'ページ/日',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: Color(0xff707070),
                                  fontFamily: 'Material',
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              '復習ページ',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: Color(0xff707070),
                                  fontFamily: 'Material',
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              width: 50,
                              height: 35,
                              child: TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.greenAccent, width: 1),
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              'ページ/日',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: Color(0xff707070),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '   新規学習日',
                          style: TextStyle(
                              fontSize: 25.0,
                              color: Color(0xff707070),
                              fontFamily: 'Material',
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Text(
                                  '◎毎日',
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      color: Color(0xff707070),
                                      fontFamily: 'Material',
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '〇なし',
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      color: Color(0xff707070),
                                      fontFamily: 'Material',
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Text(
                                    '毎週',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        color: Color(0xff707070),
                                        fontFamily: 'Material',
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '〇月曜日',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        color: Color(0xff707070),
                                        fontFamily: 'Material',
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '◎火曜日',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        color: Color(0xff707070),
                                        fontFamily: 'Material',
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '〇水曜日',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        color: Color(0xff707070),
                                        fontFamily: 'Material',
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '〇木曜日',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        color: Color(0xff707070),
                                        fontFamily: 'Material',
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '◎金曜日',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        color: Color(0xff707070),
                                        fontFamily: 'Material',
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '〇土曜日',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        color: Color(0xff707070),
                                        fontFamily: 'Material',
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '〇日曜日',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        color: Color(0xff707070),
                                        fontFamily: 'Material',
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Text(
                                    '隔週',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        color: Color(0xff707070),
                                        fontFamily: 'Material',
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '〇月曜日',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        color: Color(0xff707070),
                                        fontFamily: 'Material',
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '〇火曜日',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        color: Color(0xff707070),
                                        fontFamily: 'Material',
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '〇水曜日',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        color: Color(0xff707070),
                                        fontFamily: 'Material',
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '〇木曜日',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        color: Color(0xff707070),
                                        fontFamily: 'Material',
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '〇金曜日',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        color: Color(0xff707070),
                                        fontFamily: 'Material',
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '〇土曜日',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        color: Color(0xff707070),
                                        fontFamily: 'Material',
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '〇日曜日',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        color: Color(0xff707070),
                                        fontFamily: 'Material',
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 200,
                        height: 40,
                        child: TextButton(
                          child: Text(
                            '確   定',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Color(0xff707070),
                            ), /*good*/
                          ),
                          style: TextButton.styleFrom(
                            backgroundColor:
                                Color(0xffF6F4F4).withOpacity(0.57),
                            shape: StadiumBorder(
                              side: BorderSide(
                                  color: Color(0xff707070), width: 1.5),
                            ),
                          ),
                          onPressed: () {
                            /*Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LearnListPage(),
                                //todo 色変になる。
                                fullscreenDialog: true,
                              ),
                            );*/

                            Navigator.popUntil(
                                context, ModalRoute.withName("/"));
                          },
                        ),
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
