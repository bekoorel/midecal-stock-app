import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class addusar extends StatefulWidget {
  const addusar({Key? key}) : super(key: key);

  @override
  State<addusar> createState() => _addusarState();
}

class _addusarState extends State<addusar> {
  //..........................................
  var usarlist;
  var passlist;
  //.....
  var custmracss;
  var historyacss;
  var stocacss;
  var additmsacss;
  //..............................
  var custmracssbool;
  var historyacssbool;
  var stocacssbool;
  var additmsacssbool;
  //..............................
  Future Addusarnew() async {
    String idsuportusar = '';
    var url = 'http://localhost:5050//addusarnew.php';
    var respons = await http.post(Uri.parse(url), body: {
      'id': idsuportusar,
      'usarlist': usarlist,
      'passlist': passlist,
      'custmracss': custmracss,
      'historyacss': historyacss,
      'stocacss': stocacss,
      'additmsacss': additmsacss,
    });
  }

//......................................................
  var top;
  List lesusaracss = [];
  Future getPostByusaracss() async {
    http.Response futurepostusaracss =
        await http.get(Uri.parse("http://localhost:5050/index4.php"));
    if (futurepostusaracss.statusCode == 200) {
      List datausaracss = jsonDecode(futurepostusaracss.body);
      setState(() {
        lodingprogres = 0.6;
        lesusaracss.addAll(datausaracss);
        _streamController1.add(datausaracss);

        top = true;
      });

      lodingprogres = 0.0;
    }
  }

//...................................
  late StreamController<List<dynamic>> _streamController1;
  late Stream<List<dynamic>> _stream1;
  @override
  void initState() {
    super.initState();
    setState(() {
      getPostByusaracss();

      _streamController1 = StreamController();
      _stream1 = _streamController1.stream;
    });
  }

  double lodingprogres = 0.0;
  //.................................
  var snap_custmracss;
  var snap_historyacss;
  var snap_stocacss;
  var snap_additmsacss;
  //.................................................
  Future updatachek(String id, String usarfun, String pass, String adcus,
      String hiscas, String stock, String passaddit) async {
    var url = 'http://localhost:5050//updateacss.php';
    var respons = await http.post(Uri.parse(url), body: {
      'id': id,
      'usarlist': usarfun,
      'passlist': pass,
      'custmracss': adcus,
      'historyacss': hiscas,
      'stocacss': stock,
      'additmsacss': passaddit,
    });

    if (respons.statusCode == 200) {
      lodingprogres = 0.3;
      getPostByusaracss();
    }
    if (respons.body == "doneout") {
      lodingprogres = 0.5;
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<dynamic>>(
        stream: _stream1,
        builder: (stx, snp) {
          if (snp.hasData && top == true) {
            /* pross() {
              if (snap_custmracss == '0') {
                custmracssbool = false;
                custmracss = '0';
                print('انا هنا في الفولس${snap_custmracss.runtimeType}');
              } else if (snap_custmracss == '1') {
                print('انا هنا في ياض س${snap_custmracss.runtimeType}');
                custmracssbool = true;
                custmracss = '1';
              }

              //////////////////////////////
              if (snap_historyacss == 0) {
                historyacssbool = false;
                historyacss = '0';
              } else {
                historyacssbool = true;
                historyacss = '1';
              }
              //////////////////////////////
              if (snap_stocacss == 0) {
                stocacssbool = false;
                stocacss = '0';
              } else {
                stocacssbool = true;
                stocacss = '1';
              }
              //////////////////////////////

              if (snap_additmsacss == 0) {
                additmsacssbool = false;
                additmsacss = '0';
              } else {
                additmsacssbool = true;
                additmsacss = '1';
              }

              //..................................................
            }*/

            //111111111111111111111111111111111111111111111

            Future deletDatausar(deletidusar) async {
              var url = 'http://localhost:5050/delteusar.php';
              var resout4 = await http.post(Uri.parse(url), body: {
                'id': deletidusar.toString(),
              });
              if (resout4.statusCode == 200) {
                getPostByusaracss();
              } else {
                print('حدث خطا اثناء الحذف');
              }
            }

            return AlertDialog(
                content: Container(
              height: 800.0,
              width: 900.0,
              child: Column(
                children: [
                  LinearProgressIndicator(
                    backgroundColor: Colors.white,
                    value: lodingprogres,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(1, 3),
                                    blurRadius: 5.0,
                                    color: Colors.black)
                              ]),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white),
                              onPressed: () {
                                Addusarnew();
                                getPostByusaracss();
                              },
                              child: Text('اضافه')),
                        ),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                            height: 40.0,
                            child: TextField(
                              onChanged: (Value) {
                                passlist = Value;
                              },
                              decoration:
                                  InputDecoration(labelText: 'كلمه المرور'),
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                            height: 40.0,
                            child: TextField(
                              onChanged: (Value) {
                                usarlist = Value;
                              },
                              decoration:
                                  InputDecoration(labelText: 'اسم المستخدم'),
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    height: 700.0,
                    width: double.infinity,
                    child: ListView.builder(
                        itemCount: snp.data!.length,
                        itemBuilder: (context, index) {
                          //.............................................
                          if (top == true) {
                            snap_custmracss =
                                snp.data![index]['custmracss'].toString();

                            snap_historyacss =
                                snp.data![index]['historyacss'].toString();
                            snap_stocacss =
                                snp.data![index]['stocacss'].toString();
                            snap_additmsacss =
                                snp.data![index]['additmsacss'].toString();
                            /* pross();*/
                          }

                          //..........................................

                          return Container(
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(1, 5),
                                      blurRadius: 5.0,
                                      color: Colors.black)
                                ]),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    /*  IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.done,
                                          color: Colors.green,
                                        )),*/
                                    IconButton(
                                        onPressed: () {
                                          deletDatausar(snp.data![index]['id']);
                                        },
                                        icon: Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        )),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                          margin: EdgeInsets.all(2),
                                          height: 40.0,
                                          child: TextField(
                                            enabled: false,
                                            decoration: InputDecoration(
                                                hintText:
                                                    '${snp.data![index]['passlist']}'),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          )),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                          margin: EdgeInsets.all(2),
                                          height: 40.0,
                                          child: TextField(
                                            enabled: false,
                                            decoration: InputDecoration(
                                                hintText:
                                                    '${snp.data![index]['usarlist']}'),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          )),
                                    ),
                                  ],
                                ),
                                //......................................

