import 'package:flutter/material.dart';
import 'package:manabiplus/result/unit_result_page.dart';

class TextResultListPage2 extends StatelessWidget {
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
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 25.0),
              child: Center(
                child: Text(
                  'NextStage', //todo ミテカラ
                  style: TextStyle(
                      fontSize: 40,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            //教材名
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 100,
                        height: 30,
                        child: Center(
                          child: Text(
                            'Beginner',
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Color(0xff707070),
                                fontFamily: 'Material',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ), //beginner
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Container(
                          color: Color(0xfff20e15).withOpacity(0.25),
                          width: 100,
                          height: 30,
                          child: Center(
                            child: Text(
                              'Normal',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: Color(0xff707070),
                                  fontFamily: 'Material',
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        color: Color(0xffFFA250).withOpacity(0.7),
                        width: 100,
                        height: 30,
                        child: Center(
                          child: Text(
                            'Super',
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Color(0xff707070),
                                fontFamily: 'Material',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),

                      //Normal
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        color: Color(0xffA5FFBD).withOpacity(0.9),
                        width: 100,
                        height: 30,
                        child: Center(
                          child: Text(
                            'Hyper',
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Color(0xff707070),
                                fontFamily: 'Material',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Container(
                          color: Color(0xff6EFFFF).withOpacity(0.8),
                          width: 100,
                          height: 30,
                          child: Center(
                            child: Text(
                              'Master',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: Color(0xff707070),
                                  fontFamily: 'Material',
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        color: Color(0xff6F6F6F).withOpacity(0.405),
                        width: 100,
                        height: 30,
                        child: Center(
                          child: Text(
                            'Bad',
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
                Divider(
                  color: Colors.grey,
                  indent: 30,
                  endIndent: 30,
                  thickness: 3.0,
                ),
                Column(
                  children: <Widget>[
                    TextResultList(context),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget TextResultList(context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              child: Row(
                //todo 上と位置ズレる
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
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
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Container(
                      width: 150,
                      child: Text(
                        '現在完了・未来',
                        style: TextStyle(
                            fontSize: 17.0,
                            color: Color(0xff707070),
                            fontFamily: 'Material',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      'P19',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Color(0xff707070),
                          fontFamily: 'Material',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
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
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UnitResultPage('現在完了・未来'), //todo 繊維方法
                    fullscreenDialog: true,
                  ),
                );
              },
              child: Container(),
            ),
            Container(
              color: Color(0xffFFA250).withOpacity(0.7),
              child: Row(
                //todo 上と位置ズレる
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
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
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Container(
                      width: 150,
                      child: Text(
                        '現在完了・未来',
                        style: TextStyle(
                            fontSize: 17.0,
                            color: Color(0xff707070),
                            fontFamily: 'Material',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      'P19',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Color(0xff707070),
                          fontFamily: 'Material',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
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
                  ),
                ],
              ),
            ),
            Container(
              color: Color(0xff6EFFFF).withOpacity(0.8),
              child: Row(
                //todo 上と位置ズレる
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
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
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Container(
                      width: 150,
                      child: Text(
                        '現在完了・未来',
                        style: TextStyle(
                            fontSize: 17.0,
                            color: Color(0xff707070),
                            fontFamily: 'Material',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      'P19',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Color(0xff707070),
                          fontFamily: 'Material',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
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
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                //todo 上と位置ズレる
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
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
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Container(
                      width: 150,
                      child: Text(
                        '現在完了・未来',
                        style: TextStyle(
                            fontSize: 17.0,
                            color: Color(0xff707070),
                            fontFamily: 'Material',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      'P19',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Color(0xff707070),
                          fontFamily: 'Material',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
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
                  ),
                ],
              ),
            ),
            Container(
              color: Color(0xffA5FFBD).withOpacity(0.9),
              child: Row(
                //todo 上と位置ズレる
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
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
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Container(
                      width: 150,
                      child: Text(
                        '現在完了・未来',
                        style: TextStyle(
                            fontSize: 17.0,
                            color: Color(0xff707070),
                            fontFamily: 'Material',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      'P19',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Color(0xff707070),
                          fontFamily: 'Material',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
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
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                //todo 上と位置ズレる
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
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
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Container(
                      width: 150,
                      child: Text(
                        '現在完了・未来',
                        style: TextStyle(
                            fontSize: 17.0,
                            color: Color(0xff707070),
                            fontFamily: 'Material',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      'P19',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Color(0xff707070),
                          fontFamily: 'Material',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
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
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                //todo 上と位置ズレる
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
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
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Container(
                      width: 150,
                      child: Text(
                        '現在完了・未来',
                        style: TextStyle(
                            fontSize: 17.0,
                            color: Color(0xff707070),
                            fontFamily: 'Material',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      'P19',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Color(0xff707070),
                          fontFamily: 'Material',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
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
                  ),
                ],
              ),
            ),
            Container(
              color: Color(0xffF20E15).withOpacity(0.25),
              child: Row(
                //todo 上と位置ズレる
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
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
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Container(
                      width: 150,
                      child: Text(
                        '現在完了・未来',
                        style: TextStyle(
                            fontSize: 17.0,
                            color: Color(0xff707070),
                            fontFamily: 'Material',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      'P19',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Color(0xff707070),
                          fontFamily: 'Material',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
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
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                //todo 上と位置ズレる
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
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
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Container(
                      width: 150,
                      child: Text(
                        '現在完了・未来',
                        style: TextStyle(
                            fontSize: 17.0,
                            color: Color(0xff707070),
                            fontFamily: 'Material',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      'P19',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Color(0xff707070),
                          fontFamily: 'Material',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
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
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                //todo 上と位置ズレる
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
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
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Container(
                      width: 150,
                      child: Text(
                        '現在完了・未来',
                        style: TextStyle(
                            fontSize: 17.0,
                            color: Color(0xff707070),
                            fontFamily: 'Material',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      'P19',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Color(0xff707070),
                          fontFamily: 'Material',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
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
                  ),
                ],
              ),
            ),
            Container(
              color: Color(0xffF20E15).withOpacity(0.25),
              child: Row(
                //todo 上と位置ズレる
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
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
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Container(
                      width: 150,
                      child: Text(
                        '現在完了・未来',
                        style: TextStyle(
                            fontSize: 17.0,
                            color: Color(0xff707070),
                            fontFamily: 'Material',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      'P19',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Color(0xff707070),
                          fontFamily: 'Material',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
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
                  ),
                ],
              ),
            ),
            Container(
              color: Color(0xff6EFFFF).withOpacity(0.8),
              child: Row(
                //todo 上と位置ズレる
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
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
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Container(
                      width: 150,
                      child: Text(
                        '現在完了・未来',
                        style: TextStyle(
                            fontSize: 17.0,
                            color: Color(0xff707070),
                            fontFamily: 'Material',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      'P19',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Color(0xff707070),
                          fontFamily: 'Material',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
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
