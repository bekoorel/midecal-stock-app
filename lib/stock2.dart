import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:poslite/printusb.dart';
import 'package:poslite/stock3.dart';

import 'database.dart';
import 'forminbut.dart';
import 'model.dart';

ScrollController datascrol191 = ScrollController();
ScrollController datascrol1 = ScrollController();
ScrollController datascrol282 = ScrollController();
//...............................................................
TextEditingController sershcontrol = TextEditingController();
//................................................................
TextEditingController editname = TextEditingController();
TextEditingController editcauont = TextEditingController();
TextEditingController editcode = TextEditingController();
TextEditingController editidin = TextEditingController();
//................................................................

TextEditingController editnameout = TextEditingController();
TextEditingController editcauontout = TextEditingController();
TextEditingController editcodeout = TextEditingController();
TextEditingController editidinout = TextEditingController();

//.................................................................
TextEditingController editnameall = TextEditingController();
TextEditingController editcauontall = TextEditingController();
TextEditingController editcodeall = TextEditingController();
TextEditingController editidinall = TextEditingController();
//.................................................
var editnameallsuport;
var editcauontallsuport;
var editcodeallsuport;
//...........................................
var editnameinsuport;
var editcauontinsuport;
var editcodeinsuport;
//........................................

var editnameoutsuprt;
var editcauontoutsuport;
var editcodeoutsuport;

String time = DateTime.now().toString();

class stock2 extends StatefulWidget {
  const stock2({Key? key}) : super(key: key);

  @override
  State<stock2> createState() => _stock2State();
}

class _stock2State extends State<stock2> {
  @override
  void initState() {
    postdata = getPostById();
    postdata1 = getPostByIdin();
    postdata2 = getPostByIdout();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Column(
          children: [
            SizedBox(
              height: 170.0,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
              child: Row(
                children: [
                  Expanded(flex: 1, child: allitem()),
                  Expanded(flex: 1, child: initem()),
                  Expanded(flex: 1, child: outitem())
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(30.0, 0.0, 20.0, 0.0),
              height: 20.0,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(1, 30),
                        blurRadius: 10.0,
                        color: Colors.grey)
                  ]),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
          height: 150.0,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    offset: Offset(1, 30), blurRadius: 10.0, color: Colors.grey)
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [],
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 200.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(1, 10),
                              blurRadius: 10.0,
                              color: Colors.grey)
                        ]),
                    child: Text(
                      'كل الاصناف',
                      style: TextStyle(
                          color: Colors.teal,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    width: 30.0,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 200.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(1, 10),
                              blurRadius: 10.0,
                              color: Colors.grey)
                        ]),
                    child: Text(
                      'المرتجع',
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    width: 30.0,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 200.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(1, 10),
                              blurRadius: 10.0,
                              color: Colors.grey)
                        ]),
                    child: Text(
                      'المصروف',
                      style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 10.0, 0.0, 0.0),
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.teal,
              size: 30,
            ),
          ),
        ),
      ],
    ));
  }
}

//...........................................

class allitem extends StatefulWidget {
  const allitem({Key? key}) : super(key: key);

  @override
  State<allitem> createState() => _allitemState();
}

