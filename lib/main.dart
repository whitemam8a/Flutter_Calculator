import 'package:flutter/material.dart';
import 'package:hello_flutter/screens/Calculator_Page.dart';
import 'package:hello_flutter/screens/Converter_Page.dart';
import 'package:hello_flutter/screens/History_Page.dart';

void main() {
  runApp(My_Calculator());
}

class My_Calculator extends StatelessWidget {
  const My_Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Calculator',
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
        '/converter': (context) => ConverterPage(),
        '/history': (context) => HistoryPage(),
      },
      // home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
