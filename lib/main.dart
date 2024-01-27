import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Calculator',
      theme: ThemeData(
          // primarySwatch: Colors.black,
          ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _display = '0';
  double _num1 = 0;
  double _num2 = 0;
  double _result = 0;
  String _operator = '';

  void _buttonPressed(String buttonText) {
    if (buttonText == 'AC') {
      _display = '0';
      _num1 = 0.0;
      _num2 = 0.0;
      _result = 0.0;
      _operator = '';
    } else if (buttonText == '+' ||
        buttonText == '-' ||
        buttonText == '*' ||
        buttonText == '/') {
      _num1 = double.parse(_display);
      _operator = buttonText;
      _display = '0';
    } else if (buttonText == '=') {
      _num2 = double.parse(_display);
      switch (_operator) {
        case '+':
          _result = _num1 + _num2;
          break;
        case '-':
          _result = _num1 - _num2;
          break;
        case '*':
          _result = _num1 * _num2;
          break;
        case '/':
          _result = _num1 / _num2;
          break;
      }
      _display = _result.toString();
    } else {
      _display = _display == '0' ? buttonText : _display + buttonText;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        title: const Text('Flutter Calculator',
            style: TextStyle(color: Colors.white)),
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Text(
              _display,
              style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 4,
              children: List.generate(
                16,
                (index) {
                  return Center(
                    child: TextButton(
                      child: Text(
                        _buttons[index],
                        style:
                            const TextStyle(fontSize: 24, color: Colors.white),
                      ),
                      onPressed: () {
                        _buttonPressed(_buttons[index]);
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<String> _buttons = [
  'AC',
  ' ',
  ' ',
  '=',
  '7',
  '8',
  '9',
  '*',
  '4',
  '5',
  '6',
  '-',
  '1',
  '2',
  '3',
  '+',
  '0',
  '/',
];