                                /* Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    //..............صلاحيه اضافه عميل
                                    Container(
                                      child: Row(
                                        children: [
                                          Text('اضافه عميل'),
                                          Checkbox(
                                              value: custmracssbool,
                                              onChanged: (Value) {
                                                if (custmracssbool == true) {
                                                  updatachek(
                                                      snp.data![index]['id']
                                                          .toString(),
                                                      snp.data![index]
                                                              ['usarlist']
                                                          .toString(),
                                                      snp.data![index]
                                                              ['passlist']
                                                          .toString(),
                                                      '0',
                                                      snp.data![index]
                                                              ['historyacss']
                                                          .toString(),
                                                      snp.data![index]
                                                              ['stocacss']
                                                          .toString(),
                                                      snp.data![index]
                                                              ['additmsacss']
                                                          .toString());

                                                  print(
                                                      'true 00000000000000000000000000000000000');
                                                } else {
                                                  print(
                                                      'else***********************************');
                                                  updatachek(
                                                      snp.data![index]['id'],
                                                      snp.data![index]
                                                          ['usarlist'],
                                                      snp.data![index]
                                                          ['passlist'],
                                                      '1',
                                                      snp.data![index]
                                                              ['historyacss']
                                                          .toString(),
                                                      snp.data![index]
                                                              ['stocacss']
                                                          .toString(),
                                                      snp.data![index]
                                                              ['additmsacss']
                                                          .toString());
                                                }
                                                setState(() {});
                                              })
                                        ],
                                      ),
                                    ),
                                    //..............صلاحيه سجل العملاء
                                    Container(
                                      child: Row(
                                        children: [
                                          Text('سجل العملاء'),
                                          Checkbox(
                                              value: historyacssbool,
                                              onChanged: (z) {})
                                        ],
                                      ),
                                    ),
                                    //..............صلاحيه عرض المخزن
                                    Container(
                                      child: Row(
                                        children: [
                                          Text('عرض المخزن'),
                                          Checkbox(
                                              value: stocacssbool,
                                              onChanged: (s) {})
                                        ],
                                      ),
                                    ),
                                    //..............صلاحيه اضافه اصناف
                                    Container(
                                      child: Row(
                                        children: [
                                          Text('اضافه اصناف'),
                                          Checkbox(
                                              value: additmsacssbool,
                                              onChanged: (u) {})
                                        ],
                                      ),
                                    ),
                                  ],
                                )*/
                              ],
                            ),
                          );
                        }),
                  )
                ],
              ),
            ));
          }
          return CircularProgressIndicator();
        });
  }
}