class _allitemState extends State<allitem> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<usar>>(
        future: postdata,
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              height: 800.0,
              margin: EdgeInsets.all(5.0),
              child: Scrollbar(
                controller: datascrol191,
                child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    controller: datascrol191,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(1, 1),
                                  blurRadius: 5.0,
                                  color: Colors.grey)
                            ]),
                        margin: EdgeInsets.all(2.0),
                        alignment: Alignment.center,
                        height: 50.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(13, 5, 0, 0),
                              child: BarcodeWidget(
                                  height: 30.0,
                                  width: 100.0,
                                  drawText: false,
                                  data: snapshot.data![index].itemcode,
                                  barcode: Barcode.code128()),
                            ),
                            Spacer(),
                            Text(
                              ' ${snapshot.data![index].itmename}  |  ${snapshot.data![index].itemcount}  |  ${snapshot.data![index].itemcode}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.teal,
                              ),
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            IconButton(
                                onPressed: () {
                                  bar = snapshot.data![index].itemcode;
                                  bartext = snapshot.data![index].itmename;
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                    return printcode('PRINT CODE ALL ITEMS');
                                  }));
                                },
                                icon: Icon(
                                  Icons.print,
                                  color: Colors.blue,
                                )),
                            IconButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (Context) {
                                        return AlertDialog(
                                          content: Container(
                                            height: 200.0,
                                            width: 800.0,
                                            child: Column(
                                              children: [
                                                Text(
                                                  'هل انت متأكد من حذف هذا الصنف ${snapshot.data![index].itmename} ',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20,
                                                    color: Colors.red,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 20.0,
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      boxShadow: [
                                                        BoxShadow(
                                                            offset:
                                                                Offset(1, 20),
                                                            blurRadius: 15.0,
                                                            color: Colors.grey)
                                                      ]),
                                                  height: 50.0,
                                                  child: ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                              backgroundColor:
                                                                  Colors.white),
                                                      child: Text(
                                                        'حذف',
                                                        style: TextStyle(
                                                            color: Colors.teal,
                                                            fontSize: 30),
                                                      ),
                                                      onPressed: () {
                                                        deletData(snapshot
                                                            .data![index].id);
                                                        print(
                                                            '${snapshot.data![index].id}');

                                                        Navigator.of(context)
                                                            .pop();

                                                        getPostById();
                                                      }),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      });
                                },
                                icon: Icon(
                                  Icons.delete,
                                  color: Color.fromARGB(255, 255, 98, 86),
                                )),
                            IconButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (Context) {
                                        return AlertDialog(
                                          content: Container(
                                            height: 200.0,
                                            width: 800.0,
                                            child: Column(
                                              children: [
                                                Text(
                                                  '${snapshot.data![index].itmename}  |  ${snapshot.data![index].itemcount}  |  ${snapshot.data![index].itemcode}',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20,
                                                    color: Colors.red,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 20.0,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    a(
                                                        60.0,
                                                        300.0,
                                                        " ${snapshot.data![index].itmename}",
                                                        editnameall,
                                                        true),
                                                    a(
                                                        60.0,
                                                        100.0,
                                                        "  ${snapshot.data![index].itemcount}",
                                                        editcauontall,
                                                        true),
                                                    a(
                                                        60.0,
                                                        300.0,
                                                        " ${snapshot.data![index].itemcode}",
                                                        editcodeall,
                                                        true),
                                                    a(
                                                        40.0,
                                                        40.0,
                                                        " ${snapshot.data![index].id}",
                                                        editidinall,
                                                        false),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 20.0,
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      boxShadow: [
                                                        BoxShadow(
                                                            offset:
                                                                Offset(1, 20),
                                                            blurRadius: 15.0,
                                                            color: Colors.grey)
                                                      ]),
                                                  height: 50.0,
                                                  child: ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                              backgroundColor:
                                                                  Colors.white),
                                                      child: Text(
                                                        'تطبيق',
                                                        style: TextStyle(
                                                            color: Colors.teal,
                                                            fontSize: 30),
                                                      ),
                                                      onPressed: () {
                                                        setState(() {
                                                          if (editnameall.value
                                                              .text.isEmpty) {
                                                            editnameallsuport =
                                                                snapshot
                                                                    .data![
                                                                        index]
                                                                    .itmename;
                                                          } else {
                                                            editnameallsuport =
                                                                editnameall
                                                                    .text;
                                                          }
                                                          //............................
                                                          if (editcauontall
                                                              .value
                                                              .text
                                                              .isEmpty) {
                                                            editcauontallsuport =
                                                                snapshot
                                                                    .data![
                                                                        index]
                                                                    .itemcount;
                                                          } else {
                                                            editcauontallsuport =
                                                                editcauontall
                                                                    .text;
                                                          }
                                                          //.....................................

                                                          if (editcodeall.value
                                                              .text.isEmpty) {
                                                            editcodeallsuport =
                                                                snapshot
                                                                    .data![
                                                                        index]
                                                                    .itemcode;
                                                          } else {
                                                            editcodeallsuport =
                                                                editcodeall
                                                                    .text;
                                                          }
                                                          ubDataall(
                                                              snapshot
                                                                  .data![index]
                                                                  .id
                                                                  .toString(),
                                                              editnameallsuport,
                                                              editcauontallsuport,
                                                              editcodeallsuport);

                                                          Navigator.of(context)
                                                              .pop();

                                                          getPostById();
                                                        });
                                                      }),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      });
                                },
                                icon: Icon(
                                  Icons.edit,
                                  color: Colors.grey,
                                )),
                          ],
                        ),
                      );
                    }),
              ),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: LinearProgressIndicator(
              color: Colors.teal,
            ),
          );
        }));
  }
}

