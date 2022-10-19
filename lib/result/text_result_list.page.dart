import 'package:flutter/material.dart';
import 'package:manabiplus/result/result_to_learn_page.dart';
import 'package:manabiplus/result/text_result_list_model.dart';
import 'package:manabiplus/result/unit_result_page.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:flutter/src/material/data_table.dart';

class TextResultListPage extends StatefulWidget {
  TextResultListPage(this.textid);
  String textid;

  @override
  _TextResultListPageState createState() => _TextResultListPageState();
}

class _TextResultListPageState extends State<TextResultListPage> {
  DateFormat outputFormat = DateFormat('MM月dd日');

  var _isAscending = false;

  var _currentSortColumn = 0;

  int page;

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
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: ChangeNotifierProvider(
          create: (_) => textResultListPageModel()..getPages(widget.textid),
          child: Consumer<textResultListPageModel>(
            builder: (context, model, child) {
              final double devicewidth = MediaQuery.of(context).size.width;
              final double deviceHeight = MediaQuery.of(context).size.height;
              List<DataRow> _list = List.generate(
                model.pages.length,
                (index) {
                  return DataRow(
                    cells: [
                      DataCell(
                        Container(
                          width: devicewidth * 0.075,
                          child: GestureDetector(
                            child: Text(model.pages[index].isPage.toString()),
                            onTap: () async {
                              page = model.pages[index].isPage;
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      resultToLearnPage(widget.textid, page),
                                  //todo 繊維方法
                                  fullscreenDialog: true,
                                ),
                              );
                              Provider.of<textResultListPageModel>(context,
                                      listen: false)
                                  .getPages(widget.textid);
                            },
                          ),
                        ),
                      ),
                      DataCell(Text(model.pages[index].rank.toString())),
                      DataCell(
                        Text(model.pages[index].lastStudy == null
                            ? ''
                            : outputFormat
                                .format(model.pages[index].lastStudy.toDate())),
                      ),
                      DataCell(
                        Text(model.pages[index].nextDay == null
                            ? ''
                            : outputFormat
                                .format(model.pages[index].nextDay.toDate())),
                      ),
                      DataCell(Text(model.pages[index].state.toString())),
                      DataCell(
                        // Text(model.pages[index].studyTimes.toString())
                        Text(model.pages[index].studyTimes == null
                            ? '0'
                            : (model.pages[index].studyTimes.toString())),
                      ),
                      DataCell(
                        Text(model.pages[index].isRetake.toString()),
                      ),
                      DataCell(
                        Text(model.pages[index].item1.toString()),
                      ),
                      DataCell(
                        Text(model.pages[index].item2.toString()),
                      ),
                    ],
                  );
                },
              );
              final pages = model.pages;

              return SingleChildScrollView(
                child: DataTable(
                  sortColumnIndex: _currentSortColumn,
                  sortAscending: _isAscending,
                  columns: [
                    DataColumn(
                        label: Text('ページ数'),
                        onSort: (columnIndex, isAscendin) {
                          setState(() {
                            sortTable(columnIndex, pages, 'isPage');
                          });
                        }),
                    DataColumn(
                        label: Text('理解レベル'),
                        onSort: (columnIndex, isAscendin) {
                          setState(() {
                            sortTable(columnIndex, pages, 'rank');
                          });
                        }),
                    DataColumn(
                        label: Text('最終学習日'),
                        onSort: (columnIndex, isAscendin) {
                          setState(() {
                            sortTable(columnIndex, pages, 'lastStudy');
                          });
                        }),
                    DataColumn(
                        label: Text('次回学習日'),
                        onSort: (columnIndex, isAscendin) {
                          setState(() {
                            sortTable(columnIndex, pages, 'nextDay');
                          });
                        }),
                    DataColumn(
                        label: Text('状態'),
                        onSort: (columnIndex, isAscendin) {
                          setState(() {
                            sortTable(columnIndex, pages, 'state');
                          });
                        }),
                    DataColumn(
                        label: Text('学習回数'),
                        onSort: (columnIndex, isAscendin) {
                          setState(() {
                            sortTable(columnIndex, pages, 'isStudyTimes');
                          });
                        }),
                    DataColumn(
                      label: Text('課題'),
                    ),
                    DataColumn(
                      label: Text('項目１'),
                    ),
                    DataColumn(
                      label: Text('項目２'),
                    ),
                  ],
                  rows: _list,
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  sortTable(int columnIndex, List<PagesModel> pages, String dataName) {
    _currentSortColumn = columnIndex;
    int result;
    if (_isAscending == true) {
      _isAscending = false;
      switch (dataName) {
        case 'isPage':
          pages.sort((a, b) => b.isPage.compareTo(a.isPage));
          break;
        case 'rank':
          pages.sort((a, b) => b.rank.compareTo(a.rank));
          break;
        case 'lastStudy':
          pages.sort((a, b) {
            if (a.lastStudy == null) {
              result = 1;
            } else if (b.lastStudy == null) {
              result = -1;
            } else {
              // Ascending Order
              result = b.lastStudy.compareTo(a.lastStudy);
            }
            return result;
          });
          break;
        case 'nextDay':
          pages.sort((a, b) {
            if (a.nextDay == null) {
              result = 1;
            } else if (b.nextDay == null) {
              result = -1;
            } else {
              // Ascending Order
              result = b.nextDay.compareTo(a.nextDay);
            }
            return result;
          });
          break;
        case 'state':
          pages.sort((a, b) => b.state.compareTo(a.state));
          break;
        case 'isStudyTimes':
          pages.sort((a, b) => b.studyTimes.compareTo(a.studyTimes));
          break;
        default:
          break;
      }
    } else {
      _isAscending = true;
      switch (dataName) {
        case 'isPage':
          pages.sort((a, b) => a.isPage.compareTo(b.isPage));
          break;
        case 'hogehoge':
          pages.sort((a, b) => a.rank.compareTo(b.rank));
          break;
        case 'lastStudy':
          pages.sort((a, b) {
            if (b.lastStudy == null) {
              result = -1;
            } else if (a.lastStudy == null) {
              result = 1;
            } else {
              // Ascending Order
              result = a.lastStudy.compareTo(b.lastStudy);
            }
            return result;
          });
          break;
        case 'nextDay':
          pages.sort((a, b) {
            if (b.nextDay == null) {
              result = -1;
            } else if (a.nextDay == null) {
              result = 1;
            } else {
              // Ascending Order
              result = a.nextDay.compareTo(b.nextDay);
            }
            return result;
          });
          break;
        case 'state':
          pages.sort((a, b) => a.state.compareTo(b.state));
          break;
        case 'isStudyTimes':
          pages.sort((a, b) => a.studyTimes.compareTo(b.studyTimes));
          break;
        default:
          break;
      }
    }
  }
}
