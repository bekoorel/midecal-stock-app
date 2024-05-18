import 'dart:convert';

class usar {
  var id;
  var itmename;
  var itemcount;
  var itemcode;

  usar({
    this.id,
    this.itmename,
    this.itemcount,
    this.itemcode,
  });

  factory usar.fromJson(Map<String, dynamic> json) {
    return usar(
      id: json["id"],
      itmename: json["itmename"],
      itemcount: json["itemcount"],
      itemcode: json["itemcode"],
    );
  }
}

//.............................................................
class usar1 {
  var idin;
  var itmenamein;
  var itemcountin;
  var itemcodein;

  usar1({
    this.idin,
    this.itmenamein,
    this.itemcountin,
    this.itemcodein,
  });

  factory usar1.fromJson(Map<String, dynamic> json) {
    return usar1(
      idin: json["idin"],
      itmenamein: json["itemsnamein"],
      itemcountin: json["itemcountin"],
      itemcodein: json["itemcodein"],
    );
  }
}

//.............................................

class usar2 {
  var idout;
  var itmenameout;
  var itemcountout;
  var itemcodeout;

  usar2({
    this.idout,
    this.itmenameout,
    this.itemcountout,
    this.itemcodeout,
  });

  factory usar2.fromJson(Map<String, dynamic> json) {
    return usar2(
      idout: json["id"],
      itmenameout: json["itemsnameout"],
      itemcountout: json["itemcountout"],
      itemcodeout: json["itemcodeout"],
    );
  }
}

//.............................................

class usar3 {
  var idredclint;
  var fullname;
  var numbarphone;
  var whats;
  var adress;
  var age;
  var docnum;
  var eror;
  var scane;
  var thisday;
  var completprise;
  var newday;

  usar3({
    this.idredclint,
    this.fullname,
    this.numbarphone,
    this.whats,
    this.adress,
    this.age,
    this.docnum,
    this.eror,
    this.scane,
    this.thisday,
    this.completprise,
    this.newday,
  });

  factory usar3.fromJson(Map<String, dynamic> json) {
    return usar3(
      idredclint: json["id"],
      fullname: json["fullname"],
      numbarphone: json["numbarphone"],
      whats: json["whats"],
      adress: json["adress"],
      age: json["age"],
      docnum: json["docnum"],
      eror: json["eror"],
      scane: json["scane"],
      thisday: json["thisday"],
      completprise: json["completprise"],
      newday: json["newday"],
    );
  }
}

//...................................................
class sershphp {
  var id;
  var itmename;
  var itemcount;
  var itemcode;

  sershphp({
    this.id,
    this.itmename,
    this.itemcount,
    this.itemcode,
  });

  factory sershphp.fromJson(Map<String, dynamic> json) {
    return sershphp(
      id: json["id"],
      itmename: json["itmename"],
      itemcount: json["itemcount"],
      itemcode: json["itemcode"],
    );
  }
}

//........................................................
class possec {
  var id;
  var name;

  possec({
    this.id,
    this.name,
  });

  factory possec.fromJson(Map<String, dynamic> json) {
    return possec(
      id: json["id"],
      name: json["name"],
    );
  }
}
//..........................................................

class positms {
  var id;
  var name;
  var discrpshn;
  var count;
  var price;
  var secshn;

  positms({
    this.id,
    this.name,
    this.discrpshn,
    this.count,
    this.price,
    this.secshn,
  });

  factory positms.fromJson(Map<String, dynamic> json) {
    return positms(
      id: json["id"],
      name: json["name"],
      discrpshn: json["discrpshn"],
      count: json["count"],
      price: json["price"],
      secshn: json["secshn"],
    );
  }
}

//...............................................

class showposlive {
  var id;
  var name;
  var count;
  var amount;

  showposlive({
    this.id,
    this.name,
    this.count,
    this.amount,
  });

  factory showposlive.fromJson(Map<String, dynamic> json) {
    return showposlive(
      id: json["id"],
      name: json["name"],
      count: json["count"],
      amount: json["amount"],
    );
  }
}

//...............................