//..............................................................

class initem extends StatefulWidget {
  const initem({Key? key}) : super(key: key);

  @override
  State<initem> createState() => _initemState();
}

class _initemState extends State<initem> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<usar1>>(
        future: postdata1,
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              height: 800.0,
              margin: EdgeInsets.all(5.0),
              child: Scrollbar(
                controller: datascrol1,
                child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    controller: datascrol1,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(1, 1),
                                  blurRadius: 5.0,
                                  color: Colors.grey)
                            ]),
                        margin: EdgeInsets.all(2.0),
                        alignment: Alignment.center,
                        height: 50.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(13, 5, 0, 0),
                              child: BarcodeWidget(
                                  height: 30.0,
                                  width: 100.0,
                                  drawText: false,
                                  data: snapshot.data![index].itemcodein,
                                  barcode: Barcode.code128()),
                            ),
                            Spacer(),
                            Text(
                              '${snapshot.data![index].itmenamein}  |  ${snapshot.data![index].itemcountin}  |  ${snapshot.data![index].itemcodein}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.red,
                              ),
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            IconButton(
                                onPressed: () {
                                  bar = snapshot.data![index].itemcodein;
                                  bartext = snapshot.data![index].itmenamein;
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                    return printcode(
                                        'PRINT CODE RETURNED ITEMS');
                                  }));
                                },
                                icon: Icon(
                                  Icons.print,
                                  color: Colors.blue,
                                )),
                            IconButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (Context) {
                                        return AlertDialog(
                                          content: Container(
                                            height: 200.0,
                                            width: 800.0,
                                            child: Column(
                                              children: [
                                                Text(
                                                  'هل انت متأكد من حذف هذا الصنف ${snapshot.data![index].itmenamein} ',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20,
                                                    color: Colors.red,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 20.0,
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      boxShadow: [
                                                        BoxShadow(
                                                            offset:
                                                                Offset(1, 20),
                                                            blurRadius: 15.0,
                                                            color: Colors.grey)
                                                      ]),
                                                  height: 50.0,
                                                  child: ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                              backgroundColor:
                                                                  Colors.white),
                                                      child: Text(
                                                        'حذف',
                                                        style: TextStyle(
                                                            color: Colors.teal,
                                                            fontSize: 30),
                                                      ),
                                                      onPressed: () {
                                                        deletDatain(snapshot
                                                            .data![index].idin);
                                                        print(
                                                            '${snapshot.data![index].idin}');

                                                        Navigator.of(context)
                                                            .pop();

                                                        getPostByIdin();
                                                      }),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      });
                                },
                                icon: Icon(
                                  Icons.delete,
                                  color: Color.fromARGB(255, 255, 98, 86),
                                )),
                            IconButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (Context) {
                                        return AlertDialog(
                                          content: Container(
                                            height: 200.0,
                                            width: 800.0,
                                            child: Column(
                                              children: [
                                                Text(
                                                  '${snapshot.data![index].itmenamein}  |  ${snapshot.data![index].itemcountin}  |  ${snapshot.data![index].itemcodein}',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20,
                                                    color: Colors.red,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 20.0,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    a(
                                                        60.0,
                                                        300.0,
                                                        " ${snapshot.data![index].itmenamein}",
                                                        editname,
                                                        true),
                                                    a(
                                                        60.0,
                                                        100.0,
                                                        "  ${snapshot.data![index].itemcountin}",
                                                        editcauont,
                                                        true),
                                                    a(
                                                        60.0,
                                                        300.0,
                                                        " ${snapshot.data![index].itemcodein}",
                                                        editcode,
                                                        true),
                                                    a(
                                                        40.0,
                                                        40.0,
                                                        " ${snapshot.data![index].idin}",
                                                        editidin,
                                                        true),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 20.0,
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      boxShadow: [
                                                        BoxShadow(
                                                            offset:
                                                                Offset(1, 20),
                                                            blurRadius: 15.0,
                                                            color: Colors.grey)
                                                      ]),
                                                  height: 50.0,
                                                  child: ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                              backgroundColor:
                                                                  Colors.white),
                                                      child: Text(
                                                        'تطبيق',
                                                        style: TextStyle(
                                                            color: Colors.teal,
                                                            fontSize: 30),
                                                      ),
                                                      onPressed: () {
                                                        setState(() {
                                                          if (editname.value
                                                              .text.isEmpty) {
                                                            editnameinsuport =
                                                                snapshot
                                                                    .data![
                                                                        index]
                                                                    .itmenamein;
                                                          } else {
                                                            editnameinsuport =
                                                                editname.text;
                                                          }
                                                          //............................
                                                          if (editcauont.value
                                                              .text.isEmpty) {
                                                            editcauontinsuport =
                                                                snapshot
                                                                    .data![
                                                                        index]
                                                                    .itemcountin;
                                                          } else {
                                                            editcauontinsuport =
                                                                editcauont.text;
                                                          }
                                                          //.....................................

                                                          if (editcode.value
                                                              .text.isEmpty) {
                                                            editcodeinsuport =
                                                                snapshot
                                                                    .data![
                                                                        index]
                                                                    .itemcodein;
                                                          } else {
                                                            editcodeinsuport =
                                                                editcode.text;
                                                          }

                                                          ubDatain(
                                                              snapshot
                                                                  .data![index]
                                                                  .idin
                                                                  .toString(),
                                                              editnameinsuport,
                                                              editcauontinsuport,
                                                              editcodeinsuport);

                                                          Navigator.of(context)
                                                              .pop();

                                                          getPostByIdin();
                                                        });
                                                      }),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      });
                                },
                                icon: Icon(
                                  Icons.edit,
                                  color: Colors.grey,
                                )),
                          ],
                        ),
                      );
                    }),
              ),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: LinearProgressIndicator(
              color: Colors.red,
            ),
          );
        }));
  }
}

