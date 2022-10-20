import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:manabiplus/AdBanner.dart';
import 'package:manabiplus/learn/learn_page.dart';
import 'package:manabiplus/learn/learn_model.dart';
import 'package:manabiplus/text_entry.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'course_select_page_model.dart';

// ignore: must_be_immutable
class CourseSelectPage extends StatelessWidget {
  CourseSelectPage(this.textid);
  String textid;
  int course;

  @override
  Widget build(BuildContext context) {
    final double devicewidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
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
        future: Provider.of<CourseSelectModel>(context, listen: false)
            .initialize(textid),
        builder: (context, dataSnapshot) {
          // 非同期処理未完了 = 通信中
          if (dataSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return SingleChildScrollView(
            child:
                Consumer<CourseSelectModel>(builder: (context, model, child) {
              return Column(
                children: <Widget>[
                  AdBanner(size: AdSize.banner),
                  Text(
                    model.title,
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Center(
                    child: Column(
                      children: [
                        Container(
                          child: Row(
                            children: [
                              FlatButton(
                                child: Text(
                                  '先に進める',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Color(0xff707070),
                                  ),
                                ),
                                color: Color(0xff5FABF6).withOpacity(0.57),
                                shape: StadiumBorder(
                                  side: BorderSide(
                                      color: Color(0xff707070), width: 1.5),
                                ),
                                onPressed: () async {
                                  course = 1;
                                  await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            LearnPage(textid, course),
                                        fullscreenDialog: true,
                                      ));
                                  Provider.of<CourseSelectModel>(context,
                                          listen: false)
                                      .initialize(textid);

                                  // await model.JagdeCourse(1);
                                },
                              ),
                              Text(
                                model.newPageList.length.toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Color(0xff707070),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              FlatButton(
                                child: Text(
                                  '復習をする',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Color(0xff707070),
                                  ),
                                ),
                                color: Color(0xff5FF669).withOpacity(0.57),
                                shape: StadiumBorder(
                                  side: BorderSide(
                                      color: Color(0xff707070), width: 1.5),
                                ),
                                onPressed: () async {
                                  course = 2;
                                  await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            LearnPage(textid, course),
                                        fullscreenDialog: true,
                                      ));
                                  Provider.of<CourseSelectModel>(context,
                                          listen: false)
                                      .initialize(textid);
                                },
                              ),
                              Text(
                                model.reviewPageList.length.toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Color(0xff707070),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              FlatButton(
                                child: Text(
                                  '課題を行う',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Color(0xff707070),
                                  ),
                                ),
                                color: Color(0xffF65F5F).withOpacity(0.57),
                                shape: StadiumBorder(
                                  side: BorderSide(
                                      color: Color(0xff707070), width: 1.5),
                                ),
                                onPressed: () async {
                                  course = 3;
                                  await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            LearnPage(textid, course),
                                        fullscreenDialog: true,
                                      ));
                                  Provider.of<CourseSelectModel>(context,
                                          listen: false)
                                      .initialize(textid);
                                },
                              ),
                              Text(
                                model.retakePageList.length.toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Color(0xff707070),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }),
          );
        },
      ),
    );
  }
}
