import 'package:poslite/stock3.dart';

import 'forminbut.dart';
import 'model.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

bool dailog = false;
String idsuport = '';
String idsuport2 = '';

Future<List<usar>> getPostById() async {
  http.Response futurepost =
      await http.get(Uri.parse("http://localhost:5050//index1.php"));
  if (futurepost.statusCode == 200) {
    print(futurepost.body); // الداتا الجيسون جت هنا

    List data = jsonDecode(futurepost.body);

    List<usar> allusr = [];
    for (var u in data) {
      usar usarsroll = usar.fromJson(u);
      allusr.add(usarsroll);
    }

    return allusr;
  } else {
    return throw Exception('انقطع الاتصال');
  }
}

Future<List<usar>>? postdata;

//.........................................................
Future Additems() async {
  var url = 'http://localhost:5050//additems.php';
  var respons = await http.post(Uri.parse(url), body: {
    'id': idsuport2,
    'itmename': itemenameadd.text,
    'itemcount': itemecountadd.text,
    'itemcode': itemecodeadd.text,
  });
}

//.....................................................

Future<List<usar1>> getPostByIdin() async {
  http.Response futurepost =
      await http.get(Uri.parse("http://localhost:5050//index2.php"));
  if (futurepost.statusCode == 200) {
    List data = jsonDecode(futurepost.body);
    List<usar1> allusr = [];
    for (var u in data) {
      usar1 usarsroll = usar1.fromJson(u);
      allusr.add(usarsroll);
    }

    return allusr;
  } else {
    return throw Exception('انقطع الاتصال');
  }
}

Future<List<usar1>>? postdata1;

//............................................

Future<List<usar2>> getPostByIdout() async {
  http.Response futurepost =
      await http.get(Uri.parse("http://localhost:5050/index3.php"));
  if (futurepost.statusCode == 200) {
    List data = jsonDecode(futurepost.body);
    List<usar2> allusr = [];
    for (var u in data) {
      usar2 usarsroll = usar2.fromJson(u);
      allusr.add(usarsroll);
    }

    return allusr;
  } else {
    return throw Exception('انقطع الاتصال');
  }
}

Future<List<usar2>>? postdata2;

//........................................................
/*Future<List<usar3>> getPostByIdredclinte() async {
  http.Response futurepost =
      await http.get(Uri.parse("http://localhost:5050/redclint.php"));
  if (futurepost.statusCode == 200) {
    print(futurepost.body); // الداتا الجيسون جت هنا

    List data = jsonDecode(futurepost.body);
    List<usar3> allusr = [];
    for (var u in data) {
      usar3 usarsroll = usar3.fromJson(u);
      allusr.add(usarsroll);
    }

    return allusr;
  } else {
    return throw Exception('انقطع الاتصال');
  }
}

Future<List<usar3>>? postdata3;*/

//.........................................
Future AddData() async {
  var url = 'http://localhost:5050/addclintedata.php';
  var respons = await http.post(Uri.parse(url), body: {
    'id': idsuport,
    'fullname': fullname.text,
    'numbarphone': numbarphone.text,
    'whats': whats.text,
    'adress': adress.text,
    'age': age.text,
    'docnum': docnum.text,
    'eror': eror.text,
    'scane': scane.text,
    'thisday': thisday.text,
    'completprise': completprise.text,
    'newday': newday.text,
  });
}

//............................................
Future ubDatain(
    String ideditinego, editnameedit, editcauontedit, editcodeedit) async {
  var url = 'http://localhost:5050/updatein.php';
  var resubdata = await http.post(Uri.parse(url), body: {
    'idin': ideditinego,
    'itemsnamein': editnameedit,
    'itemcountin': editcauontedit,
    'itemcodein': editcodeedit,
  });
}

//..........................................

Future ubDataout(String ideditoutego, editnameoutsuport, editcauontoutsuport,
    editcodeoutsuport) async {
  var url = 'http://localhost:5050/ubdateout.php';
  var resout1 = await http.post(Uri.parse(url), body: {
    'id': ideditoutego,
    'itemsnameout': editnameoutsuport,
    'itemcountout': editcauontoutsuport,
    'itemcodeout': editcodeoutsuport,
  });
}

//..............................................
Future ubDataall(String ideditall, itmenamealledit, itemcountalledit,
    itemcodealledit) async {
  var url = 'http://localhost:5050/ubdateall.php';
  var resout2 = await http.post(Uri.parse(url), body: {
    'id': ideditall,
    'itmename': itmenamealledit,
    'itemcount': itemcountalledit,
    'itemcode': itemcodealledit,
  });
}

//................................................

Future deletData(deletid) async {
  var url = 'http://localhost:5050/delete.php';
  var resout3 = await http.post(Uri.parse(url), body: {
    'id': deletid.toString(),
  });
  print("................delte");
  return resout3;
}

//......................................
Future deletDatain(deletidin) async {
  var url = 'http://localhost:5050/deletein.php';
  var resout3 = await http.post(Uri.parse(url), body: {
    'idin': deletidin.toString(),
  });
  print('fun.............');
}

//.............................................
Future deletDataout(deletidout) async {
  var url = 'http://localhost:5050/deleteout.php';
  var resout3 = await http.post(Uri.parse(url), body: {
    'id': deletidout.toString(),
  });
}

//..................................................

//..............................................

/*Future entrysersh<sershphp>(entrycode) async {
  var url = 'http://localhost:5050/sershitme.php';
  var resubdata = await http.post(Uri.parse(url), body: {
    'itemcode': entrycode,
  });
  print(resubdata.body);
  return resubdata.body;
}*/

//..........................................................صرف

