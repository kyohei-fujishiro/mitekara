import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:manabiplus/firebase_options.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:manabiplus/learn/course_select_page_model.dart';
import 'package:manabiplus/learn/learn_model.dart';
import 'package:manabiplus/learn/text_select_page_model.dart';
import 'package:manabiplus/option/option_model.dart';
import 'package:manabiplus/result/result_list_page_model.dart';
import 'package:manabiplus/result/result_to_learn_page_model.dart';
import 'package:manabiplus/result/text_result_list_model.dart';
import 'package:manabiplus/sinup/sinup_page.dart';
import 'package:manabiplus/text_entry_moel..dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';

var _version = "";
var _newVersion = '';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final snapshot = await FirebaseFirestore.instance
      .collection('master')
      .doc('version')
      .get();
  final packageInfo = await PackageInfo.fromPlatform();
  _version = packageInfo.version;
  print("_version = $_version"); // バージョン情報を出力する
  _newVersion = snapshot.data()?['data'] ?? [];
  print("_newVersion = $_newVersion"); // バージョン情報を出力する

  // MobileAds.instance.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your applicaƒtion.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LearnModel()),
        ChangeNotifierProvider(create: (context) => CourseSelectModel()),
        ChangeNotifierProvider(create: (context) => TextSelectPageModel()),
        ChangeNotifierProvider(create: (context) => resultListPageModel()),
        ChangeNotifierProvider(create: (context) => textResultListPageModel()),
        ChangeNotifierProvider(create: (context) => resultToLearnPageModel()),
        ChangeNotifierProvider(create: (context) => OptionModel()),
        ChangeNotifierProvider(create: (context) => TextEntryModel()),
      ],
      child: MaterialApp(
        title: 'ミテカラ',
        theme: ThemeData(
          primarySwatch: Colors.green,
          //Family:,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/',
        routes: <String, WidgetBuilder>{
          '/': (BuildContext context) => _version.compareTo(_newVersion) == -1
              ? Scaffold(
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
                  body: Center(child: Text('ストア画面からアップデートをお願いします')),
                )
              : LoginPage(),
        },
      ),
    );
  }
}
