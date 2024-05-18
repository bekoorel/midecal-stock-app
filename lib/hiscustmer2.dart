import 'dart:async';

import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
//..................................

var fullname_print;
var numbarphone_print;
var whats_print;
var adress_print;
var age_print;
var docnum_print;
var eror_print;
var scane_print;

//...........................................

class form2 extends StatefulWidget {
  const form2({Key? key}) : super(key: key);

  @override
  State<form2> createState() => _form2State();
}

class _form2State extends State<form2> {
  //....................................................
  Future ubDatahis(id, fullname, numbarphone, whats, adress, age, docnum, eror,
      scane, thisday, completprise, newday) async {
    var url = 'http://localhost:5050/edithis.php';
    var resubdata = await http.post(Uri.parse(url), body: {
      'id': id.toString(),
      'fullname': fullname.toString(),
      'numbarphone': numbarphone.toString(),
      'whats': whats.toString(),
      'adress': adress.toString(),
      'age': age.toString(),
      'docnum': docnum.toString(),
      'eror': eror.toString(),
      'scane': scane.toString(),
      'thisday': thisday.toString(),
      'completprise': completprise.toString(),
      'newday': newday.toString(),
    });

    getPostByIdsershhis();
  }

  //.................................................
  List leshis = [];
  Future getPostByIdsershhis() async {
    http.Response futureposthis =
        await http.get(Uri.parse("http://localhost:5050/redclint.php"));
    if (futureposthis.statusCode == 200) {
      print(futureposthis.body); // الداتا الجيسون جت هنا

      List datahis = jsonDecode(futureposthis.body);
      setState(() {
        leshis.addAll(datahis);
        _streamControllerhis.add(leshis);
      });
    } else {}
  }

  //...........................

  late StreamController<List<dynamic>> _streamControllerhis;
  late Stream<List<dynamic>> _streamhis;
  @override
  void initState() {
    super.initState();
    getPostByIdsershhis();
    setState(() {
      _streamControllerhis = StreamController();
      _streamhis = _streamControllerhis.stream;
    });
  }
  //....................................

  Future deletDatahis(idhis) async {
    var url = 'http://localhost:5050/deltehis.php';
    var resout3 = await http.post(Uri.parse(url), body: {
      'id': idhis.toString(),
    });
  }

