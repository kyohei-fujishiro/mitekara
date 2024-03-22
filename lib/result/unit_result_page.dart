import 'package:flutter/material.dart';
import 'package:manabiplus/result/text_result_list.page.dart';

class UnitResultPage extends StatelessWidget {
  UnitResultPage(this.unit);

  final String unit;

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
      body: Column(
        children: <Widget>[
          Text(
            "学習履歴詳細",
            style: TextStyle(
                fontSize: 20.0,
                color: Color(0xff707070),
                fontFamily: 'Material',
                fontWeight: FontWeight.bold),
          ),
          Container(
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
          Container(
            color: Color(0xffFFA250).withOpacity(0.7),
            child: Text(
              unit,
              style: TextStyle(
                  fontSize: 20.0,
                  color: Color(0xff707070),
                  fontFamily: 'Material',
                  fontWeight: FontWeight.bold),
            ),
          ),
          Divider(
            color: Colors.grey,
            indent: 30,
            endIndent: 30,
            thickness: 3.0,
          ),
          UnitResultList(),
        ],
      ),
    );
  }

  Widget UnitResultList() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Row(
              children: <Widget>[
                Container(
                  width: 130,
                  child: Center(
                    child: Text(
                      '20/05/24',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Color(0xff707070),
                          fontFamily: 'Material',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ), //日付
                Container(
                  width: 115,
                  height: 32,
                  child: TextButton(
                    child: Text(
                      'great',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Color(0xff707070),
                      ),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xff5FABF6).withOpacity(0.57),
                      shape: StadiumBorder(
                        side: BorderSide(color: Color(0xff707070), width: 1.5),
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
                Container(
                  width: 130,
                  child: Center(
                    child: Text(
                      '00:32:04',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Color(0xff707070),
                          fontFamily: 'Material',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ), //評価
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Row(
              children: <Widget>[
                Container(
                  width: 130,
                  child: Center(
                    child: Text(
                      '20/05/23',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Color(0xff707070),
                          fontFamily: 'Material',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ), //日付
                Container(
                  width: 115,
                  height: 32,
                  child: TextButton(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Text(
                        "again",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Color(0xff707070),
                          //color: Color(0xff707070),
                        ),
                      ),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xffF65F5F).withOpacity(0.57),
                      shape: StadiumBorder(
                        side: BorderSide(color: Color(0xff707070), width: 1.5),
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
                Container(
                  width: 130,
                  child: Center(
                    child: Text(
                      '00:00:12',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Color(0xff707070),
                          fontFamily: 'Material',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ), //評価
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Row(
              children: <Widget>[
                Container(
                  width: 130,
                  child: Center(
                    child: Text(
                      '20/05/20',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Color(0xff707070),
                          fontFamily: 'Material',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ), //日付
                Container(
                  width: 115,
                  height: 32,
                  child: TextButton(
                    child: Text(
                      'good',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Color(0xff707070),
                      ),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xff5FF669).withOpacity(0.57),
                      shape: StadiumBorder(
                        side: BorderSide(color: Color(0xff707070), width: 1.5),
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
                Container(
                  width: 130,
                  child: Center(
                    child: Text(
                      '00:40:34',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Color(0xff707070),
                          fontFamily: 'Material',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ), //評価
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Row(
              children: <Widget>[
                Container(
                  width: 130,
                  child: Center(
                    child: Text(
                      '20/05/19',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Color(0xff707070),
                          fontFamily: 'Material',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ), //日付
                Container(
                  width: 115,
                  height: 32,
                  child: TextButton(
                    child: Text(
                      'normal',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Color(0xff707070),
                      ),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xffCD5FF6).withOpacity(0.57),
                      shape: StadiumBorder(
                        side: BorderSide(color: Color(0xff707070), width: 1.5),
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
                Container(
                  width: 130,
                  child: Center(
                    child: Text(
                      '00:50:24',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Color(0xff707070),
                          fontFamily: 'Material',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ), //評価
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Row(
              children: <Widget>[
                Container(
                  width: 130,
                  child: Center(
                    child: Text(
                      '20/05/18',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Color(0xff707070),
                          fontFamily: 'Material',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ), //日付
                Container(
                  width: 115,
                  height: 32,
                  child: TextButton(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Text(
                        "again",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Color(0xff707070),
                          //color: Color(0xff707070),
                        ),
                      ),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xffF65F5F).withOpacity(0.57),
                      shape: StadiumBorder(
                        side: BorderSide(color: Color(0xff707070), width: 1.5),
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
                Container(
                  width: 130,
                  child: Center(
                    child: Text(
                      '00:32:04',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Color(0xff707070),
                          fontFamily: 'Material',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ), //評価
              ],
            ),
          ),
        ],
      ),
    );
  }
}
