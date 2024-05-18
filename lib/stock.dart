import 'package:flutter/material.dart';
import 'package:poslite/stock2.dart';
import 'package:poslite/stock3.dart';
import 'package:poslite/strem.dart';

import 'database.dart';
import 'dilogaddusars.dart';
import 'done.dart';
import 'forminbut.dart';
import 'hiscustmer2.dart';
import 'model.dart';

bool swtshar = true;

class clinc extends StatefulWidget {
  const clinc({Key? key}) : super(key: key);

  @override
  State<clinc> createState() => _clincState();
}

class _clincState extends State<clinc> {
  funcolor() {
    if (swtshar) {
      outit = Colors.green;
      init = Colors.grey;
    } else {
      outit = Colors.grey;
      init = Colors.red;
    }
  }

  strem start = strem();
  @override
  void initState() {
    postdata = getPostById();

    setState(() {
      funcolor();
    });

    super.initState();
  }

  Color outit = Colors.green;
  Color init = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(1, 20),
                                  blurRadius: 15.0,
                                  color: init)
                            ]),
                        height: 100.0,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white),
                            child: Text(
                              'استرجاع',
                              style: TextStyle(
                                  color: init,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 50),
                            ),
                            onPressed: () {
                              if (swtshar == false) {
                                setState(() {
                                  out2();
                                  Additemsexiteout2in2();
                                  donesucssfil = Icons.repeat;
                                  coloricondonesccss = Colors.blue;
                                  textdonesccss = 'تم الاسترجاع';
                                  Navigator.pushNamedAndRemoveUntil(
                                      context, "/done", (route) => false);
                                });

                                //..............TO DO
                              }
                            })),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 100.0,
                      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(1, 20),
                                blurRadius: 15.0,
                                color: Colors.blue)
                          ]),
                      child: Switch(
                          value: swtshar,
                          onChanged: (bool newvalue) {
                            setState(() {
                              swtshar = newvalue;
                              funcolor();
                            });
                          }),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(1, 20),
                                  blurRadius: 15.0,
                                  color: outit)
                            ]),
                        height: 100.0,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white),
                            child: Text(
                              'صرف',
                              style: TextStyle(
                                  color: outit,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 50),
                            ),
                            onPressed: () {
                              if (swtshar) {
                                setState(() {
                                  out();

                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                    return done();
                                  }));
                                  getPostById();
                                  getPostByIdin();
                                  getPostByIdout();
                                });
                              }
                            })),
                  ),
                ],
              ),
              const SizedBox(
                height: 200.0,
              ),
              Center(
                child: Container(
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          const BoxShadow(
                              offset: Offset(1, 20),
                              blurRadius: 10.0,
                              color: Colors.grey)
                        ]),
                    width: 600.0,
                    height: 600.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        report(),
                        Container(
                            margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white),
                                onPressed: () {
                                  Navigator.pushNamedAndRemoveUntil(
                                      context, '/login', (route) => false);
                                },
                                child: Text(
                                  'تسجيل الخروج',
                                  style: TextStyle(color: Colors.red),
                                ))),
                      ],
                    )),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(1, 20),
                                  blurRadius: 15.0,
                                  color: Colors.grey)
                            ]),
                        height: 50.0,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white),
                            child: const Text(
                              'اضافه',
                              style: const TextStyle(
                                  color: Colors.teal, fontSize: 30),
                            ),
                            onPressed: () {
                              setState(() {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (Context) {
                                  return const stock3();
                                }));
                              });
                            }),
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  offset: const Offset(1, 20),
                                  blurRadius: 15.0,
                                  color: Colors.grey)
                            ]),
                        height: 50.0,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white),
                            child: const Text(
                              'عرض المخزن',
                              style:
                                  TextStyle(color: Colors.teal, fontSize: 30),
                            ),
                            onPressed: () {
                              setState(() {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (Context) {
                                  return const stock2();
                                }));
                              });
                            }),
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              const BoxShadow(
                                  offset: Offset(1, 20),
                                  blurRadius: 15.0,
                                  color: Colors.grey)
                            ]),
                        height: 50.0,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white),
                            child: const Text(
                              'سجل العملاء',
                              style:
                                  TextStyle(color: Colors.teal, fontSize: 30),
                            ),
                            onPressed: () {
                              setState(() {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (Context) {
                                  return form2();
                                }));
                              });
                            }),
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              const BoxShadow(
                                  offset: Offset(1, 20),
                                  blurRadius: 15.0,
                                  color: Colors.grey)
                            ]),
                        height: 50.0,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white),
                            child: const Text(
                              'اضافه عميل',
                              style: const TextStyle(
                                  color: Colors.teal, fontSize: 30),
                            ),
                            onPressed: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return const rorminput();
                              }));
                            }),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 120.0, 0.0, 0.0),
            child: strem(),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(5, 800, 0, 0),
            child: IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (Context) {
                      return addusar();
                    });
              },
              icon: Icon(Icons.settings),
            ),
          ),
          Container(
              margin: EdgeInsets.fromLTRB(90, 800, 0, 0),
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil("/pos", (route) => false);
                  },
                  icon: Icon(Icons.point_of_sale_outlined)))
        ],
      )),
    );
  }
}

class image extends StatefulWidget {
  const image({Key? key}) : super(key: key);

  @override
  State<image> createState() => _imageState();
}

class _imageState extends State<image> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
                width: 500.0,
                height: 150.0,
                child: Image(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/bekoorelclinic.png'))),
            Container(
                margin: EdgeInsets.fromLTRB(300, 0, 0, 0),
                width: 200.0,
                height: 63.0,
                child: const Image(
                    fit: BoxFit.cover, image: AssetImage('assets/cover2.png'))),
          ],
        )
      ],
    );
  }
}

class report extends StatefulWidget {
  const report({Key? key}) : super(key: key);

  @override
  State<report> createState() => _reportState();
}

class _reportState extends State<report> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<usar>>(
        future: postdata,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [image()],
            );
          }
          return const Text(
            'جاري الاتصال',
            style: TextStyle(
                color: Colors.teal, fontWeight: FontWeight.bold, fontSize: 30),
          );
        });
  }
}
