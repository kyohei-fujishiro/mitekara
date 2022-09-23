import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:manabiplus/learn/course_select_page_model.dart';
import 'package:manabiplus/learn/learn_model.dart';
import 'package:manabiplus/learn/text_select_page_model.dart';
import 'package:manabiplus/option/option_model.dart';
import 'package:manabiplus/result/result_list_page_model.dart';
import 'package:manabiplus/result/result_to_learn_page_model.dart';
import 'package:manabiplus/result/text_result_list_model.dart';
import 'package:manabiplus/sinup/sinup_page.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Firebase
  await Firebase.initializeApp();
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
          '/': (BuildContext context) => LoginPage(),
        },
      ),
    );
  }
}
