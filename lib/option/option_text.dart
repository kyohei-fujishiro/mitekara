import 'package:flutter/material.dart';
import 'package:manabiplus/option/option_text_rate.dart';

class TextOption extends StatelessWidget {
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
            Text(
              "教材設定",
              style: TextStyle(
                  fontSize: 20.0,
                  color: Color(0xff707070),
                  fontFamily: 'Material',
                  fontWeight: FontWeight.bold),
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
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OptionTextRate(),
                          fullscreenDialog: true,
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          width: 150,
                          child: Text(
                            'NextStage',
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Color(0xff707070),
                                fontFamily: 'Material',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          width: 150,
                          child: Text(
                            '→',
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.black,
                                fontFamily: 'Material',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ), //1
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        width: 150,
                        child: Text(
                          '青チャート数ⅡB',
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Color(0xff707070),
                              fontFamily: 'Material',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        width: 150,
                        child: Text(
                          '→',
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.black,
                              fontFamily: 'Material',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ), //2
            Container(
              child: Column(
                children: <Widget>[
                  Divider(
                    color: Colors.grey,
                    indent: 30,
                    endIndent: 30,
                    thickness: 2.0,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          width: 150,
                          child: Text(
                            'フォレスタゴール数学',
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Color(0xff707070),
                                fontFamily: 'Material',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          width: 150,
                          child: Text(
                            '→',
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.black,
                                fontFamily: 'Material',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ), //3
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        width: 150,
                        child: Text(
                          'FP3級　みんなが欲しがった',
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Color(0xff707070),
                              fontFamily: 'Material',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        width: 150,
                        child: Text(
                          '→',
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.black,
                              fontFamily: 'Material',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ), //4
            Container(
              child: Column(
                children: <Widget>[
                  Divider(
                    color: Colors.grey,
                    indent: 30,
                    endIndent: 30,
                    thickness: 2.0,
                  ),
                ],
              ),
            ), //5
          ],
        ),
      ),
    );
  }
}
