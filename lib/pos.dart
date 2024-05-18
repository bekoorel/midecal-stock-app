import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:poslite/model.dart';
import 'package:poslite/printpos.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

var respossec;
List addsec = [];

ScrollController hroz = ScrollController();
ScrollController ver = ScrollController();
ScrollController verout = ScrollController();

class pos extends StatefulWidget {
  const pos({Key? key}) : super(key: key);

  @override
  State<pos> createState() => _posState();
}

class _posState extends State<pos> {
  TextEditingController textsec = TextEditingController();
  String idsec = '';
  String idpositme = '';
  String secitmepos = '';

  //...........................
  Future Addsecpos() async {
    var url = 'http://localhost:5050//addsecpos.php';
    var respons = await http.post(Uri.parse(url), body: {
      'id': idsec,
      'name': textsec.text,
    });
    DATA().getPostpossec();
  }

//.........................
  TextEditingController nametext = TextEditingController();
  TextEditingController distext = TextEditingController();
  TextEditingController counttext = TextEditingController();
  TextEditingController prisetext = TextEditingController();

  //...........................................
  Future Additmepos() async {
    var url = 'http://localhost:5050//additmspos.php';
    var respons = await http.post(Uri.parse(url), body: {
      'id': idpositme,
      'name': nametext.text,
      'discrpshn': distext.text,
      'count': counttext.text,
      'price': prisetext.text,
      'idsecshan': secid.toString(),
    });
  }

//........................................

  List invoshow = [];

//......................................

  Future<List<positms>> getPostpositms(input) async {
    http.Response futurepost =
        await http.post(Uri.parse("http://localhost:5050//getitme.php"), body: {
      "input": input,
    });
    if (futurepost.statusCode == 200) {
      List datapositme = jsonDecode(futurepost.body);
      List<positms> allusrpositme = [];

      for (var u in datapositme) {
        positms usarsrollitme = positms.fromJson(u);
        allusrpositme.add(usarsrollitme);
      }

      return allusrpositme;
    } else {
      return throw Exception('انقطع الاتصال');
    }
  }

  int total = 0;

//....................................
  TextEditingController cosnameinvo = TextEditingController();
  TextEditingController cosphoneinvo = TextEditingController();
  TextEditingController cocaddresinvo = TextEditingController();
  //..................................
  Future Addcosposinvoce() async {
    var url = 'http://localhost:5050//addcosposinvoce.php';
    var respons = await http.post(Uri.parse(url), body: {
      'id': idpositme,
      'name': cosnameinvo.text,
      'addrs': cosphoneinvo.text,
      'mobile': cocaddresinvo.text,
    });
    if (respons.statusCode == 200) {
      colorinvoce = Colors.blue;

      setState(() {});
    } else {
      colorinvoce = Colors.red;

      setState(() {});
    }
  }

  //..................................
  Color colorinvoce = Colors.black;

  var secid;
  //************************************ */

  var idlive = '';

  String countlive = '';

  Future Addinvocelive(namelive, amountlive) async {
    var url = 'http://localhost:5050//addinvocelive.php';
    var respons = await http.post(Uri.parse(url), body: {
      'id': idlive,
      'name': namelive,
      'count': countlive,
      'amount': amountlive,
    });
    if (respons.statusCode == 200) {
      getPostposinvolive();

      setState(() {});
    }
  }

//***************************************** */

  Future clear() async {
    var url = 'http://localhost:5050//clear.php';
    var respons = await http.post(
      Uri.parse(url),
    );
    if (respons.statusCode == 200) {
      getPostposinvoprint();
    }
    setState(() {});
  }

//............................

  Future add() async {
    var url = 'http://localhost:5050//h.php';
    var respons = await http.post(
      Uri.parse(url),
    );
    if (respons.statusCode == 200) {
      clear();
      setState(() {});
    }
  }

