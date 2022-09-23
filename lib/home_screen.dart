import 'package:flutter/material.dart';
import 'package:manabiplus/learn/course_select_page.dart';
import 'package:manabiplus/result/result_list_page.dart';
import 'package:manabiplus/result/result_list_page_model.dart';
import 'package:manabiplus/option/option_page.dart';

import 'learn/text_select_page.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatefulWidget {
  /*HomeScreen(this.user);
   final User user;*/

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static List<Widget> _pageList = [
    TextSelectPage(),
    ResultListPage(),
    OptionPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
      body: _pageList[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            label: "学習",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.equalizer),
            label: "成果",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.build),
            label: "設定",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

/*class CustomPageLearn  extends StatelessWidget {
  /*final Color pannelColor;
  final String title;*/



  @override
  Widget build(BuildContext context) {
   // final titleTextStyle = Theme.of(context).textTheme.title;
    return Container(
      child: Center(
        child: Container(

        ),
      ),
    );
  }

}*/

/*class LearnList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //todo　質問　使えないの？\
      appBar: AppBar(
        title: Center(child: Text("学びPlus")),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Text(
              "本日の学習内容",
              style: TextStyle(
                fontSize: 30,
                color: Colors.grey,
                fontStyle: FontStyle.normal,
              ),
            ),
            RaisedButton(
              child: Text("ここにテキスト一覧を表示。データベースと連動が必要"),
              //todo　テキスト一覧ボタン
              onPressed: () {},
              highlightElevation: 16.0,
              highlightColor: Colors.blue,
              onHighlightChanged: (value) {},
            ),
            Expanded(
              child: Container(
                alignment: Alignment.bottomRight,
                color: Colors.green,
                 child: Row(
                   children: <Widget>[
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.edit),
                      color: Colors.blue,
                      iconSize: 20,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.equalizer),
                      color: Colors.grey,
                      iconSize: 20,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.build),
                      color: Colors.grey,
                      iconSize: 20,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      /*bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            title: Text("学習"),
          ),
          BottomNavigationBarItem(

            icon: Icon(Icons.equalizer),
            title: Text("成果"),

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.build),
            title: Text("設定"),
          ),
        ],
      ),*/
    );
  }
}*/
