import 'package:flutter/material.dart';
import 'package:poslite/printusb.dart';

import 'database.dart';

import 'package:barcode_widget/barcode_widget.dart';

var bar;
var bartext;

TextEditingController itemenameadd = TextEditingController();
TextEditingController itemecountadd = TextEditingController();
TextEditingController itemecodeadd = TextEditingController();

class stock3 extends StatefulWidget {
  const stock3({Key? key}) : super(key: key);

  @override
  State<stock3> createState() => _stock3State();
}

class _stock3State extends State<stock3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Row(
      children: [
        Spacer(),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.exit_to_app),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    offset: Offset(10, 20),
                    blurRadius: 10.0,
                    color: Colors.grey)
              ]),
              alignment: Alignment.topRight,
              height: 50.0,
              width: 800.0,
              child: TextField(
                  onChanged: (value) {
                    setState(() {});
                  },
                  enabled: true,
                  controller: itemenameadd,
                  maxLines: 1,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.pink),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    label: Text(
                      'اسم الصنف',
                      style: TextStyle(color: Colors.teal),
                      textAlign: TextAlign.center,
                    ),
                  )),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    offset: Offset(10, 20),
                    blurRadius: 10.0,
                    color: Colors.grey)
              ]),
              alignment: Alignment.topRight,
              height: 50.0,
              width: 800.0,
              child: TextField(
                  onChanged: (value) {},
                  enabled: true,
                  controller: itemecountadd,
                  maxLines: 1,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.pink),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    label: Text(
                      'العدد',
                      style: TextStyle(color: Colors.teal),
                      textAlign: TextAlign.center,
                    ),
                  )),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    offset: Offset(10, 20),
                    blurRadius: 10.0,
                    color: Colors.grey)
              ]),
              alignment: Alignment.topRight,
              height: 50.0,
              width: 800.0,
              child: TextField(
                  onChanged: (value) {
                    setState(() {});
                  },
                  enabled: true,
                  controller: itemecodeadd,
                  maxLines: 1,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.pink),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    label: Text(
                      'الكود',
                      style: TextStyle(color: Colors.teal),
                      textAlign: TextAlign.center,
                    ),
                  )),
            ),

            /* a(70.0, 800.0, 'اسم الصنف', itemenameadd, true),
            a(70.0, 800.0, 'عدد القطع', itemecountadd, true),
            a(70.0, 800.0, 'الكود', itemecodeadd, true),*/
            Container(
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.white,
                  boxShadow: [
                    const BoxShadow(
                        offset: Offset(1, 20),
                        blurRadius: 15.0,
                        color: Colors.grey)
                  ]),
              height: 50.0,
              width: 400.0,
              child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  child: const Text(
                    'اضافه',
                    style: const TextStyle(color: Colors.teal, fontSize: 30),
                  ),
                  onPressed: () {
                    Additems();
                    Navigator.of(context).pop();
                  }),
            ),
            Container(
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.white,
                  boxShadow: [
                    const BoxShadow(
                        offset: Offset(1, 20),
                        blurRadius: 15.0,
                        color: Colors.grey)
                  ]),
              height: 50.0,
              width: 400.0,
              child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  child: Text(
                    'اضافه وطباعه',
                    style: const TextStyle(color: Colors.pink, fontSize: 30),
                  ),
                  onPressed: () {
                    bar = itemecodeadd.text;
                    bartext = itemenameadd.text;

                    Additems();
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return printcode('PRINT CODE');
                    }));
                  }),
            ),
          ],
        ),
        Spacer(),
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40.0),
              color: Colors.white,
              boxShadow: [
                const BoxShadow(
                    offset: Offset(1, 1), blurRadius: 20.0, color: Colors.grey)
              ]),
          height: 250.0,
          width: 500.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                itemenameadd.text,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              BarcodeWidget(
                  width: 350.0,
                  height: 100.0,
                  data: itemecodeadd.text,
                  style: TextStyle(fontWeight: FontWeight.bold),
                  barcode: Barcode.code128()),
            ],
          ),
        ),
        Spacer(),
      ],
    )));
  }
}