  //-----------------------------------------
  Future getPostposinvoprint() async {
    http.Response futurepost =
        await http.post(Uri.parse("http://localhost:5050//invoceprint.php"));
    if (futurepost.statusCode == 200) {
      var uu = jsonDecode(futurepost.body);
      lprint = uu;
    }
  }

  Future<List<showposlive>> getPostposinvolive() async {
    http.Response futurepost =
        await http.post(Uri.parse("http://localhost:5050//getinvolive.php"));
    if (futurepost.statusCode == 200) {
      List datapos = jsonDecode(futurepost.body);
      List<showposlive> allusrpos = [];
      for (var u in datapos) {
        showposlive usarsroll = showposlive.fromJson(u);
        allusrpos.add(usarsroll);
      }

      getPostposinvoprint();

      return allusrpos;
    } else {
      return throw Exception('انقطع الاتصال');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DATA(),
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                child: Column(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Container(
                            width: double.infinity,
                            child: Consumer<DATA>(
                              builder: (context, clas, child) =>
                                  FutureBuilder<List<possec>>(
                                future: clas.getPostpossec(),
                                builder: ((context, snapshot) {
                                  if (snapshot.hasData) {
                                    return Column(
                                      children: [
                                        Expanded(
                                            flex: 3,
                                            child: Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  0, 5, 0, 0),
                                              color: Colors.grey[400],
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                              backgroundColor:
                                                                  Colors.white),
                                                      onPressed: () {
                                                        showDialog(
                                                            context: context,
                                                            builder: (Context) {
                                                              return AlertDialog(
                                                                  content:
                                                                      Container(
                                                                height: 100.0,
                                                                width: 300.0,
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceEvenly,
                                                                  children: [
                                                                    Container(
                                                                        height:
                                                                            50.0,
                                                                        width:
                                                                            300.0,
                                                                        child:
                                                                            TextField(
                                                                          controller:
                                                                              textsec,
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                        )),
                                                                    ElevatedButton(
                                                                      style: ElevatedButton.styleFrom(
                                                                          backgroundColor:
                                                                              Colors.white),
                                                                      onPressed:
                                                                          () {
                                                                        if (textsec
                                                                            .value
                                                                            .text
                                                                            .isEmpty) {
                                                                        } else {
                                                                          Addsecpos();
                                                                        }
                                                                      },
                                                                      child: Text(
                                                                          'اضافه القسم'),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ));
                                                            });
                                                      },
                                                      child: Text('اضافه قسم')),
                                                  ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                              backgroundColor:
                                                                  Colors.white),
                                                      onPressed: () {
                                                        showDialog(
                                                            context: context,
                                                            builder: (context) {
                                                              return AlertDialog(
                                                                content:
                                                                    Container(
                                                                  height: 600.0,
                                                                  width: 300.0,
                                                                  child: Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceEvenly,
                                                                    children: [
                                                                      //0000000000000000000000000000000000

                                                                      //000000000000000000000000000000000000000000
                                                                      Container(
                                                                          color: Colors.grey[
                                                                              100],
                                                                          height:
                                                                              50.0,
                                                                          width:
                                                                              300.0,
                                                                          child:
                                                                              TextField(
                                                                            decoration:
                                                                                InputDecoration(labelText: 'الاسم'),
                                                                            controller:
                                                                                nametext,
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                          )),
                                                                      Container(
                                                                          color: Colors.grey[
                                                                              100],
                                                                          height:
                                                                              50.0,
                                                                          width:
                                                                              300.0,
                                                                          child:
                                                                              TextField(
                                                                            decoration:
                                                                                InputDecoration(labelText: 'الوصف'),
                                                                            controller:
                                                                                distext,
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                          )),
                                                                      Container(
                                                                          color: Colors.grey[
                                                                              100],
                                                                          height:
                                                                              50.0,
                                                                          width:
                                                                              300.0,
                                                                          child:
                                                                              TextField(
                                                                            decoration:
                                                                                InputDecoration(labelText: 'العدد'),
                                                                            controller:
                                                                                counttext,
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                          )),
                                                                      Container(
                                                                          color: Colors.grey[
                                                                              100],
                                                                          height:
                                                                              50.0,
                                                                          width:
                                                                              300.0,
                                                                          child:
                                                                              TextField(
                                                                            decoration:
                                                                                InputDecoration(labelText: 'السعر'),
                                                                            controller:
                                                                                prisetext,
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                          )),
                                                                      ElevatedButton(
                                                                        style: ElevatedButton.styleFrom(
                                                                            backgroundColor:
                                                                                Colors.white),
                                                                        onPressed:
                                                                            () {
                                                                          if (nametext.value.text.isEmpty ||
                                                                              distext.value.text.isEmpty ||
                                                                              counttext.value.text.isEmpty ||
                                                                              prisetext.value.text.isEmpty) {
                                                                          } else {
                                                                            Additmepos();
                                                                          }
                                                                        },
                                                                        child: Text(
                                                                            'اضافه الصنف'),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              );
                                                            });
                                                      },
                                                      child: Text('اضافه صنف')),
                                                  IconButton(
                                                      onPressed: () {
                                                        setState(() {});
                                                      },
                                                      icon: Icon(Icons.refresh))
                                                ],
                                              ),
                                            )),
                                        Expanded(
                                          flex: 3,
                                          child: Container(
                                            child: Scrollbar(
                                              controller: hroz,
                                              child: ListView.builder(
                                                  controller: hroz,
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemCount:
                                                      snapshot.data!.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return InkWell(
                                                      onTap: () {
                                                        respossec =
                                                            getPostpositms(
                                                                snapshot
                                                                    .data![
                                                                        index]
                                                                    .name);
                                                        secid = snapshot
                                                            .data![index].id;
                                                        if (respossec != null) {
                                                          setState(() {});
                                                        }
                                                      },
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        margin: EdgeInsets.all(
                                                            10.0),
                                                        width: 200.0,
                                                        color: Colors.grey[600],
                                                        child: Text(
                                                          '${snapshot.data![index].name}',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                    );
                                                  }),
                                            ),
                                          ),
                                        )
                                      ],
                                    );
                                  } else {
                                    return CircularProgressIndicator();
                                  }
                                }),
                              ),
                            ))),
                    Expanded(
                        flex: 7,
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          child: FutureBuilder<List<positms>>(
                              future: respossec,
                              builder: ((context, snapshot) {
                                if (snapshot.hasData) {
                                  return Container(
                                    width: double.infinity,
                                    child: Scrollbar(
                                      controller: ver,
                                      child: ListView.builder(
                                          controller: ver,
                                          scrollDirection: Axis.vertical,
                                          itemCount: snapshot.data!.length,
                                          itemBuilder: (context, index) {
                                            return Container(
                                              margin: EdgeInsets.all(10.0),
                                              height: 80.0,
                                              color: Colors.grey[300],
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  text(
                                                      '${snapshot.data![index].name}'),
                                                  text(
                                                      '${snapshot.data![index].discrpshn}'),
                                                  text(
                                                      '${snapshot.data![index].count.toString()}'),
                                                  text(
                                                      '${snapshot.data![index].price.toString()}'),
                                                  ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            backgroundColor:
                                                                Colors.white),
                                                    onPressed: () {
                                                      Addinvocelive(
                                                          snapshot.data![index]
                                                              .name,
                                                          snapshot.data![index]
                                                              .price
                                                              .toString());
                                                    },
                                                    child: Text(
                                                      'اضافه',
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                  Container(
                                                    color: Colors.blueGrey[200],
                                                    height: 50.0,
                                                    width: 50.0,
                                                    child: TextField(
                                                      textAlign:
                                                          TextAlign.center,
                                                      onChanged: (value) {
                                                        countlive = value;
                                                      },
                                                    ),
                                                  )
                                                ],
                                              ),
                                            );
                                          }),
                                    ),
                                  );
                                } else {
                                  return Center(
                                      child: CircularProgressIndicator());
                                }
                              })),
                        )),
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 1,
                child: Container(
                    child: Column(
                  children: [
                    Expanded(
                      flex: 7,
                      child: Container(
                        child: printpos(),
                      ),
                    ),
                    //..........الفاتوره
                    Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              margin: EdgeInsets.all(2),
                              color: Colors.grey[300],
                              width: 100.0,
                              child: TextField(
                                textAlign: TextAlign.center,
                                decoration:
                                    InputDecoration(labelText: 'الدلفري'),
                              ),
                            ),
                            Text(
                              'الاجمالي \n ${total.toString()}',
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        )),
                    Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                margin: EdgeInsets.all(2),
                                color: Colors.grey[300],
                                height: 50.0,
                                child: TextField(
                                  controller: cocaddresinvo,
                                  textAlign: TextAlign.center,
                                  decoration:
                                      InputDecoration(labelText: 'العنوان'),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                margin: EdgeInsets.all(2),
                                color: Colors.grey[300],
                                height: 50.0,
                                child: TextField(
                                  controller: cosphoneinvo,
                                  textAlign: TextAlign.center,
                                  decoration:
                                      InputDecoration(labelText: 'رقم الهاتف'),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                margin: EdgeInsets.all(2),
                                color: Colors.grey[300],
                                height: 50.0,
                                child: TextField(
                                  controller: cosnameinvo,
                                  decoration:
                                      InputDecoration(labelText: 'اسم العميل'),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        )),
                    Expanded(
                        flex: 1,
                        child: Container(
                          width: double.infinity,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white),
                              onPressed: () {
                                Addcosposinvoce();
                                setState(() {});
                              },
                              child: Text('افتح فاتوره')),
                        )),
                    FutureBuilder<List<showposlive>>(
                        future: getPostposinvolive(),
                        builder: ((context, snapshot) {
                          if (snapshot.hasData) {
                            return Expanded(
                                flex: 7,
                                child: Container(
                                  color: colorinvoce,
                                  child: Scrollbar(
                                    controller: verout,
                                    child: ListView.builder(
                                        controller: verout,
                                        scrollDirection: Axis.vertical,
                                        itemCount: snapshot.data!.length,
                                        itemBuilder: (context, index) {
                                          var tok =
                                              snapshot.data![index].amount *
                                                  snapshot.data![index].count;
                                          return Container(
                                            margin: EdgeInsets.all(10.0),
                                            height: 50.0,
                                            color: Colors.grey[300],
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                text2(
                                                    '${snapshot.data![index].name}'),
                                                text2('${tok}'),
                                                ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          backgroundColor:
                                                              Colors.white),
                                                  onPressed: () {},
                                                  child: Text(
                                                    'حذف',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        }),
                                  ),
                                ));
                            ;
                          } else {
                            return CircularProgressIndicator();
                          }
                        })),
                    Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white),
                        onPressed: () {
                          add();
                        },
                        child: Text('اضافه'),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white),
                        onPressed: () {
                          clear();

                          setState(() {});
                        },
                        child: Text('تفريغ'),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),

                    Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white),
                        onPressed: () {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              "/clinc", (route) => false);
                        },
                        child: Text('رجوع'),
                      ),
                    )
                  ],
                )))
          ],
        ),
      ),
    );
  }
}

text(data) {
  return Text(
    data,
    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
  );
}

text2(data) {
  return Text(
    data,
    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
  );
}

class DATA extends ChangeNotifier {
  Future<List<possec>> getPostpossec() async {
    http.Response futurepost =
        await http.post(Uri.parse("http://localhost:5050//getsecpos.php"));
    if (futurepost.statusCode == 200) {
      List datapos = jsonDecode(futurepost.body);
      List<possec> allusrpos = [];
      for (var u in datapos) {
        possec usarsroll = possec.fromJson(u);
        allusrpos.add(usarsroll);
      }

      return allusrpos;
    } else {
      return throw Exception('انقطع الاتصال');
    }
  }
}

//...................................
List lprint = [];
