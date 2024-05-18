/*import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class prov extends StatefulWidget {
  const prov({Key? key}) : super(key: key);

  @override
  State<prov> createState() => _provState();
}

class _provState extends State<prov> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => pr(),
      child: Scaffold(
        body: Column(
          children: [
            Consumer<pr>(builder: ((context, a, child) {
              return Column(
                children: [
                  Text(a.d.toString()),
                  RaisedButton(onPressed: () {
                    a.gh();
                  })
                ],
              );
            }))
          ],
        ),
      ),
    );
  }
}

class pr extends ChangeNotifier {
  int d = 1;

  gh() {
    d++;
    notifyListeners();
  }
}
*/