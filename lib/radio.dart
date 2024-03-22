import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Radiotest extends StatefulWidget {
  @override
  _ChangeFormState createState() => _ChangeFormState();
}

class _ChangeFormState extends State<Radiotest> {
  String _type = '';

  void _handleRadio(String? e) => setState(() {
        _type = e ?? '';
      });

  IconData _changeIcon(String e) {
    IconData? icon = null;
    switch (e) {
      case 'thumb_up':
        icon = Icons.thumb_up;
        break;
      case 'favorite':
        icon = Icons.favorite;
        break;
      default:
        icon = Icons.thumb_up;
    }
    return icon;
  }

  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          children: <Widget>[
            Center(
              child: new Icon(
                _changeIcon(_type),
                color: Colors.orange[700],
                size: 100.0,
              ),
            ),
            new Radio(
              activeColor: Colors.blue,
              value: 'thumb_up',
              groupValue: _type,
              onChanged: _handleRadio,
            ),
            new Radio(
              activeColor: Colors.orange,
              value: 'favorite',
              groupValue: _type,
              onChanged: _handleRadio,
            ),
          ],
        ));
  }
}
