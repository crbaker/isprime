import 'package:flutter/material.dart';
import 'package:isprime/divisors.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _testing = false;

  var _image = "images/Question.png";
  var _bgColor = Color.fromRGBO(19, 153, 207, 1);

  var _latestResult = List<int>();
  int _latestNumber = 0;

  var _message = "";

  final _primeNumberTextController = TextEditingController();

  void _performCheck(int number) {
    FocusScope.of(context).requestFocus(FocusNode());

    setState(() {
      _latestResult = _checkPrimality(number);
      _latestNumber = number;

      var _isPrime = _latestResult.length == 0;

      _image = _isPrime ? "images/Check.png" : "images/Cross.png";

      _bgColor = _isPrime
          ? Color.fromRGBO(5, 198, 174, 1)
          : Color.fromRGBO(232, 52, 88, 1);

      _message = _isPrime
          ? "The number $number is prime"
          : "The number $number is not prime";
    });
  }

  List<int> _checkPrimality(int number) {
    var divisors = List<int>();

    if (number <= 1) {
      divisors.add(0);
    } else if (number < 3) {
    } else {
      var i = 2;
      _testing = true;

      while ((i < number) && (_testing)) {
        if ((number % i) == 0) {
          divisors.add(i);
        }
        i++;
      }
      _testing = false;
    }

    return divisors;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgColor,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding (
            padding: EdgeInsets.all(16.0),
            child: Column (
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(bottom: 20),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    controller: _primeNumberTextController,
                    style: TextStyle(fontSize: 50),
                  ),
                ),
                ButtonTheme(
                  minWidth: 200,
                  child: OutlineButton(
                      onPressed: () {
                        _performCheck(
                            int.parse(_primeNumberTextController.text));
                      },
                      child: Text("Test", style: TextStyle(fontSize: 20)),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      textColor: Colors.white,
                      padding: EdgeInsets.all(10)),
                ),
                new CirclesWidget(image: _image),
                Container(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(
                    "$_message",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Visibility(
                  visible: _latestResult.length != 0,
                    child: ButtonTheme(
                  minWidth: 200,
                  child: OutlineButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DivisorsPage(
                                      number: _latestNumber,
                                      divisors: _latestResult,
                                    )));
                      },
                      child:
                          Text("View Divisors", style: TextStyle(fontSize: 20)),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      textColor: Colors.white,
                      padding: EdgeInsets.all(10)),
                )),
              ],
            )),
    );
  }
}

class CirclesWidget extends StatelessWidget {
  const CirclesWidget({
    Key key,
    @required String image,
  }) : _image = image, super(key: key);

  final String _image;

  @override
  Widget build(BuildContext context) {
    return Container (
      alignment: Alignment.center,
      padding: EdgeInsets.only(left: 50, right: 50),
      constraints: BoxConstraints.expand(height: 150),
      decoration: BoxDecoration (
          image: DecorationImage(
              image: AssetImage("images/Circles@3x.png"),
              fit: BoxFit.contain)),
      child: Center (
        child: Image.asset(_image,
        width: 50,),
      ),
    );
  }
}
