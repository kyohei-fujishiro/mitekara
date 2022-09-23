import 'package:flutter/material.dart';
import 'package:manabiplus/learn/lean_page_item.dart';
import 'package:manabiplus/learn/learn_model.dart';
import 'package:manabiplus/result/result_to_learn_page_model.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class resultToLearnPage extends StatelessWidget {
  resultToLearnPage(this.textid, this.page);

  String textid;
  int page;

  @override
  Widget build(BuildContext context) {
    final double devicewidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        floatingActionButton: Column(
            verticalDirection: VerticalDirection.up, // childrenの先頭を下に配置
            mainAxisSize: MainAxisSize.min,
            children: [
              // FloatingActionButton(
              //   heroTag: "hero1",
              //   child: Icon(Icons.add),
              //   backgroundColor: Color(0xff00FFD4),
              // ),

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
        body: FutureBuilder(
            future: Provider.of<resultToLearnPageModel>(context, listen: false)
                .initialize(textid, page),
            builder: (context, dataSnapshot) {
              return Consumer<resultToLearnPageModel>(
                  builder: (context, model, child) {
                print('$model.title' + '表示画面');
                return Container(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 6),
                        child: Text(
                          model.title,
                          style: TextStyle(
                              fontSize: 40,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ), //教材名

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(20.0),
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
                          Text(
                            model.item1,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: deviceHeight * 0.035,
                              color: Color(0xff707070),
                            ),
                          ),
                        ],
                      ),
                      //単元名
                      Text(
                        model.item2,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: deviceHeight * 0.035,
                          color: Color(0xff707070),
                        ),
                      ),

                      Text(
                        model.item3,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: deviceHeight * 0.035,
                          color: Color(0xff707070),
                        ),
                      ),
                      Text(
                        model.item4,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: deviceHeight * 0.035,
                          color: Color(0xff707070),
                        ),
                      ),

                      Text(
                        model.rank,
                        style: TextStyle(
                            fontSize: deviceHeight * 0.035,
                            color: Color(0xff707070),
                            fontWeight: FontWeight.bold),
                      ), //ランク

                      Divider(
                        color: Colors.grey,
                        indent: 30,
                        endIndent: 30,
                        thickness: 3.0,
                      ),

                      Column(
                        children: <Widget>[
                          Container(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                            padding:
                                const EdgeInsets.only(top: 30.0, bottom: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                    color: Color(0xfff65f5f).withOpacity(0.57),
                                    shape: StadiumBorder(
                                      side: BorderSide(
                                          color: Color(0xff707070), width: 1.5),
                                    ),
                                    onPressed: () async {
                                      await model.Days(0.65, 1);
                                      Navigator.of(context).pop(true);
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
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                    color: Color(0xffCD5FF6).withOpacity(0.57),
                                    shape: StadiumBorder(
                                      side: BorderSide(
                                          color: Color(0xff707070), width: 1.5),
                                    ),
                                    onPressed: () async {
                                      await model.Days(0.9, 2);
                                      Navigator.of(context).pop(true);
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
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                    color: Color(0xff5FF669).withOpacity(0.57),
                                    shape: StadiumBorder(
                                      side: BorderSide(
                                          color: Color(0xff707070), width: 1.5),
                                    ),
                                    onPressed: () async {
                                      await model.Days(2.5, 0);
                                      Navigator.of(context).pop(true);
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

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                  color: Color(0xff5FABF6).withOpacity(0.57),
                                  shape: StadiumBorder(
                                    side: BorderSide(
                                        color: Color(0xff707070), width: 1.5),
                                  ),
                                  onPressed: () async {
                                    await model.Days(3.0, 0);
                                    Navigator.of(context).pop(true);
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
                          ), //95-100
                        ],
                      ), //選択画面
                      SizedBox(
                        width: devicewidth * 0.275,
                        height: deviceHeight * 0.05,
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
                                      title: Text('一度消去したらこのページのデータは完全に消えます'),
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
              });
            }));
  }
}

class Learn {}
