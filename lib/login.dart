import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

//..........................................

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    TextEditingController usarname = TextEditingController();
    TextEditingController password = TextEditingController();

//..............................................

    Future loginsersh() async {
      var url = 'http://localhost:5050//loginusar.php';
      var respons = await http.post(Uri.parse(url), body: {
        'usarlist': usarname.text,
        'passlist': password.text,
      });
      if (respons.statusCode == 200) {
        var r = jsonDecode(respons.body);
        print(r.runtimeType);
        if (r == "10") {
          Navigator.of(context).pushNamed('/clinc');
        }
      }
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('صباح الخير '),
          backgroundColor: Colors.black,
          elevation: 30,
          shadowColor: Colors.blue,
        ),
        body: Center(
          child: Row(
            children: [
              Expanded(
                  flex: 3,
                  child: Container(
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Image(
                                fit: BoxFit.contain,
                                image: AssetImage('assets/bekoorelclinic.png')),
                          ),
                          Container(
                            height: 400.0,
                            child: Image(
                                fit: BoxFit.contain,
                                image: AssetImage('assets/cover2.png')),
                          ),
                        ],
                      ))),
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.black,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 300.0,
                        height: 50.0,
                        child: TextField(
                          controller: usarname,
                          style: TextStyle(fontSize: 20, color: Colors.white),
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              label: Text(
                            'ادخل اسم المستخدم',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          )),
                        ),
                      ),
                      Container(
                        width: 300.0,
                        height: 50.0,
                        child: TextField(
                          obscureText: true,
                          controller: password,
                          style: TextStyle(fontSize: 20, color: Colors.white),
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              label: Text(
                            'ادخل كلمه المرور',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          )),
                        ),
                      ),
                      Container(
                        width: 300.0,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white),
                            onPressed: () {
                              loginsersh();
                            },
                            child: Text(
                              'OK',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            )),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
