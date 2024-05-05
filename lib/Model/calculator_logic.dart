import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Calculator_Logic {
  String display = "0"; //Уравнение
  String expression = ""; //Выражение

  void deleteAllData() async {
    CollectionReference history =
        FirebaseFirestore.instance.collection('History');
    QuerySnapshot querySnapshot = await history.get();
    querySnapshot.docs.forEach((doc) {
      doc.reference.delete();
    });
  }

  void saveExpression(String expression, String result) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd HH:mm')
        .format(now); // Форматируем текущую дату и время
    List<String> expressions = prefs.getStringList('expressions') ?? [];
    String data = '$expression | $result | $formattedDate';
    expressions.add(data);
    await prefs.setStringList('expressions', expressions);
  }

  buttonPressed(btnText) {
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
  }
}
