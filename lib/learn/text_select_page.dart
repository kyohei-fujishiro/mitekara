import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:manabiplus/learn/course_select_page_model.dart';
import 'package:manabiplus/learn/text_select_page_model.dart';
import 'package:manabiplus/text_entry.dart';
import 'package:provider/provider.dart';

import 'course_select_page.dart';

class TextSelectPage extends StatelessWidget {
  int textindex = 0;
  String textid = '';
  @override
  Widget build(BuildContext context) {
    print('build');
    final double devicewidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;
    TextSelectPageModel textSelectPageModel;
    return Scaffold(
      body: FutureBuilder(
        future:
            Provider.of<TextSelectPageModel>(context, listen: false).GetText(),
        builder: (context, dataSnapshot) {
          // 非同期処理未完了 = 通信中
          if (dataSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return Consumer<TextSelectPageModel>(
            builder: (context, model, child) {
              textSelectPageModel = model;
              return Container(
                width: double.infinity,
                child: GridView.count(
                  crossAxisCount: 2,
                  children: List.generate(
                    model.titleList.length,
                    (index) {
                      return Center(
                          child: FlatButton(
                        child: Column(
                          children: [
                            Container(
                              width: devicewidth * 0.4,
                              height: deviceHeight * 0.045,
                              child: FittedBox(
                                fit: BoxFit.contain,
                                child: Text(
                                  // '適当',
                                  model.titleList[index],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    // fontSize: 20,
                                    color: Color(0xff707070),
                                  ),
                                ),
                              ),
                            ),
                            () {
                              if (model.imageList[index] == null) {
                                //画像処理
                                return Container(
                                  width: devicewidth * 0.32,
                                  height: deviceHeight * 0.15,
                                  color: Colors.white,
                                  child: Center(
                                    child: Text("No Image",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25,
                                        )),
                                  ),
                                );
                              } else {
                                return Container(
                                  width: devicewidth * 0.32,
                                  height: deviceHeight * 0.15,
                                  child: FittedBox(
                                      fit: BoxFit.contain,
                                      child: Image.network(
                                          model.imageList[index])),
                                );
                              }
                            }(),
                          ],
                        ),
                        onPressed: () async {
                          textindex = index;
                          textid = model.textIdList[textindex];
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CourseSelectPage(textid),
                                fullscreenDialog: true,
                              ));
                        },
                        onLongPress: () {
                          textindex = index;
                          textid = model.textIdList[textindex];
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('一度消去したらこのテキストのデータは完全に消えます'),
                                content: Text('このテキストを消去しますか？'),
                                actions: <Widget>[
                                  FlatButton(
                                    child: Text("CANCEL"),
                                    onPressed: () => Navigator.pop(context),
                                  ),
                                  FlatButton(
                                      child: Text("OK"),
                                      onPressed: () async {
                                        await model.DeleteText(textid);
                                        await model.GetText();
                                        await Navigator.pop(context);
                                      }),
                                ],
                              );
                            },
                          );
                        },
                      ));
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.of(context).push(
            MaterialPageRoute<bool>(builder: (context) {
              return TextEntryPage();
            }),
          );
          if (result) {
            await textSelectPageModel.GetText();
            print('result');
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
