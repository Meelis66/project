import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:km_to_miles_proov/controllers/calculator_controller.dart';
import 'package:km_to_miles_proov/controllers/sp_helper.dart';

class CalcScreen extends StatefulWidget {
  @override
  _CalcScreenState createState() => _CalcScreenState();
}

class _CalcScreenState extends State<CalcScreen> {
  CalcController calc = CalcController();  
  final SPCalcResult helper = SPCalcResult();

  buttonPressed(String buttonText) {
    setState(() {
      calc.calculate(buttonText);
    });
  }

  @override
  void initState() {
    helper.init().then((value) {});
    super.initState();
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Calculator'),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.of(context).pushNamed("/converter"),
            child: Text("Converter"),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(
              calc.equation,
              style: TextStyle(fontSize: 38),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(
              calc.result,
              style: TextStyle(fontSize: 48),
            ),
          ),
          Expanded(child: Divider()),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.75,
                child: Table(
                  children: [
                    TableRow(
                        children: ["C", "←", "÷"]
                            .map<CalculatorButtonWidget>(
                                (el) => CalculatorButtonWidget(
                                      buttonText: el,
                                      buttonHeight: 1,
                                      onPressed: () => buttonPressed(el),
                                      buttonColor: Colors.grey,
                                    ))
                            .toList()),
                    TableRow(
                        children: ["7", "8", "9"]
                            .map<CalculatorButtonWidget>(
                                (el) => CalculatorButtonWidget(
                                      buttonText: el,
                                      buttonHeight: 1,
                                      onPressed: () => buttonPressed(el),
                                    ))
                            .toList()),
                    TableRow(
                        children: ["6", "5", "4"]
                            .map<CalculatorButtonWidget>(
                                (el) => CalculatorButtonWidget(
                                      buttonText: el,
                                      buttonHeight: 1,
                                      onPressed: () => buttonPressed(el),
                                    ))
                            .toList()),
                    TableRow(
                        children: ["1", "2", "3"]
                            .map<CalculatorButtonWidget>(
                                (el) => CalculatorButtonWidget(
                                      buttonText: el,
                                      buttonHeight: 1,
                                      onPressed: () => buttonPressed(el),
                                    ))
                            .toList()),
                    TableRow(
                      children: [",", "0", "="]
                          .map<CalculatorButtonWidget>(
                              (el) => CalculatorButtonWidget(
                                    buttonText: el,
                                    buttonHeight: 1,
                                    onPressed: () => buttonPressed(el),
                                  ))
                          .toList(),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                child: Table(children: [
                  TableRow(children: [
                    CalculatorButtonWidget(
                      buttonText: "*",
                      buttonHeight: 1,
                      onPressed: () => buttonPressed("*"),
                      buttonColor: Colors.orangeAccent,
                    )
                  ]),
                  TableRow(children: [
                    CalculatorButtonWidget(
                      buttonText: "-",
                      buttonHeight: 1,
                      onPressed: () => buttonPressed("-"),
                      buttonColor: Colors.orangeAccent,
                    )
                  ]),
                  TableRow(children: [
                    CalculatorButtonWidget(
                      buttonText: "^",
                      buttonHeight: 1,
                      onPressed: () => buttonPressed("^"),
                      buttonColor: Colors.orangeAccent,
                    )
                  ]),
                  TableRow(children: [
                    CalculatorButtonWidget(
                      buttonText: "+",
                      buttonHeight: 2,
                      onPressed: () => buttonPressed("+"),
                      buttonColor: Colors.orangeAccent,
                    )
                  ]),
                ]),
              )
            ],
          )
        ],
      ),
          );
  }
}

class CalculatorButtonWidget extends StatelessWidget {
  const CalculatorButtonWidget(
      {Key? key,
      this.buttonText = '',
      this.buttonHeight = 1,
      this.buttonColor = Colors.black,
      this.onPressed})
      : super(key: key);
  final String buttonText;
  final double buttonHeight;
  final Color buttonColor;
  final String? Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1 * buttonHeight,
      color: buttonColor,
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0),
          side: BorderSide(
              color: Colors.white, width: 1, style: BorderStyle.solid),
        ),
        padding: EdgeInsets.all(16.0),
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
