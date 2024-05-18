/*import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'model.dart';

class hispos extends StatefulWidget {
  const hispos({Key? key}) : super(key: key);

  @override
  State<hispos> createState() => _hisposState();
}

class _hisposState extends State<hispos> {
  //..............................................
  Future<List<posinvose>> getPostposinvose() async {
  http.Response futurepost =
      await http.get(Uri.parse("http://localhost:5050//itmepos.php"));
  if (futurepost.statusCode == 200) {
    print(futurepost.body);
    List dataposinvose = jsonDecode(futurepost.body);
    List<posinvose> allusrposinvose = [];
    for (var u in dataposinvose) {
      posinvose usarsrollinvose = posinvose.fromJson(u);
      allusrposinvose.add(usarsrollinvose);
    }

    return allusrposinvose;
  } else {
    return throw Exception('انقطع الاتصال');
  }
}

//.................................
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: Stack(
          children: [
            FutureBuilder<List<posinvose>>(
               future:getPostposinvose() ,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
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
                                          text2('${snapshot.data![index].id}'),
                                           text2('${snapshot.data![index].namecastm}')
                                        ],
                                      )),
                                      Divider(),
                                      Container(
                                      height: 32.0,
                                      color: Colors.blue,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          text2('${snapshot.data![index].mopil}'),
                                           text2('${snapshot.data![index].adress}')
                                        ],
                                      )),
                              
                                  Divider(),









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
                                                          FlatButton(
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
text2(tex) {
  return Text(
    tex,
    textAlign: TextAlign.center,
    style: TextStyle(color: Colors.white, fontSize: 15),
  );
}

textc2(tex) {
  return Text(
    tex,
    style: TextStyle(color: Colors.black, fontSize: 15),
  );
}

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
                          }*/