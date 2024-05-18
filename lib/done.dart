import 'package:flutter/material.dart';

var donesucssfil = Icons.done;
var textdonesccss = 'تم الصرف';
var coloricondonesccss = Colors.green;

class done extends StatefulWidget {
  const done({Key? key}) : super(key: key);

  @override
  State<done> createState() => _doneState();
}

class _doneState extends State<done> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Icon(
              donesucssfil,
              color: coloricondonesccss,
              size: 400.0,
            ),
          ),
          Text(
            textdonesccss,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
          ),
          Spacer(),
          SizedBox(
            height: 20.0,
          ),
          Container(
              height: 50.0,
              width: double.infinity,
              child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  child: Text(
                    'الصفحه الرئيسيه',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  onPressed: () {
                    setState(() {
                      Navigator.of(context)
                          .pushNamedAndRemoveUntil("/clinc", (route) => false);
                    });
                  })),
          Spacer(),
        ],
      ),
    );
  }
}
