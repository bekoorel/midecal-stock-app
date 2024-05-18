// ignore_for_file: public_member_api_docs

import 'dart:io';
import 'dart:typed_data';

import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:poslite/stock3.dart';
import 'package:printing/printing.dart';

/*Future<void> main() async {
  runApp(const MyApp('Printing Demo'));
}*/

class printcode extends StatefulWidget {
  printcode(this.title, {Key? key}) : super(key: key);

  final String title;

  @override
  State<printcode> createState() => _printcodeState();
}

class _printcodeState extends State<printcode> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back)),
          title: Text(widget.title),
        ),
        body: PdfPreview(
          build: (format) => _generatePdf(format, widget.title),
        ),
      ),
    );
  }

  Future<Uint8List> _generatePdf(PdfPageFormat format, String title) async {
    final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: true);
    Uint8List fontData =
        File('assets/fonts/Cairo-Regular.ttf').readAsBytesSync();
    var data = fontData.buffer.asByteData();

    var myFont = pw.Font.ttf(data);
    var myStyle = pw.TextStyle(
        font: myFont, fontWeight: pw.FontWeight.bold, fontSize: 20);

    pdf.addPage(
      pw.Page(
          pageFormat: format,
          build: (context) {
            return pw.Column(children: [
              pw.Text(bartext,
                  style: myStyle, textDirection: pw.TextDirection.rtl),
              pw.BarcodeWidget(
                  width: 600.0,
                  height: 300.0,
                  data: bar,
                  textStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                  barcode: Barcode.code128())
            ]);
          }),
    );

    return pdf.save();
  }
}
