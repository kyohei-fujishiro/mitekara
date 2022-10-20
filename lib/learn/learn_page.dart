import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:manabiplus/learn/learn_model.dart';
import 'package:provider/provider.dart';

import '../AdBanner.dart';
import 'lean_page_item.dart';

// ignore: must_be_immutable
class LearnPage extends StatelessWidget {
  LearnPage(this.textid, this.course);

  String textid;
  int course;
  bool greatButton = false;
  @override
  Widget build(BuildContext context) {
    final double devicewidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;
    if (course <= 2) {
      greatButton = false;
    }
    return Scaffold(
        floatingActionButton: Column(
            verticalDirection: VerticalDirection.up, // childrenの先頭を下に配置
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                // 余白のためContainerでラップ
                margin: EdgeInsets.only(bottom: 16.0),
                child: FloatingActionButton(
                  heroTag: "hero2",
                  child: Icon(Icons.create),
                  backgroundColor: Color(0xff00FFD4),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LeanPageItem(), //todo 遷移方法
                          fullscreenDialog: true,
                        ));
                  },
                ),
              ),
            ]),
        appBar: AppBar(
          backgroundColor: Color(0xff00FFD4),
          title: Center(
            child: const Text(
              "ミテカラ",
              style: TextStyle(
                  fontSize: 30.0,
                  color: Color(0xff707070),
                  fontFamily: 'Material',
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: FutureBuilder(
              future: Provider.of<LearnModel>(context, listen: false)
                  .initialize(textid, course),
              builder: (context, dataSnapshot) {
                if (dataSnapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Consumer<LearnModel>(builder: (context, model, child) {
                  if (dataSnapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (model.tasks == true) {
                    return Container(
                      child: Column(
                        children: <Widget>[
                          AdBanner(size: AdSize.banner),
                          Padding(
                            padding: const EdgeInsets.only(top: 1, bottom: 1),
                            child: Container(
                              width: devicewidth * 0.9,
                              height: deviceHeight * 0.05,
                              child: FittedBox(
                                child: Text(
                                  model.title,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ), //教材名

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(1),
                                child: Container(
                                  width: devicewidth * 0.4,
                                  height: deviceHeight * 0.05,
                                  child: FittedBox(
                                    child: Row(
                                      children: [
                                        Text(
                                          'ページ',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: deviceHeight * 0.035,
                                            color: Color(0xff707070),
                                          ),
                                        ),
                                        Text(
                                          model.page.toString(),
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: deviceHeight * 0.035,
                                            color: Color(0xff707070),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          //単元名
                          Container(
                            width: devicewidth * 0.8,
                            height: deviceHeight * 0.05,
                            child: FittedBox(
                              child: Text(
                                model.item1,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: deviceHeight * 0.035,
                                  color: Color(0xff707070),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: devicewidth * 0.8,
                            height: deviceHeight * 0.05,
                            child: FittedBox(
                              child: Text(
                                model.item2,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: deviceHeight * 0.035,
                                  color: Color(0xff707070),
                                ),
                              ),
                            ),
                          ),

                          Container(
                            width: devicewidth * 0.8,
                            height: deviceHeight * 0.05,
                            child: FittedBox(
                              child: Text(
                                model.item3,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: deviceHeight * 0.035,
                                  color: Color(0xff707070),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: devicewidth * 0.8,
                            height: deviceHeight * 0.05,
                            child: FittedBox(
                              child: Text(
                                model.item4,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: deviceHeight * 0.035,
                                  color: Color(0xff707070),
                                ),
                              ),
                            ),
                          ),

                          Container(
                            width: devicewidth * 0.8,
                            height: deviceHeight * 0.05,
                            child: FittedBox(
                              child: Text(
                                model.rank,
                                style: TextStyle(
                                    fontSize: deviceHeight * 0.035,
                                    color: Color(0xff707070),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ), //ランク

                          Divider(
                            color: Colors.grey,
                            indent: devicewidth * 0.01,
                            endIndent: devicewidth * 0.01,
                            thickness: deviceHeight * 0.005,
                          ),

                          Column(
                            children: <Widget>[
                              Container(
                                  child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Container(
                                    width: devicewidth * 0.275,
                                    height: deviceHeight * 0.0425,
                                    child: FittedBox(
                                      // fit: BoxFit.scaleDown,
                                      child: Text(
                                        model.rate,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 28,
                                          color: Color(0xff707070),
                                        ),
                                      ),
                                    ),
                                  ), //正答率
                                  Container(
                                    width: devicewidth * 0.275,
                                    height: deviceHeight * 0.0425,
                                    child: FittedBox(
                                      // fit: BoxFit.scaleDown,
                                      child: Text(
                                        '評価',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 28,
                                          color: Color(0xff707070),
                                        ),
                                      ),
                                    ),
                                  ), //todo 評価率設定反映
                                  Container(
                                    width: devicewidth * 0.275,
                                    height: deviceHeight * 0.0425,
                                    child: FittedBox(
                                      // fit: BoxFit.scaleDown,
                                      child: Text(
                                        '次回学習日',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 28,
                                          color: Color(0xff707070),
                                        ),
                                      ),
                                    ),
                                  ), //todo 次回学習日反映
                                ],
                              )), //表題

                              Padding(
                                padding: EdgeInsets.only(
                                    top: deviceHeight * 0.0225,
                                    bottom: deviceHeight * 0.0225),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Container(
                                      width: devicewidth * 0.275,
                                      height: deviceHeight * 0.0425,
                                      child: FittedBox(
                                        // fit: BoxFit.scaleDown,
                                        child: Text(
                                          model.again,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 28,
                                            color: Color(0xff707070),
                                          ),
                                        ),
                                      ),
                                    ), //正答率

                                    Container(
                                      width: devicewidth * 0.275,
                                      height: deviceHeight * 0.0425,
                                      child: FlatButton(
                                        child: FittedBox(
                                          // fit: BoxFit.scaleDown,
                                          child: Text(
                                            "again",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 28,
                                              color: Color(0xff707070),
                                              //color: Color(0xff707070),
                                            ),
                                          ),
                                        ),
                                        color:
                                            Color(0xfff65f5f).withOpacity(0.57),
                                        shape: StadiumBorder(
                                          side: BorderSide(
                                              color: Color(0xff707070),
                                              width: 1.5),
                                        ),
                                        onPressed: () async {
                                          await model.Days(0.8, 1);
                                          await model.GetPage();
                                        },
                                      ),
                                    ), //ボタン

                                    Container(
                                      width: devicewidth * 0.275,
                                      height: deviceHeight * 0.0425,
                                      child: FittedBox(
                                        // fit: BoxFit.scaleDown,
                                        child: Text(
                                          model.nextdayList[0],
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25,
                                            color: Color(0xff707070),
                                          ),
                                        ),
                                      ),
                                    ) //againnextday
                                  ],
                                ),
                              ), //againライン

                              Padding(
                                padding: EdgeInsets.only(
                                    bottom: deviceHeight * 0.0225),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Container(
                                      width: devicewidth * 0.275,
                                      height: deviceHeight * 0.0425,
                                      child: FittedBox(
                                        // fit: BoxFit.scaleDown,
                                        child: Text(
                                          model.normal,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25,
                                            color: Color(0xff707070),
                                          ),
                                        ),
                                      ),
                                    ),

                                    Container(
                                      width: devicewidth * 0.275,
                                      height: deviceHeight * 0.0425,
                                      child: FlatButton(
                                        child: FittedBox(
                                          // fit: BoxFit.scaleDown,
                                          child: Text(
                                            'normal',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25,
                                              color: Color(0xff707070),
                                            ),
                                          ),
                                        ),
                                        color:
                                            Color(0xffCD5FF6).withOpacity(0.57),
                                        shape: StadiumBorder(
                                          side: BorderSide(
                                              color: Color(0xff707070),
                                              width: 1.5),
                                        ),
                                        onPressed: () async {
                                          await model.Days(1.2, 2);
                                          await model.GetPage();
                                        },
                                      ),
                                    ),
                                    /*ノーマルボタン*/

                                    Container(
                                      width: devicewidth * 0.275,
                                      height: deviceHeight * 0.0425,
                                      child: FittedBox(
                                        // fit: BoxFit.scaleDown,
                                        child: Text(
                                          model.nextdayList[1],
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25,
                                            color: Color(0xff707070),
                                          ),
                                        ),
                                      ),
                                    ) //normalnextday
                                  ],
                                ),
                              ), //normalライン

                              Padding(
                                padding: EdgeInsets.only(
                                    bottom: deviceHeight * 0.0225),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Container(
                                      width: devicewidth * 0.275,
                                      height: deviceHeight * 0.0425,
                                      child: FittedBox(
                                        // fit: BoxFit.scaleDown,
                                        child: Text(
                                          model.good,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25,
                                            color: Color(0xff707070),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: devicewidth * 0.275,
                                      height: deviceHeight * 0.0425,
                                      child: FlatButton(
                                        child: FittedBox(
                                          // fit: BoxFit.scaleDown,
                                          child: Text(
                                            'good',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25,
                                              color: Color(0xff707070),
                                            ), /*good*/
                                          ),
                                        ),
                                        color:
                                            Color(0xff5FF669).withOpacity(0.57),
                                        shape: StadiumBorder(
                                          side: BorderSide(
                                              color: Color(0xff707070),
                                              width: 1.5),
                                        ),
                                        onPressed: () async {
                                          await model.Days(2.7, 0);
                                          await model.GetPage();
                                        },
                                      ),
                                    ),
                                    Container(
                                      width: devicewidth * 0.275,
                                      height: deviceHeight * 0.0425,
                                      child: FittedBox(
                                        // fit: BoxFit.scaleDown,
                                        child: Text(
                                          model.nextdayList[2],
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25,
                                            color: Color(0xff707070),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ), //85-95
                              if (course != 3)
                                Padding(
                                    padding: EdgeInsets.only(
                                        bottom: deviceHeight * 0.0225),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        Container(
                                          width: devicewidth * 0.275,
                                          height: deviceHeight * 0.0425,
                                          child: FittedBox(
                                            // fit: BoxFit.scaleDown,
                                            //todo 文字の大きさある程度以下！
                                            child: Text(
                                              model.great,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: deviceHeight * 0.035,
                                                color: Color(0xff707070),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: devicewidth * 0.275,
                                          height: deviceHeight * 0.0425,
                                          child: FlatButton(
                                            child: FittedBox(
                                              // fit: BoxFit.scaleDown,
                                              child: Text(
                                                'great',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 25,
                                                  color: Color(0xff707070),
                                                ),
                                              ),
                                            ),
                                            color: Color(0xff5FABF6)
                                                .withOpacity(0.57),
                                            shape: StadiumBorder(
                                              side: BorderSide(
                                                  color: Color(0xff707070),
                                                  width: 1.5),
                                            ),
                                            onPressed: () async {
                                              await model.Days(3.7, 0);
                                              await model.GetPage();
                                            },
                                          ),
                                        ),
                                        /*great*/
                                        Container(
                                          width: devicewidth * 0.275,
                                          height: deviceHeight * 0.0425,
                                          child: FittedBox(
                                            // fit: BoxFit.scaleDown,
                                            child: Text(
                                              model.nextdayList[3],
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 25,
                                                color: Color(0xff707070),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    )), //95-100
                            ],
                          ), //選択画面
                          SizedBox(
                            width: devicewidth * 0.175,
                            height: deviceHeight * 0.001,
                          ),
                          Row(
                            children: [
                              Container(
                                width: devicewidth * 0.275,
                                height: deviceHeight * 0.0425,
                                child: FlatButton(
                                  child: FittedBox(
                                    // fit: BoxFit.scaleDown,
                                    child: Text(
                                      '削除',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: deviceHeight * 0.035,
                                        color: Color(0xff707070),
                                      ),
                                    ),
                                  ),
                                  color: Color(0xc389897c).withOpacity(0.57),
                                  shape: StadiumBorder(
                                    side: BorderSide(
                                        color: Color(0xff707070), width: 1.5),
                                  ),
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title:
                                              Text('一度消去したらこのページのデータは完全に消えます'),
                                          content: Text('このページを消去しますか？'),
                                          actions: <Widget>[
                                            FlatButton(
                                              child: Text("CANCEL"),
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                            ),
                                            FlatButton(
                                                child: Text("OK"),
                                                onPressed: () async {
                                                  await model.DeleteData();
                                                  await model.GetPage();
                                                  Navigator.pop(context);
                                                }),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                              SizedBox(
                                width: devicewidth * 0.075,
                                height: deviceHeight * 0.05,
                              ),
                              Container(
                                width: devicewidth * 0.275,
                                height: deviceHeight * 0.0425,
                                child: FlatButton(
                                  child: FittedBox(
                                    // fit: BoxFit.scaleDown,
                                    child: Text(
                                      '保留',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: deviceHeight * 0.035,
                                        color: Color(0xff707070),
                                      ),
                                    ),
                                  ),
                                  color: Color(0xc3ffef8a).withOpacity(0.57),
                                  shape: StadiumBorder(
                                    side: BorderSide(
                                        color: Color(0xff707070), width: 1.5),
                                  ),
                                  onPressed: () async {
                                    await model.StateUpdate();
                                    await model.GetPage();
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Text(
                      'おめでとうございます！'
                      '\n本日の学習すべきページはありません。'
                      '\n本当によく頑張りました。'
                      '\n'
                      '\n先に進めるページがない場合は保留を解除して学習を続けましょう。',
                      style: TextStyle(
                          fontSize: deviceHeight * 0.03,
                          color: Color(0xff707070),
                          fontWeight: FontWeight.bold),
                    );
                  }
                });
              }),
        ));
  }
}
