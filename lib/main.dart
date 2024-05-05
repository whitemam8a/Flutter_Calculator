import 'package:flutter/material.dart';
import 'package:hello_flutter/screens/сalculator_Page.dart';
import 'package:hello_flutter/screens/Converter_Page.dart';
import 'package:hello_flutter/screens/History_Page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const My_Calculator());
}

class My_Calculator extends StatelessWidget {
  const My_Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Calculator',
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(),
        '/converter': (context) => const ConverterPage(),
        '/history': (context) => const HistoryPage(),
      },
      // home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
