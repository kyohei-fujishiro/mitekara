import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:manabiplus/option/option_account.dart';
import 'package:manabiplus/option/option_model.dart';
import 'package:manabiplus/option/option_text.dart';
import 'package:manabiplus/option/withdrawal_page.dart';
import 'package:manabiplus/sinup/user_info_page.dart';
import 'package:manabiplus/sinup/sinup_page.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class OptionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<OptionModel>(
      create: (_) => OptionModel(),
      child: Scaffold(
        body: Container(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Column(
                children: <Widget>[
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 20.0),
                  //   child: FlatButton(
                  //     child: Text(
                  //       '教材設定',
                  //       style: TextStyle(
                  //           fontSize: 17.0,
                  //           color: Color(0xff707070),
                  //           fontFamily: 'Material',
                  //           fontWeight: FontWeight.bold),
                  //     ),
                  //     onPressed: () {
                  //       Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //           builder: (context) => TextOption(), //todo 繊維方法
                  //           fullscreenDialog: true,
                  //         ),
                  //       );
                  //     },
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child:
                        Consumer<OptionModel>(builder: (context, model, child) {
                      return TextButton(
                        child: Text(
                          'アカウント設定',
                          style: TextStyle(
                              fontSize: 17.0,
                              color: Color(0xff707070),
                              fontFamily: 'Material',
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UserIn(), //todo 遷移方法
                              fullscreenDialog: true,
                            ),
                          );
                        },
                      );
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: TextButton(
                        child: Text(
                          'ログアウト',
                          style: TextStyle(
                              fontSize: 17.0,
                              color: Color(0xff707070),
                              fontFamily: 'Material',
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: () async {
                          FirebaseAuth.instance.signOut();
                          await Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) {
                              return LoginPage();
                            }),
                          );
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: TextButton(
                        child: Text(
                          '退会(アカウント削除)',
                          style: TextStyle(
                              fontSize: 17.0,
                              color: Color(0xff707070),
                              fontFamily: 'Material',
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: () async {
                          await Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) {
                              return WithdrawalPage();
                            }),
                          );
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child:
                        Consumer<OptionModel>(builder: (context, model, child) {
                      return TextButton(
                        child: Text(
                          'ご利用規約',
                          style: TextStyle(
                              fontSize: 17.0,
                              color: Color(0xff707070),
                              fontFamily: 'Material',
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          model.launchUrl();
                        },
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ); //todo コメントアウト
  }
}
