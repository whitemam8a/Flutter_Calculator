import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hello_flutter/widgets/NavBar.dart';
import 'package:hello_flutter/widgets/callButtons.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:intl/intl.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String display = "0"; //Уравнение
  String expression = ""; //Выражение

  void saveExpression(String expression, String result) async {
    CollectionReference history =
        FirebaseFirestore.instance.collection('History');

    // Получаем текущее время
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd HH:mm').format(now);

    // Создаем новый документ в коллекции "history" с данными о выражении и его результате
    await history.add({
      'date': formattedDate,
      'expression': expression,
      'result': result,
    });
  }

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
          saveExpression(expression, display.toString());
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        title: const Text('Flutter Calculator',
            style: TextStyle(color: Colors.white)),
        iconTheme:
            const IconThemeData(color: Color.fromARGB(255, 255, 255, 255)),
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
                    callButtons(
                        "AC",
                        Colors.black,
                        70,
                        const Color.fromARGB(255, 150, 150, 150),
                        buttonPressed),
                    callButtons("=", Colors.white, 70,
                        const Color.fromARGB(255, 236, 169, 76), buttonPressed),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                // second row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    callButtons(
                        "7",
                        Colors.black,
                        60,
                        const Color.fromARGB(255, 135, 135, 135),
                        buttonPressed),
                    callButtons(
                        "8",
                        Colors.black,
                        60,
                        const Color.fromARGB(255, 135, 135, 135),
                        buttonPressed),
                    callButtons(
                        "9",
                        Colors.black,
                        60,
                        const Color.fromARGB(255, 135, 135, 135),
                        buttonPressed),
                    callButtons(
                        "÷",
                        Colors.white,
                        60,
                        const Color.fromARGB(255, 254, 106, 106),
                        buttonPressed),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                // third row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    callButtons(
                        "4",
                        Colors.black,
                        60,
                        const Color.fromARGB(255, 135, 135, 135),
                        buttonPressed),
                    callButtons(
                        "5",
                        Colors.black,
                        60,
                        const Color.fromARGB(255, 135, 135, 135),
                        buttonPressed),
                    callButtons(
                        "6",
                        Colors.black,
                        60,
                        const Color.fromARGB(255, 135, 135, 135),
                        buttonPressed),
                    callButtons(
                        "×",
                        Colors.white,
                        60,
                        const Color.fromARGB(255, 254, 106, 106),
                        buttonPressed),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                // forth row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    callButtons(
                        "1",
                        Colors.black,
                        60,
                        const Color.fromARGB(255, 135, 135, 135),
                        buttonPressed),
                    callButtons(
                        "2",
                        Colors.black,
                        60,
                        const Color.fromARGB(255, 135, 135, 135),
                        buttonPressed),
                    callButtons(
                        "3",
                        Colors.black,
                        60,
                        const Color.fromARGB(255, 135, 135, 135),
                        buttonPressed),
                    callButtons(
                        "-",
                        Colors.white,
                        60,
                        const Color.fromARGB(255, 254, 106, 106),
                        buttonPressed),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                // fifth row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    callButtons(
                        "0",
                        Colors.black,
                        235,
                        const Color.fromARGB(255, 135, 135, 135),
                        buttonPressed),
                    callButtons(
                        "+",
                        Colors.white,
                        60,
                        const Color.fromARGB(255, 254, 106, 106),
                        buttonPressed),
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
