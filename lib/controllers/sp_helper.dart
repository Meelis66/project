import 'package:shared_preferences/shared_preferences.dart';
import '../models/calculations.dart';
import 'dart:convert';

//this class is interface between code and shared prefences
class SPCalcResult {
  //instance of SP
  static late SharedPreferences prefs;
//method to create instance
  Future init() async {
    //SharedPreferences.setMockInitialValues({});
    prefs = await SharedPreferences.getInstance();
  }

  //writes new method in to SP
  Future writeSession(Calculations session) async {
    //transform map in to String and session to Map
    prefs.setString(session.id.toString(), json.encode(session.toJson()));
  }
  Future writeSessionString(Calculations session) async {
    //transform map in to String and session to Map
    prefs.setString(session.id.toString(), json.encode(session.toJson()));
  }

  List<Calculations> getSessions() {
    List<Calculations> sessions = [];
    Set<String> keys = prefs.getKeys();
    keys.forEach((String key) {
      if (key != 'counter') {
        Calculations session =
            Calculations.fromJson(json.decode(prefs.getString(key) ?? ''));
        sessions.add(session);
      }
    });
    return sessions;
  }

  Future setCounter() async {
    int counter = prefs.getInt('counter') ?? 0;
    counter++;
    await prefs.setInt('counter', counter);
  }

  int getCounter() {
    return prefs.getInt('counter') ?? 0;
  }

  Future deleteSession(int id) async {
    prefs.remove(id.toString());
  }
}
