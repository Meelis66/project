import 'package:intl/intl.dart';
import 'package:km_to_miles_proov/controllers/sp_helper.dart';
import 'package:km_to_miles_proov/models/calculations.dart';
import 'package:km_to_miles_proov/services/math_expressions.dart';

// Future saveSession() async {
//     DateTime now = DateTime.now();
//     String today = '${now.year}-${now.month}-${now.day}';
//     int id = helper.getCounter() + 1;
//     Calculations newSession =
//         Calculations(id, today, double.tryParse(calc.result) ?? 0);
//     helper.writeSession(newSession).then((_) {
//       helper.setCounter();
//     });
//     txtEquation.text = '';
//     //   txtDuration.text = '';
//     //   Navigator.pop(context);
//   }
class CalcController {
  String equation = "0";
  String result = "0";
  String expression = "";
  final SPCalcResult helper = SPCalcResult();

  saveSession(String result, String equation) async {
    helper.init().then((value) {});
    DateTime now = DateTime.now();
    //String today = '${now.year}-${now.month}-${now.day}';
    String nowAsString = DateFormat('yyyy-MM-dd hh:mm:ss').format(now);
    int id = helper.getCounter() + 1;
    Calculations newSession =
        Calculations(id, nowAsString, double.tryParse(result) ?? 0, equation);
    helper.writeSession(newSession).then((_) {
      helper.setCounter();
    });
    //txtEquation.text = '';
    //   txtDuration.text = '';
    //   Navigator.pop(context);
  }

  calculate(String input) {
    if (input == "C") {
      equation = "0";
      result = "0";
    } else if (input == "←") {
      equation = equation.substring(0, equation.length - 1);
      if (equation == "") {
        equation = "0";
      }
    } else if (input == "=") {
      expression = equation;
      //expression = equation.replaceAll('×', '*'); //Ei toimi millegipärast
      expression = equation.replaceAll('÷', '/');

      result = MathExprApi.evaluateExpr(expression);
      saveSession(result, expression);
    } else {
      if (equation == "0") {
        equation = input;
      } else {
        equation = equation + input;
      }
    }
  }
}
