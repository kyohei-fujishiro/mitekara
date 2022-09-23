import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manabiplus/option/option_text_plan.dart';
import 'package:manabiplus/option/option_text_range.dart';

class OptionTextRate extends StatelessWidget {
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
                Container(
                  width: 80,
                  height: 35,
                  decoration: BoxDecoration(
                    border: const Border(
                      bottom: const BorderSide(
                        color: Colors.blue,
                        width: 5,
                      ),
                    ),
                  ),
                  child: Text(
                    '評価設定',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Color(0xff707070),
                        fontFamily: 'Material',
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  child: FlatButton(
                    child: Text(
                      '計画',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Color(0xff707070),
                          fontFamily: 'Material',
                          fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OptionTextPlan(), //todo 繊維方法
                          fullscreenDialog: true,
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  child: FlatButton(
                    child: Text(
                      '範囲',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Color(0xff707070),
                          fontFamily: 'Material',
                          fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OptionTextRange(), //todo 繊維方法
                          fullscreenDialog: true,
                        ),
                      );
                    },
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
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        '評価ランク',
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Color(0xff707070),
                            fontFamily: 'Material',
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: 115,
                        height: 32,
                        child: FlatButton(
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
                          color: Color(0xffF65F5F).withOpacity(0.57),
                          shape: StadiumBorder(
                            side: BorderSide(
                                color: Color(0xff707070), width: 1.5),
                          ),
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 115,
                        height: 32,
                        child: FlatButton(
                          child: Text(
                            'normal',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Color(0xff707070),
                            ),
                          ),
                          color: Color(0xffCD5FF6).withOpacity(0.57),
                          shape: StadiumBorder(
                            side: BorderSide(
                                color: Color(0xff707070), width: 1.5),
                          ),
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 115,
                        height: 32,
                        child: FlatButton(
                          child: Text(
                            'good',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Color(0xff707070),
                            ), /*good*/
                          ),
                          color: Color(0xff5FF669).withOpacity(0.57),
                          shape: StadiumBorder(
                            side: BorderSide(
                                color: Color(0xff707070), width: 1.5),
                          ),
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 120,
                        height: 32,
                        child: FlatButton(
                          child: Text(
                            'great',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Color(0xff707070),
                            ),
                          ),
                          color: Color(0xff5FABF6).withOpacity(0.57),
                          shape: StadiumBorder(
                            side: BorderSide(
                                color: Color(0xff707070), width: 1.5),
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 120,
                        height: 35,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 3),
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: TextField(),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 120,
                        height: 35,
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.greenAccent, width: 1),
                            ),
                          ),
                          onChanged: (text) {},
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 120,
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
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 120,
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
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 120,
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
