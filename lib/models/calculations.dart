//model class for calkulations
class Calculations {
  int id = 0;
  double calcHistory = 0;
  String date = '';
  String expression = '';

//unnamed constructor
  Calculations(this.id, this.date, this.calcHistory, this.expression);

  //named constructor to create Json object from map
  Calculations.fromJson(Map<String, dynamic> sessionMap) {
    id = sessionMap['id'] ?? 0;
    date = sessionMap['date'] ?? '';
    calcHistory = sessionMap['calcHistory'] ?? 0;
    expression = sessionMap['expression'] ?? '';
  }

  //named constructor to make calculation object to map object
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date,
      'calcHistory': calcHistory,
      'expression': expression,
    };
  }
}
