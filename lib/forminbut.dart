import 'package:flutter/material.dart';
import 'package:poslite/stock.dart';

import 'database.dart';
import 'done.dart';

TextEditingController fullname = TextEditingController();
TextEditingController numbarphone = TextEditingController();
TextEditingController whats = TextEditingController();
TextEditingController adress = TextEditingController();
TextEditingController age = TextEditingController();
TextEditingController docnum = TextEditingController();
TextEditingController eror = TextEditingController();
TextEditingController scane = TextEditingController();
TextEditingController thisday = TextEditingController();
TextEditingController completprise = TextEditingController();
TextEditingController newday = TextEditingController();
var alarm;
var alarmtext = '';

class rorminput extends StatefulWidget {
  const rorminput({Key? key}) : super(key: key);

  @override
  State<rorminput> createState() => _rorminputState();
}

class _rorminputState extends State<rorminput> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(100.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 15.0,
              ),
              a(50.0, double.infinity, 'الاسم بالكامل', fullname, true),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: a(50.0, 0.0, 'واتس اب', whats, true),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    flex: 1,
                    child: a(50.0, 0.0, 'رقم التلفون', numbarphone, true),
                  ),
                ],
              ),
              a(50.0, double.infinity, 'العنوان', adress, true),
              a(50.0, double.infinity, 'السن', age, true),
              a(50.0, double.infinity, 'اسم الطبيب', docnum, true),
              Text(
                '?ما هي الشكوي الرئيسيه',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.teal),
              ),
              a(50.0, double.infinity, 'ماهي الشكوي الرئيسيه', eror, true),
              a(200.0, double.infinity, 'التشخيص', scane, true),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: a(50.0, 0.0, 'الموعد القادم', thisday, true),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    flex: 1,
                    child: a(50.0, 0.0, 'المدفوع', completprise, true),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    flex: 1,
                    child: a(50.0, 0.0, 'اليوم', newday, true),
                  ),
                ],
              ),
              Container(
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                        offset: Offset(1, 20),
                        blurRadius: 15.0,
                        color: Colors.green)
                  ]),
                  height: 50.0,
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white),
                      child: Text(
                        'ENTER',
                        style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 40),
                      ),
                      onPressed: () {
                        textdonesccss = 'تم فتح ملف حاله';
                        AddData();
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (Context) {
                          return done();
                        }));
                      })),
            ],
          ),
        )),
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 50.0,
          color: alarm,
          child: Text(
            '$alarmtext',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        IconButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (Context) {
              return clinc();
            }));
          },
          icon: Icon(
            Icons.exit_to_app,
            color: Colors.teal,
            size: 40,
          ),
        ),
      ],
    ));
  }
}

a(height, width, text, entry, lock) {
  return Container(
    margin: EdgeInsets.all(2.0),
    decoration: BoxDecoration(color: Colors.white, boxShadow: [
      BoxShadow(offset: Offset(10, 20), blurRadius: 10.0, color: Colors.grey)
    ]),
    alignment: Alignment.topRight,
    height: height,
    width: width,
    child: TextField(
        enabled: lock,
        controller: entry,
        maxLines: null,
        expands: true,
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 15, color: Colors.pink),
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          label: Text(
            text,
            style: TextStyle(color: Colors.teal),
            textAlign: TextAlign.center,
          ),
        )),
  );
}
