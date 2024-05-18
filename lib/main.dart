import 'package:flutter/material.dart';
import 'package:poslite/pos.dart';
import 'package:poslite/printpos.dart';
import 'package:poslite/providr.dart';
import 'package:poslite/stock.dart';

import 'done.dart';
import 'hiscustmer2.dart';
import 'login.dart';
import 'printusb2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: printpos(),
      initialRoute: "/clinc",
      routes: {
        "/login": (context) => login(),
        "/clinc": (context) => clinc(),
        "/form2": (context) => form2(),
        "/print2": (context) => printcode2('طباعه تقرير حاله'),
        "/done": (context) => done(),
        "/pos": (context) => pos(),
      },
    );
  }
}
