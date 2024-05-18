// ignore_for_file: public_member_api_docs

import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import 'hiscustmer2.dart';

/*Future<void> main() async {
  runApp(const MyApp('Printing Demo'));
}*/

class printcode2 extends StatefulWidget {
  const printcode2(this.title, {Key? key}) : super(key: key);

  final String title;

  @override
  State<printcode2> createState() => _printcode2State();
}

class _printcode2State extends State<printcode2> {
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
        font: myFont,
        fontWeight: pw.FontWeight.bold,
        fontSize: 20,
        color: PdfColor.fromRYB(0.0, 0.0, 0.0));
    //.....................................

    var data1 = fontData.buffer.asByteData();

    var myFont1 = pw.Font.ttf(data);
    var myStyle1 = pw.TextStyle(
        font: myFont,
        fontWeight: pw.FontWeight.bold,
        fontSize: 10,
        color: PdfColor.fromRYB(0.0, 0.0, 0.900));
    //............................

    var data2 = fontData.buffer.asByteData();

    var myFont2 = pw.Font.ttf(data);
    var myStyle2 = pw.TextStyle(
        font: myFont,
        fontWeight: pw.FontWeight.bold,
        fontSize: 9,
        color: PdfColor.fromRYB(0.99, 0.99, 0.99));
    var f = pw.MemoryImage((await rootBundle.load('assets/bekoorelclinic.png'))
        .buffer
        .asUint8List());

    pdf.addPage(
      pw.Page(
          pageTheme: pw.PageTheme(
            pageFormat: PdfPageFormat.a4,
          ),
          build: (context) {
            return pw.Column(children: [
              pw.Row(mainAxisAlignment: pw.MainAxisAlignment.end, children: [
                pw.Text(
                  'مــــركـــز عيــــا دات الــــهـــلال الـــطــبــٍي',
                  textDirection: pw.TextDirection.rtl,
                  style: myStyle2,
                ),
              ]),
              pw.Row(mainAxisAlignment: pw.MainAxisAlignment.end, children: [
                pw.Text(
                  '6 اكتوبر الحي السادس تقاطع عمارات ابو الوفا الدور الاول ',
                  textDirection: pw.TextDirection.rtl,
                  style: myStyle2,
                ),
              ]),
              pw.Row(mainAxisAlignment: pw.MainAxisAlignment.end, children: [
                pw.Text(
                  '01148401766\n01148401766\n01148401766',
                  textDirection: pw.TextDirection.rtl,
                  style: myStyle2,
                ),
              ]),

              pw.Container(
                  color: PdfColor.fromRYB(0.0, 0.0, 0.700),
                  alignment: pw.Alignment.center,
                  child: pw.Text(
                    textDirection: pw.TextDirection.rtl,
                    'تقرير حاله',
                    style: myStyle,
                  )),
              pw.SizedBox(
                height: 20.0,
              ),
              //..........................................
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.end,
                children: [
                  pw.Text(
                    fullname_print,
                    textDirection: pw.TextDirection.rtl,
                    style: myStyle2,
                  ),
                  pw.Text(
                    'الاسم  : ',
                    textDirection: pw.TextDirection.rtl,
                    style: myStyle1,
                  ),
                  pw.SizedBox(
                    width: 8.0,
                  ),
                ],
              ),
              pw.Divider(color: PdfColor.fromRYB(0.0, 0.0, 0.300)),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.end,
                children: [
                  pw.Text(
                    numbarphone_print,
                    textDirection: pw.TextDirection.rtl,
                    style: myStyle2,
                  ),
                  pw.Text(
                    'رقم الهاتف  : ',
                    textDirection: pw.TextDirection.rtl,
                    style: myStyle1,
                  ),
                  pw.SizedBox(
                    width: 8.0,
                  ),
                ],
              ),
              pw.Divider(color: PdfColor.fromRYB(0.0, 0.0, 0.300)),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.end,
                children: [
                  pw.Text(
                    whats_print,
                    textDirection: pw.TextDirection.rtl,
                    style: myStyle2,
                  ),
                  pw.Text(
                    'واتس اب  : ',
                    textDirection: pw.TextDirection.rtl,
                    style: myStyle1,
                  ),
                  pw.SizedBox(
                    width: 8.0,
                  ),
                ],
              ),
              pw.Divider(color: PdfColor.fromRYB(0.0, 0.0, 0.300)),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.end,
                children: [
                  pw.Text(
                    age_print,
                    textDirection: pw.TextDirection.rtl,
                    style: myStyle2,
                  ),
                  pw.Text(
                    'السن  : ',
                    textDirection: pw.TextDirection.rtl,
                    style: myStyle1,
                  ),
                  pw.SizedBox(
                    width: 8.0,
                  ),
                ],
              ),
              pw.Divider(color: PdfColor.fromRYB(0.0, 0.0, 0.300)),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.end,
                children: [
                  pw.Text(
                    adress_print,
                    textDirection: pw.TextDirection.rtl,
                    style: myStyle2,
                  ),
                  pw.Text(
                    'العنوان  : ',
                    textDirection: pw.TextDirection.rtl,
                    style: myStyle1,
                  ),
                  pw.SizedBox(
                    width: 8.0,
                  ),
                ],
              ),
              pw.Divider(color: PdfColor.fromRYB(0.0, 0.0, 0.300)),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.end,
                children: [
                  pw.Text(
                    docnum_print,
                    textDirection: pw.TextDirection.rtl,
                    style: myStyle2,
                  ),
                  pw.Text(
                    'اسم الطبيب  : ',
                    textDirection: pw.TextDirection.rtl,
                    style: myStyle1,
                  ),
                  pw.SizedBox(
                    width: 8.0,
                  ),
                ],
              ),
              pw.Divider(color: PdfColor.fromRYB(0.0, 0.0, 0.300)),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.end,
                children: [
                  pw.Text(
                    eror_print,
                    textDirection: pw.TextDirection.rtl,
                    style: myStyle2,
                  ),
                  pw.Text(
                    'الشكوي الرئيسيه  : ',
                    textDirection: pw.TextDirection.rtl,
                    style: myStyle1,
                  ),
                  pw.SizedBox(
                    width: 8.0,
                  ),
                ],
              ),
              pw.Divider(color: PdfColor.fromRYB(0.0, 0.0, 0.300)),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.center,
                children: [
                  pw.Text(
                    'التشخيص',
                    textDirection: pw.TextDirection.rtl,
                    style: myStyle1,
                  ),
                ],
              ),
              pw.Text(
                scane_print,
                textDirection: pw.TextDirection.rtl,
                style: myStyle2,
              ),
            ]);
          }),
    );

    return pdf.save();
  }
}
