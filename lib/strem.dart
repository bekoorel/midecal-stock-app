import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:poslite/stock.dart';

import 'database.dart';
import 'done.dart';

//....................................صرف..................................

var itemexiteid;
var itemexitename;
var itemexitecount;
var itemexitecode;
//.................................

fun(id, name, count, code) {
  itemexiteid = id;
  itemexitename = name;
  itemexitecount = count;
  itemexitecode = code;
}

//.............................................
Future out() async {
  int mins = int.parse(itemexitecount);
  if (mins > 0) {
    mins--;
    String countfinsh = mins.toString();

    var url = 'http://localhost:5050/exiteitem.php';
    var resubdata = await http.post(Uri.parse(url), body: {
      'id': itemexiteid,
      'itmename': itemexitename,
      'itemcount': countfinsh,
      'itemcode': itemexitecode,
    });
    Additemsexiteout();
  } else {
    donesucssfil = Icons.error;
    textdonesccss = 'عدد القطع في المخزن لهذا الصنف صفر';
    coloricondonesccss = Colors.red;
  }
}
//.................................................

//...........................................................
Future Additemsexiteout() async {
  var url = 'http://localhost:5050//additemexitout.php';
  var respons = await http.post(Uri.parse(url), body: {
    'id': idsuport2,
    'itemsnameout': itemexitename,
    'itemcountout': '1',
    'itemcodeout': itemexitecode,
  });
}
//.........................صرف...................................

//.....................مرتجع........................
Future out2() async {
  var url = 'http://localhost:5050/exititemindelet.php';
  var resubdata = await http.post(Uri.parse(url), body: {
    'id': itemexiteid.toString(),
  });
}
//.................................................

//...........................................................
Future Additemsexiteout2in2() async {
  var url = 'http://localhost:5050//additemsin.php';
  var respons = await http.post(Uri.parse(url), body: {
    'idin': idsuport2,
    'itemsnamein': itemexitename,
    'itemcountin': '1',
    'itemcodein': itemexitecode,
  });
}
//.........................مرتجع..............................

class strem extends StatefulWidget {
  const strem({Key? key}) : super(key: key);

  @override
  State<strem> createState() => _stremState();
}

class _stremState extends State<strem> {
  Color colorselect = Colors.white;
  //..................................................
  List les = [];
  Future getPostByIdsersh(entrycode) async {
    http.Response futurepost = await http
        .post(Uri.parse("http://localhost:5050/sershitme.php"), body: {
      'itemcode': entrycode,
    });
    if (futurepost.statusCode == 200) {
      print(futurepost.body); // الداتا الجيسون جت هنا

      List data = jsonDecode(futurepost.body);
      setState(() {
        les.addAll(data);
        _streamController.add(data);
      });
    } else {}
  }

//....................................................
//.............................................
  List lesin = [];
  Future getPostByIdsershin(entrycodein) async {
    http.Response futurepostin =
        await http.post(Uri.parse("http://localhost:5050/sershin.php"), body: {
      'itemcodeout': entrycodein,
    });
    if (futurepostin.statusCode == 200) {
      print(futurepostin.body); // الداتا الجيسون جت هنا

      List datain = jsonDecode(futurepostin.body);
      setState(() {
        lesin.addAll(datain);
        _streamController.add(datain);
      });
    } else {}
  }

//................................................................

  late StreamController<List<dynamic>> _streamController;
  late Stream<List<dynamic>> _stream;
  @override
  void initState() {
    super.initState();
    setState(() {
      _streamController = StreamController();
      _stream = _streamController.stream;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
                offset: Offset(10, 20), blurRadius: 10.0, color: Colors.grey)
          ]),
          height: 60.0,
          width: double.infinity,
          child: TextField(
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.teal),
            maxLines: 1,
            decoration: InputDecoration(
              label: Text(
                'ادخل المعامله',
                style: TextStyle(color: Colors.teal),
                textAlign: TextAlign.center,
              ),
            ),
            onChanged: (Value) {
              setState(() {
                if (swtshar) {
                  fun(null, null, null, null);
                  getPostByIdsersh(Value);
                } else {
                  fun(null, null, null, null);
                  getPostByIdsershin(Value);
                }
              });
            },
          ),
        ),
        StreamBuilder<List<dynamic>>(
            stream: _stream,
            builder: (stx, snp) {
              if (snp.hasData && swtshar == true) {
                return Column(
                  children: [
                    Container(
                      height: 70.0,
                      width: double.infinity,
                      child: ListView.builder(
                          itemCount: snp.data!.length,
                          itemBuilder: (context, i) {
                            fun(
                                snp.data![i]['id'].toString(),
                                snp.data![i]['itmename'],
                                snp.data![i]['itemcount'],
                                snp.data![i]['itemcode']);

                            return Container(
                                margin: EdgeInsets.all(2.0),
                                decoration: BoxDecoration(
                                    color: colorselect,
                                    boxShadow: [
                                      BoxShadow(
                                          offset: Offset(10, 20),
                                          blurRadius: 10.0,
                                          color: Colors.grey)
                                    ]),
                                width: double.infinity,
                                height: 60.0,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      child: Text(
                                        'اسم الصنف\n${snp.data![i]['itmename']}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.teal),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        'العدد\n${snp.data![i]['itemcount']}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.teal),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        'الكود\n${snp.data![i]['itemcode']}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.teal),
                                      ),
                                    ),
                                  ],
                                ));
                          }),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(10, 20),
                                blurRadius: 10.0,
                                color: Colors.redAccent)
                          ]),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white),
                        onPressed: () {},
                        child: Text(
                          'الغاء',
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0),
                        ),
                      ),
                    ),
                  ],
                );
              } else if (snp.hasData && swtshar == false) {
                return Column(
                  children: [
                    Container(
                      height: 70.0,
                      width: double.infinity,
                      child: ListView.builder(
                          itemCount: snp.data!.length,
                          itemBuilder: (context, i) {
                            fun(
                                snp.data![i]['id'].toString(),
                                snp.data![i]['itemsnameout'],
                                snp.data![i]['itemcountout'],
                                snp.data![i]['itemcodeout']);

                            return Container(
                                margin: EdgeInsets.all(2.0),
                                decoration: BoxDecoration(
                                    color: colorselect,
                                    boxShadow: [
                                      BoxShadow(
                                          offset: Offset(10, 20),
                                          blurRadius: 10.0,
                                          color: Colors.grey)
                                    ]),
                                width: double.infinity,
                                height: 60.0,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      child: Text(
                                        'اسم الصنف\n${snp.data![i]['itemsnameout']}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.teal),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        'العدد\n${snp.data![i]['itemcountout']}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.teal),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        'الكود\n${snp.data![i]['itemcodeout']}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.teal),
                                      ),
                                    ),
                                  ],
                                ));
                          }),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(10, 20),
                                blurRadius: 10.0,
                                color: Colors.redAccent)
                          ]),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white),
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/clinc', (route) => false);
                        },
                        child: Text(
                          'الغاء',
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0),
                        ),
                      ),
                    ),
                  ],
                );
              }
              return LinearProgressIndicator(
                backgroundColor: Colors.grey,
                color: Colors.white,
                value: 0.0,
              );
            }),
      ],
    );
  }
}
