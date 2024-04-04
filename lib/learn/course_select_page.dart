import 'package:flutter/material.dart';
import 'package:manabiplus/learn/learn_page.dart';
import 'package:provider/provider.dart';

import 'course_select_page_model.dart';

// ignore: must_be_immutable
class CourseSelectPage extends StatelessWidget {
  CourseSelectPage(this.textid);
  final String textid;

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
                  // AdBanner(size: AdSize.banner),
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
                              TextButton(
                                child: Text(
                                  '先に進める',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Color(0xff707070),
                                  ),
                                ),
                                style: TextButton.styleFrom(
                                  backgroundColor:
                                      Color(0xff5FABF6).withOpacity(0.57),
                                  shape: StadiumBorder(
                                    side: BorderSide(
                                        color: Color(0xff707070), width: 1.5),
                                  ),
                                ),
                                onPressed: () async {
                                  final course = 1;
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
                              TextButton(
                                child: Text(
                                  '復習をする',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Color(0xff707070),
                                  ),
                                ),
                                style: TextButton.styleFrom(
                                  backgroundColor:
                                      Color(0xff5FF669).withOpacity(0.57),
                                  shape: StadiumBorder(
                                    side: BorderSide(
                                        color: Color(0xff707070), width: 1.5),
                                  ),
                                ),
                                onPressed: () async {
                                  final course = 2;
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
                              TextButton(
                                child: Text(
                                  '解きなおし',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Color(0xff707070),
                                  ),
                                ),
                                style: TextButton.styleFrom(
                                  backgroundColor:
                                      Color(0xffF65F5F).withOpacity(0.57),
                                  shape: StadiumBorder(
                                    side: BorderSide(
                                        color: Color(0xff707070), width: 1.5),
                                  ),
                                ),
                                onPressed: () async {
                                  final course = 3;
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
