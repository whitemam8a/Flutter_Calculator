import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(My_Calculator());
}

class My_Calculator extends StatelessWidget {
  const My_Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Calculator',
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String display = "0"; //Уравнение
  String expression = ""; //Выражение

  buttonPressed(btnText) {
    setState(() {
      if (btnText == "AC") {
        display = "0";
      } else if (btnText == "=") {
        expression = display;
        expression = expression.replaceAll("×", "*");
        expression = expression.replaceAll("÷", "/");

        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);
          ContextModel cm = ContextModel();
          display = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          'Error';
        }
      } else {
        if (display == "0") {
          display = btnText;
        } else
          display = display + btnText;
      }
    });
  }

  Widget callButtons(
      String btnText, Color txtColor, double btnWidth, Color btnColor) {
    return InkWell(
      onTap: () {
        buttonPressed(btnText);
      },
      child: Container(
        alignment: Alignment.center,
        height: 50,
        width: btnWidth,
        decoration: BoxDecoration(
            color: btnColor, borderRadius: BorderRadius.circular(53)),
        child: Text(btnText,
            style: TextStyle(
                color: txtColor, fontSize: 30, fontWeight: FontWeight.w500)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        title: const Text('Flutter Calculator',
            style: TextStyle(color: Colors.white)),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            height: 100,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: SingleChildScrollView(
              child: Text(
                display,
                style: const TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                // first row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    callButtons("AC", Colors.black, 70,
                        Color.fromARGB(255, 150, 150, 150)),
                    callButtons("=", Colors.white, 70,
                        Color.fromARGB(255, 236, 169, 76)),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                // second row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    callButtons("7", Colors.black, 60,
                        const Color.fromARGB(255, 135, 135, 135)),
                    callButtons("8", Colors.black, 60,
                        const Color.fromARGB(255, 135, 135, 135)),
                    callButtons("9", Colors.black, 60,
                        const Color.fromARGB(255, 135, 135, 135)),
                    callButtons("÷", Colors.white, 60,
                        const Color.fromARGB(255, 254, 106, 106)),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                // third row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    callButtons("4", Colors.black, 60,
                        const Color.fromARGB(255, 135, 135, 135)),
                    callButtons("5", Colors.black, 60,
                        const Color.fromARGB(255, 135, 135, 135)),
                    callButtons("6", Colors.black, 60,
                        const Color.fromARGB(255, 135, 135, 135)),
                    callButtons("×", Colors.white, 60,
                        const Color.fromARGB(255, 254, 106, 106)),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                // forth row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    callButtons("1", Colors.black, 60,
                        const Color.fromARGB(255, 135, 135, 135)),
                    callButtons("2", Colors.black, 60,
                        const Color.fromARGB(255, 135, 135, 135)),
                    callButtons("3", Colors.black, 60,
                        const Color.fromARGB(255, 135, 135, 135)),
                    callButtons("-", Colors.white, 60,
                        const Color.fromARGB(255, 254, 106, 106)),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                // fifth row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    callButtons("0", Colors.black, 235,
                        const Color.fromARGB(255, 135, 135, 135)),
                    callButtons("+", Colors.white, 60,
                        Color.fromARGB(255, 254, 106, 106)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
