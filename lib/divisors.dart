import 'package:flutter/material.dart';

class DivisorsPage extends StatefulWidget {
  final List<int> divisors;
  final int number;

  DivisorsPage({Key key, @required this.number, @required this.divisors})
      : super(key: key);

  @override
  _DivisorsPageState createState() =>
      _DivisorsPageState(this.number, this.divisors);
}

class _DivisorsPageState extends State<DivisorsPage> {
  List<int> _divisors;
  String _message;
  int _number;

  _DivisorsPageState(int number, List<int> divisors) {
    this._divisors = divisors;
    this._number = number;
    var count = divisors.length;

    _message = "$count factor(s) of $number";
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> buildTextWidgets(int number, List<int> divisors) {
      return divisors.map((d) {
        var dividend = (number / d).round();

        return RichText(
          textAlign: TextAlign.right,
          text: TextSpan(
              style: TextStyle(color: Colors.white),
              children: <TextSpan>[
                TextSpan(text: "$d", style: TextStyle(fontSize: 60)),
                TextSpan(text: "x$dividend", style: TextStyle(fontSize: 20))
              ]),
        ) as Widget;
      }).toList();
    }

    var widgets = buildTextWidgets(_number, _divisors);

    widgets.add(ButtonTheme(
      minWidth: 200,
      child: FlatButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Done", style: TextStyle(fontSize: 30)),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          textColor: Colors.white,
          padding: EdgeInsets.all(10)),
    ));

    return Scaffold(
      appBar: AppBar(title: Text(_message)),
      backgroundColor: Color.fromRGBO(232, 52, 88, 1),
      body: Container(
          child: Padding(
              padding: EdgeInsets.all(20),
              child: ListView(
                children: widgets,
              ))),
    );
  }
}