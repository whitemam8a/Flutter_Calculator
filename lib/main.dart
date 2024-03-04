import 'package:flutter/material.dart';
import 'package:hello_flutter/NavBar.dart';
import 'package:hello_flutter/screens/Calculator_Page.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:hello_flutter/screens/Converter_Page.dart';

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
      },
      // home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
