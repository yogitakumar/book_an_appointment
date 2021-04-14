import 'package:book_an_appointment/pdfUpload.dart';
import 'package:flutter/material.dart';

import 'StartOption.dart';
import 'signIn.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Appointmnet Book',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home://PdfViewer(),
      StartOption(),
    );
  }
}
