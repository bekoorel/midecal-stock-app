

/*class timar extends StatefulWidget {
  const timar({Key? key}) : super(key: key);

  @override
  State<timar> createState() => _timarState();
}

class _timarState extends State<timar> {
  int s = 1;
  var g = 50.0;
  @override
  Widget build(BuildContext context) {
    Timer.periodic(Duration(seconds: 1), (timar) {
      setState(() {
        g = g + 50;
        g = g - 50;
      });
    });
    return Scaffold(
      body: Center(
          child: Container(
        height: g,
        width: 100.0,
        color: Colors.red,
      )),
    );
  }
}*/
