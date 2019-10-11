import 'package:flutter/material.dart';

import 'package:isprime/home.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Is Prime',
      debugShowCheckedModeBanner:false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textSelectionColor: Color.fromRGBO(226, 22, 68, 1),
      ),
      home: MyHomePage(title: 'Is Prime'),
    );
  }
}