import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manabiplus/learn/course_select_page.dart';
import 'package:manabiplus/learn/text_select_page.dart';

enum Speed { normalspeed, quickspeed, slowlyspeed }

class OptionTextRange extends StatelessWidget {
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
                  child: Text(
                    '計    画',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Color(0xff707070),
                        fontFamily: 'Material',
                        fontWeight: FontWeight.bold),
                  ),
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
                    '範囲',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Color(0xff707070),
                        fontFamily: 'Material',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Divider(
              color: Colors.grey,
              indent: 30,
              endIndent: 30,
              thickness: 2.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 20,
                ),
                Container(
                  width: 130,
                  height: 40,
                  child: TextButton(
                    child: Text(
                      '確   定',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Color(0xff707070),
                      ), /*good*/
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xffF6F4F4).withOpacity(0.57),
                      shape: StadiumBorder(
                        side: BorderSide(color: Color(0xff707070), width: 1.5),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TextSelectPage(), //todo 色変になる。
                          fullscreenDialog: true,
                        ),
                      );
                    },
                  ),
                ),
                //確定ボタン
              ],
            ),
            Number(),
          ],
        ),
      ),
    );
  }
}

Widget Number() {
  return SingleChildScrollView(
    child: Column(
      children: [
        Container(
          child: Row(
            //todo 上と位置ズレる
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 30,
                child: Text(
                  'No',
                  style: TextStyle(
                      fontSize: 17.0,
                      color: Color(0xff707070),
                      fontFamily: 'Material',
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: 150,
                child: Center(
                  child: Text(
                    '単元名',
                    style: TextStyle(
                        fontSize: 17.0,
                        color: Color(0xff707070),
                        fontFamily: 'Material',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                width: 80,
                child: Center(
                  child: Text(
                    'ページ',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Color(0xff707070),
                        fontFamily: 'Material',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                width: 130,
                child: Center(
                  child: Text(
                    '学習',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Color(0xff707070),
                        fontFamily: 'Material',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          child: Row(
            //todo 上と位置ズレる
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 30,
                child: Container(
                  width: 30,
                  child: Text(
                    '2',
                    style: TextStyle(
                        fontSize: 17.0,
                        color: Color(0xff707070),
                        fontFamily: 'Material',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                width: 150,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Container(
                    width: 150,
                    child: Text(
                      '基本（現在形・過去形）',
                      style: TextStyle(
                          fontSize: 17.0,
                          color: Color(0xff707070),
                          fontFamily: 'Material',
                          fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
              Container(
                width: 80,
                child: Center(
                  child: Text(
                    'P17',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Color(0xff707070),
                        fontFamily: 'Material',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                width: 130,
                child: Center(
                  child: Text(
                    '◎',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Color(0xff707070),
                        fontFamily: 'Material',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          child: Row(
            //todo 上と位置ズレる
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 30,
                child: Container(
                  width: 30,
                  child: Text(
                    '3',
                    style: TextStyle(
                        fontSize: 17.0,
                        color: Color(0xff707070),
                        fontFamily: 'Material',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                width: 150,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Container(
                    width: 150,
                    child: Text(
                      '基本（現在形・過去形）',
                      style: TextStyle(
                          fontSize: 17.0,
                          color: Color(0xff707070),
                          fontFamily: 'Material',
                          fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
              Container(
                width: 80,
                child: Center(
                  child: Text(
                    'P17',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Color(0xff707070),
                        fontFamily: 'Material',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                width: 130,
                child: Center(
                  child: Text(
                    '◎',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Color(0xff707070),
                        fontFamily: 'Material',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          child: Row(
            //todo 上と位置ズレる
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 30,
                child: Container(
                  width: 30,
                  child: Text(
                    '4',
                    style: TextStyle(
                        fontSize: 17.0,
                        color: Color(0xff707070),
                        fontFamily: 'Material',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                width: 150,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Container(
                    width: 150,
                    child: Text(
                      '基本（現在形・過去形）',
                      style: TextStyle(
                          fontSize: 17.0,
                          color: Color(0xff707070),
                          fontFamily: 'Material',
                          fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
              Container(
                width: 80,
                child: Center(
                  child: Text(
                    'P17',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Color(0xff707070),
                        fontFamily: 'Material',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                width: 130,
                child: Center(
                  child: Text(
                    '◎',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Color(0xff707070),
                        fontFamily: 'Material',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          child: Row(
            //todo 上と位置ズレる
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 30,
                child: Container(
                  width: 30,
                  child: Text(
                    '5',
                    style: TextStyle(
                        fontSize: 17.0,
                        color: Color(0xff707070),
                        fontFamily: 'Material',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                width: 150,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Container(
                    width: 150,
                    child: Text(
                      '基本（現在形・過去形）',
                      style: TextStyle(
                          fontSize: 17.0,
                          color: Color(0xff707070),
                          fontFamily: 'Material',
                          fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
              Container(
                width: 80,
                child: Center(
                  child: Text(
                    'P17',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Color(0xff707070),
                        fontFamily: 'Material',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                width: 130,
                child: Center(
                  child: Text(
                    '◎',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Color(0xff707070),
                        fontFamily: 'Material',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          child: Row(
            //todo 上と位置ズレる
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 30,
                child: Container(
                  width: 30,
                  child: Text(
                    '5',
                    style: TextStyle(
                        fontSize: 17.0,
                        color: Color(0xff707070),
                        fontFamily: 'Material',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                width: 150,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Container(
                    width: 150,
                    child: Text(
                      '基本（現在形・過去形）',
                      style: TextStyle(
                          fontSize: 17.0,
                          color: Color(0xff707070),
                          fontFamily: 'Material',
                          fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
              Container(
                width: 80,
                child: Center(
                  child: Text(
                    'P17',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Color(0xff707070),
                        fontFamily: 'Material',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                width: 130,
                child: Center(
                  child: Text(
                    '◎',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Color(0xff707070),
                        fontFamily: 'Material',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          child: Row(
            //todo 上と位置ズレる
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 30,
                child: Container(
                  width: 30,
                  child: Text(
                    '6',
                    style: TextStyle(
                        fontSize: 17.0,
                        color: Color(0xff707070),
                        fontFamily: 'Material',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                width: 150,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Container(
                    width: 150,
                    child: Text(
                      '基本（現在形・過去形）',
                      style: TextStyle(
                          fontSize: 17.0,
                          color: Color(0xff707070),
                          fontFamily: 'Material',
                          fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
              Container(
                width: 80,
                child: Center(
                  child: Text(
                    'P17',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Color(0xff707070),
                        fontFamily: 'Material',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                width: 130,
                child: Center(
                  child: Text(
                    '◎',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Color(0xff707070),
                        fontFamily: 'Material',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          child: Row(
            //todo 上と位置ズレる
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 30,
                child: Container(
                  width: 30,
                  child: Text(
                    '6',
                    style: TextStyle(
                        fontSize: 17.0,
                        color: Color(0xff707070),
                        fontFamily: 'Material',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                width: 150,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Container(
                    width: 150,
                    child: Text(
                      '基本（現在形・過去形）',
                      style: TextStyle(
                          fontSize: 17.0,
                          color: Color(0xff707070),
                          fontFamily: 'Material',
                          fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
              Container(
                width: 80,
                child: Center(
                  child: Text(
                    'P17',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Color(0xff707070),
                        fontFamily: 'Material',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                width: 130,
                child: Center(
                  child: Text(
                    '◎',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Color(0xff707070),
                        fontFamily: 'Material',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          child: Row(
            //todo 上と位置ズレる
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 30,
                child: Container(
                  width: 30,
                  child: Text(
                    '7',
                    style: TextStyle(
                        fontSize: 17.0,
                        color: Color(0xff707070),
                        fontFamily: 'Material',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                width: 150,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Container(
                    width: 150,
                    child: Text(
                      '基本（現在形・過去形）',
                      style: TextStyle(
                          fontSize: 17.0,
                          color: Color(0xff707070),
                          fontFamily: 'Material',
                          fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
              Container(
                width: 80,
                child: Center(
                  child: Text(
                    'P17',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Color(0xff707070),
                        fontFamily: 'Material',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                width: 130,
                child: Center(
                  child: Text(
                    '◎',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Color(0xff707070),
                        fontFamily: 'Material',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          child: Row(
            //todo 上と位置ズレる
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 30,
                child: Container(
                  width: 30,
                  child: Text(
                    '8',
                    style: TextStyle(
                        fontSize: 17.0,
                        color: Color(0xff707070),
                        fontFamily: 'Material',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                width: 150,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Container(
                    width: 150,
                    child: Text(
                      '基本（現在形・過去形）',
                      style: TextStyle(
                          fontSize: 17.0,
                          color: Color(0xff707070),
                          fontFamily: 'Material',
                          fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
              Container(
                width: 80,
                child: Center(
                  child: Text(
                    'P17',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Color(0xff707070),
                        fontFamily: 'Material',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                width: 130,
                child: Center(
                  child: Text(
                    '〇',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Color(0xff707070),
                        fontFamily: 'Material',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          child: Row(
            //todo 上と位置ズレる
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 30,
                child: Container(
                  width: 30,
                  child: Text(
                    '9',
                    style: TextStyle(
                        fontSize: 17.0,
                        color: Color(0xff707070),
                        fontFamily: 'Material',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                width: 150,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Container(
                    width: 150,
                    child: Text(
                      '基本（現在形・過去形）',
                      style: TextStyle(
                          fontSize: 17.0,
                          color: Color(0xff707070),
                          fontFamily: 'Material',
                          fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
              Container(
                width: 80,
                child: Center(
                  child: Text(
                    'P17',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Color(0xff707070),
                        fontFamily: 'Material',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                width: 130,
                child: Center(
                  child: Text(
                    '〇',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Color(0xff707070),
                        fontFamily: 'Material',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          child: Row(
            //todo 上と位置ズレる
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 30,
                child: Container(
                  width: 30,
                  child: Text(
                    '10',
                    style: TextStyle(
                        fontSize: 17.0,
                        color: Color(0xff707070),
                        fontFamily: 'Material',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                width: 150,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Container(
                    width: 150,
                    child: Text(
                      '基本（現在形・過去形）',
                      style: TextStyle(
                          fontSize: 17.0,
                          color: Color(0xff707070),
                          fontFamily: 'Material',
                          fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
              Container(
                width: 80,
                child: Center(
                  child: Text(
                    'P17',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Color(0xff707070),
                        fontFamily: 'Material',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                width: 130,
                child: Center(
                  child: Text(
                    '〇',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Color(0xff707070),
                        fontFamily: 'Material',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