  //.................................
  var fullname = TextEditingController();
  var numbarphone = TextEditingController();
  var whats = TextEditingController();
  var adress = TextEditingController();
  var age = TextEditingController();
  var docnum = TextEditingController();
  var eror = TextEditingController();
  var scane = TextEditingController();
  //.........................................
  var fullnamee;
  var numbarphonee;
  var whatse;
  var adresse;
  var agee;
  var docnume;
  var erore;
  var scanee;
  //.............................................

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: Stack(
          children: [
            StreamBuilder<List<dynamic>>(
                stream: _streamhis,
                builder: (stxx, snpp) {
                  if (snpp.hasData) {
                    return ListView.builder(
                        itemCount: snpp.data!.length,
                        itemBuilder: (context, i) {
                          //.........................................
                          funhis() {
                            if (fullname.value.text.isEmpty) {
                              fullnamee = snpp.data![i]['fullname'];
                            } else {
                              fullnamee = fullname.text;
                            }
                            //000000000000000000

                            if (numbarphone.value.text.isEmpty) {
                              numbarphonee = snpp.data![i]['numbarphone'];
                            } else {
                              numbarphonee = numbarphone.text;
                            }
                            //00000000000000000

                            if (whats.value.text.isEmpty) {
                              whatse = snpp.data![i]['whats'];
                            } else {
                              whatse = whats.text;
                            }
                            //0000000000000000

                            if (adress.value.text.isEmpty) {
                              adresse = snpp.data![i]['adress'];
                            } else {
                              adresse = adress.text;
                            }
                            //0000000000000000

                            if (age.value.text.isEmpty) {
                              agee = snpp.data![i]['age'];
                            } else {
                              agee = age.text;
                            }
                            //0000000000000000

                            if (docnum.value.text.isEmpty) {
                              docnume = snpp.data![i]['docnum'];
                            } else {
                              docnume = docnum.text;
                            }
                            //0000000000000000

                            if (eror.value.text.isEmpty) {
                              erore = snpp.data![i]['eror'];
                            } else {
                              erore = eror.text;
                            }
                            //0000000000000000

                            if (scane.value.text.isEmpty) {
                              scanee = snpp.data![i]['scane'];
                            } else {
                              scanee = scane.text;
                            }
                            //0000000000000000
                          }

                          //..............................................
                          return Container(
                              height: 355.0,
                              color: Colors.white,
                              margin: EdgeInsets.all(8),
                              child: Column(
                                children: [
                                  Container(
                                      height: 32.0,
                                      color: Colors.blue,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          text('${snpp.data![i]['fullname']}')
                                        ],
                                      )),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      textc(
                                          '${snpp.data![i]['numbarphone']} : رقم الهاتف'),
                                      SizedBox(
                                        width: 8.0,
                                      ),
                                      Icon(Icons.phone)
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      textc(
                                          '${snpp.data![i]['whats']} : واتس اب'),
                                      SizedBox(
                                        width: 8.0,
                                      ),
                                      Icon(Icons.whatshot)
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      textc(
                                          '${snpp.data![i]['adress']} : العنوان'),
                                      SizedBox(
                                        width: 8.0,
                                      ),
                                      Icon(Icons.directions)
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      textc('${snpp.data![i]['age']} : السن'),
                                      SizedBox(
                                        width: 8.0,
                                      ),
                                      Icon(Icons.apps_outage_outlined)
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      textc(
                                          '${snpp.data![i]['docnum']} : اسم الطبيب'),
                                      SizedBox(
                                        width: 8.0,
                                      ),
                                      Icon(Icons.phone)
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      textc(
                                          '${snpp.data![i]['eror']} : الشكوي'),
                                      SizedBox(
                                        width: 8.0,
                                      ),
                                      Icon(Icons.help)
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      textc(
                                          '${snpp.data![i]['scane']} : التشخيص'),
                                      SizedBox(
                                        width: 8.0,
                                      ),
                                      Icon(Icons.location_searching_outlined)
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            //.........................
                                            fullname_print =
                                                snpp.data![i]['fullname'];
                                            numbarphone_print =
                                                snpp.data![i]['numbarphone'];
                                            whats_print =
                                                snpp.data![i]['whats'];
                                            adress_print =
                                                snpp.data![i]['adress'];
                                            age_print = snpp.data![i]['age'];
                                            docnum_print =
                                                snpp.data![i]['docnum'];
                                            eror_print = snpp.data![i]['eror'];
                                            scane_print =
                                                snpp.data![i]['scane'];

                                            //.........................
                                            Navigator.of(context)
                                                .pushNamed('/print2');
                                          },
                                          icon: Icon(
                                            Icons.print,
                                            color: Colors.blue,
                                          )),
                                      IconButton(
                                          onPressed: () {
                                            //.............................

                                            showDialog(
                                                context: context,
                                                builder: (Context) {
                                                  return AlertDialog(
                                                    content: Container(
                                                      height: 800.0,
                                                      width: 800.0,
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Container(
                                                                  height: 50.0,
                                                                  width: 300.0,
                                                                  child: //............................
                                                                      TextField(
                                                                    controller:
                                                                        fullname,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    decoration: InputDecoration(
                                                                        hintText:
                                                                            '${snpp.data![i]['fullname']}'),
                                                                  )),
                                                              SizedBox(
                                                                width: 20.0,
                                                              ),
                                                              Container(
                                                                  height: 50.0,
                                                                  width: 300.0,
                                                                  child: //............................
                                                                      TextField(
                                                                    controller:
                                                                        numbarphone,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    decoration: InputDecoration(
                                                                        hintText:
                                                                            '${snpp.data![i]['numbarphone']}'),
                                                                  )),
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Container(
                                                                  height: 50.0,
                                                                  width: 150.0,
                                                                  child: //............................
                                                                      TextField(
                                                                    controller:
                                                                        whats,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    decoration: InputDecoration(
                                                                        hintText:
                                                                            '${snpp.data![i]['whats']}'),
                                                                  )),
                                                              SizedBox(
                                                                width: 20.0,
                                                              ),
                                                              Container(
                                                                  height: 50.0,
                                                                  width: 500.0,
                                                                  child: //............................
                                                                      TextField(
                                                                    controller:
                                                                        adress,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    decoration: InputDecoration(
                                                                        hintText:
                                                                            '${snpp.data![i]['adress']}'),
                                                                  )),
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Container(
                                                                  height: 50.0,
                                                                  width: 250.0,
                                                                  child: //............................
                                                                      TextField(
                                                                    controller:
                                                                        eror,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    decoration: InputDecoration(
                                                                        hintText:
                                                                            '${snpp.data![i]['eror']}'),
                                                                  )),
                                                              SizedBox(
                                                                width: 20.0,
                                                              ),
                                                              Container(
                                                                  height: 50.0,
                                                                  width: 200.0,
                                                                  child: //............................
                                                                      TextField(
                                                                    controller:
                                                                        docnum,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    decoration: InputDecoration(
                                                                        hintText:
                                                                            '${snpp.data![i]['docnum']} '),
                                                                  )),
                                                              SizedBox(
                                                                width: 20.0,
                                                              ),
                                                              Container(
                                                                  height: 50.0,
                                                                  width: 50.0,
                                                                  child: //............................
                                                                      TextField(
                                                                    controller:
                                                                        age,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    decoration: InputDecoration(
                                                                        hintText:
                                                                            '${snpp.data![i]['age']} '),
                                                                  )),
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Container(
                                                                  color: Colors
                                                                          .blue[
                                                                      100],
                                                                  height: 200.0,
                                                                  width: 500.0,
                                                                  child: //............................
                                                                      TextField(
                                                                    controller:
                                                                        scane,
                                                                    maxLines:
                                                                        null,
                                                                    expands:
                                                                        true,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    decoration: InputDecoration(
                                                                        hintText:
                                                                            '${snpp.data![i]['scane']}'),
                                                                  )),
                                                            ],
                                                          ),
                                                          ElevatedButton(
                                                              style: ElevatedButton
                                                                  .styleFrom(
                                                                      backgroundColor:
                                                                          Colors
                                                                              .white),
                                                              onPressed: () {
                                                                funhis();
                                                                ubDatahis(
                                                                    snpp.data![
                                                                            i]
                                                                        ['id'],
                                                                    fullnamee,
                                                                    numbarphonee,
                                                                    whatse,
                                                                    adresse,
                                                                    agee,
                                                                    docnume,
                                                                    erore,
                                                                    scanee,
                                                                    '',
                                                                    '',
                                                                    '');
                                                              },
                                                              child:
                                                                  Text('تطبيق'))
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                });

                                            //...........................
                                          },
                                          icon: Icon(
                                            Icons.edit,
                                            color: Colors.green,
                                          )),
                                      IconButton(
                                          onPressed: () {
                                            deletDatahis(snpp.data![i]['id']);
                                            Navigator.pushNamedAndRemoveUntil(
                                                context,
                                                '/clinc',
                                                (route) => false);
                                          },
                                          icon: Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                          ))
                                    ],
                                  )
                                ],
                              ));
                        });
                  } else {
                    CircularProgressIndicator();
                  }
                  return CircularProgressIndicator();
                }),
            IconButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/clinc', (route) => false);
                },
                icon: Icon(Icons.exit_to_app))
          ],
        ));
  }
}

text(tex) {
  return Text(
    tex,
    textAlign: TextAlign.center,
    style: TextStyle(color: Colors.white, fontSize: 15),
  );
}

textc(tex) {
  return Text(
    tex,
    style: TextStyle(color: Colors.black, fontSize: 15),
  );
}
