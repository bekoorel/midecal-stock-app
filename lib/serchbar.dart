/*import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:stock/database.dart';

sersh(
  list,
  entrysershin,
) {
  List listshow = list;
  String entrysersh = entrysershin;
  List<String> kk = [];
  for (var t in listshow) {
    if (t.toLowerCase().contains(entrysersh.toLowerCase())) {
      kk.add(t);
      return kk;
    }
  }
}

class sershbar extends StatefulWidget {
  const sershbar({Key? key}) : super(key: key);

  @override
  State<sershbar> createState() => _sershbarState();
}

class _sershbarState extends State<sershbar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        actions: [
          IconButton(
            onPressed: () {
              getPostById();
              /* showSearch(
                context: context,
                delegate: customsearchdelegate(),
              );*/
            },
            icon: Icon(Icons.search),
          )
        ],
      ),
    );
  }
}

class customsearchdelegate extends SearchDelegate {
  List<String> searchterms = ['1', '2', '3'];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchquery = [];
    for (var fruit in searchterms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchquery.add(fruit);
      }
    }
    return ListView.builder(
        itemCount: matchquery.length,
        itemBuilder: (context, index) {
          var result = matchquery[index];
          return ListTile(
            title: Text(result),
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchquery = [];
    for (var fruit in searchterms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchquery.add(fruit);
      }
    }
    return ListView.builder(
        itemCount: matchquery.length,
        itemBuilder: (context, index) {
          var result = matchquery[index];
          return ListTile(
            title: Text(result),
          );
        });
  }
}*/
