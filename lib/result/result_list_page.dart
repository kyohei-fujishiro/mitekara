import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manabiplus/learn/course_select_page_model.dart';
import 'package:manabiplus/learn/learn_model.dart';
import 'package:manabiplus/learn/learn_page.dart';
import 'package:manabiplus/result/result_list_page_model.dart';
import 'package:provider/provider.dart';
import 'package:manabiplus/result/text_result_list.page.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ResultListPage extends StatefulWidget {
  ResultListPage() : super();
  final String title = 'Charts Demo';


  @override
  _ResultListPageState createState() => _ResultListPageState();
}

class _ResultListPageState extends State<ResultListPage> {
  int textindex;
  String textid = '';

  @override
  Widget build(BuildContext context) {
    final double devicewidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: FutureBuilder(
        future: Provider.of<resultListPageModel>(context, listen: false).getGraphData(),
        builder: (context, dataSnapshot) {
          // 非同期処理未完了 = 通信中
          if (dataSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return Consumer<resultListPageModel>(builder: (context, model, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: devicewidth * 0.9,
                  height: deviceHeight * 0.07,
                  child: FittedBox(
                    child: Text(
                      "教材の一覧",
                      style: TextStyle(
                          color: Color(0xff707070),
                          fontFamily: 'Material',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ), //教材一覧

                Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount:model.resultTextIdList.length,
                      itemBuilder:(context,index){
                        return Column(
                          children: <Widget>[
                            Container(
                              width: devicewidth * 0.9,
                              height: deviceHeight * 0.0425,
                              child: FittedBox(
                                child: Text(
                                  model.textNameList[index],
                                  style: TextStyle(
                                      fontSize: 25.0,
                                      fontFamily: 'Material',
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Container(
                              width: devicewidth * 0.9,
                              height: deviceHeight * 0.3,
                              decoration: BoxDecoration(boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  spreadRadius: devicewidth * 0.001,
                                  blurRadius: 6.0,
                                  offset: Offset(0, 3),
                                ),
                              ]),
                              child: GestureDetector(
                                child: Stack(
                                  children: [
                                    Card(
                                      child: charts.BarChart(
                                        model.seriesList[index],
                                        animate: true,
                                        vertical: false,
                                      ),
                                    ),

                                    Container(
                                      color: Colors.transparent,
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  textindex = index;
                                  textid = model.resultTextIdList[index];
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => TextResultListPage(textid),
                                      //todo 繊維方法
                                      fullscreenDialog: true,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        );

                      }
                  ),
                )

              ],
            );
          });
        },
      ),
    );
  }
}