//.............................................

class outitem extends StatefulWidget {
  const outitem({Key? key}) : super(key: key);

  @override
  State<outitem> createState() => _outitemState();
}

class _outitemState extends State<outitem> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<usar2>>(
        future: postdata2,
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              height: 800.0,
              margin: EdgeInsets.all(5.0),
              child: Scrollbar(
                controller: datascrol282,
                child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    controller: datascrol282,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(1, 1),
                                  blurRadius: 5.0,
                                  color: Colors.grey)
                            ]),
                        margin: EdgeInsets.all(2.0),
                        alignment: Alignment.center,
                        height: 50.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(13, 5, 0, 0),
                              child: BarcodeWidget(
                                  height: 30.0,
                                  width: 100.0,
                                  drawText: false,
                                  data: snapshot.data![index].itemcodeout,
                                  barcode: Barcode.code128()),
                            ),
                            Spacer(),
                            Text(
                              '${snapshot.data![index].itmenameout}  |  ${snapshot.data![index].itemcountout}  |  ${snapshot.data![index].itemcodeout}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.green,
                              ),
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            IconButton(
                                onPressed: () {
                                  bar = snapshot.data![index].itemcodeout;
                                  bartext = snapshot.data![index].itmenameout;
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                    return printcode('PRINT CODE OUT ITEMS');
                                  }));
                                },
                                icon: Icon(
                                  Icons.print,
                                  color: Colors.blue,
                                )),
                            IconButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (Context) {
                                        return AlertDialog(
                                          content: Container(
                                            height: 200.0,
                                            width: 800.0,
                                            child: Column(
                                              children: [
                                                Text(
                                                  'هل انت متأكد من حذف هذا الصنف ${snapshot.data![index].itmenameout} ',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20,
                                                    color: Colors.red,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 20.0,
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      boxShadow: [
                                                        BoxShadow(
                                                            offset:
                                                                Offset(1, 20),
                                                            blurRadius: 15.0,
                                                            color: Colors.grey)
                                                      ]),
                                                  height: 50.0,
                                                  child: ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                              backgroundColor:
                                                                  Colors.white),
                                                      child: Text(
                                                        'حذف',
                                                        style: TextStyle(
                                                            color: Colors.teal,
                                                            fontSize: 30),
                                                      ),
                                                      onPressed: () {
                                                        deletDataout(snapshot
                                                            .data![index]
                                                            .idout);

                                                        Navigator.of(context)
                                                            .pop();

                                                        getPostByIdout();
                                                      }),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      });
                                },
                                icon: Icon(
                                  Icons.delete,
                                  color: Color.fromARGB(255, 255, 98, 87),
                                )),
                            IconButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (Context) {
                                        return AlertDialog(
                                          content: Container(
                                            height: 200.0,
                                            width: 800.0,
                                            child: Column(
                                              children: [
                                                Text(
                                                  '${snapshot.data![index].itmenameout}  |  ${snapshot.data![index].itemcountout}  |  ${snapshot.data![index].itemcodeout}',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20,
                                                    color: Colors.red,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 20.0,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    a(
                                                        60.0,
                                                        300.0,
                                                        " ${snapshot.data![index].itmenameout}",
                                                        editnameout,
                                                        true),
                                                    a(
                                                        60.0,
                                                        100.0,
                                                        "  ${snapshot.data![index].itemcountout}",
                                                        editcauontout,
                                                        true),
                                                    a(
                                                        60.0,
                                                        300.0,
                                                        " ${snapshot.data![index].itemcodeout}",
                                                        editcodeout,
                                                        true),
                                                    a(
                                                        40.0,
                                                        40.0,
                                                        " ${snapshot.data![index].idout}",
                                                        editidinout,
                                                        true),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 20.0,
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      boxShadow: [
                                                        BoxShadow(
                                                            offset:
                                                                Offset(1, 20),
                                                            blurRadius: 15.0,
                                                            color: Colors.grey)
                                                      ]),
                                                  height: 50.0,
                                                  child: ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                              backgroundColor:
                                                                  Colors.white),
                                                      child: Text(
                                                        'تطبيق',
                                                        style: TextStyle(
                                                            color: Colors.teal,
                                                            fontSize: 30),
                                                      ),
                                                      onPressed: () {
                                                        setState(() {
                                                          if (editnameout.value
                                                              .text.isEmpty) {
                                                            editnameoutsuprt =
                                                                snapshot
                                                                    .data![
                                                                        index]
                                                                    .itmenameout;
                                                          } else {
                                                            editnameoutsuprt =
                                                                editnameout
                                                                    .text;
                                                          }
                                                          //............................

                                                          if (editcauontout
                                                              .value
                                                              .text
                                                              .isEmpty) {
                                                            editcauontoutsuport =
                                                                snapshot
                                                                    .data![
                                                                        index]
                                                                    .itemcountout;
                                                          } else {
                                                            editcauontoutsuport =
                                                                editcauontout
                                                                    .text;
                                                          }

                                                          //.....................................

                                                          if (editcodeout.value
                                                              .text.isEmpty) {
                                                            editcodeoutsuport =
                                                                snapshot
                                                                    .data![
                                                                        index]
                                                                    .itemcodeout;
                                                          } else {
                                                            editcodeoutsuport =
                                                                editcodeout
                                                                    .text;
                                                          }

                                                          ubDataout(
                                                              snapshot
                                                                  .data![index]
                                                                  .idout
                                                                  .toString(),
                                                              editnameoutsuprt,
                                                              editcauontoutsuport,
                                                              editcodeoutsuport);

                                                          Navigator.of(context)
                                                              .pop();

                                                          getPostByIdout();
                                                        });
                                                      }),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      });
                                },
                                icon: Icon(
                                  Icons.edit,
                                  color: Colors.grey,
                                )),
                          ],
                        ),
                      );
                    }),
              ),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: LinearProgressIndicator(
              color: Colors.green,
            ),
          );
        }));
  }
}
