import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:km_to_miles_proov/screens/calc_screen.dart';
import 'package:km_to_miles_proov/screens/converter_screen.dart';
import 'package:km_to_miles_proov/screens/intro_screen.dart';
import 'package:km_to_miles_proov/screens/notes.dart';
import 'package:km_to_miles_proov/screens/prev_calc_list.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: buildMenuItems(context),
      ),
    );
  }

  List<Widget> buildMenuItems(BuildContext context) {
    final List<String> menuTitles = [
      'Home',
      'Simple Calculator',
      'Converter',
      'Calc History',
      'SQLite Calc History',
    ];

    List<Widget> menuItems = [];
    menuItems.add(const DrawerHeader(
        decoration: BoxDecoration(color: Colors.blueGrey),
        child: Text(
          'Aastalõputöö',
          style: TextStyle(color: Colors.white, fontSize: 28),
        )));
    menuTitles.forEach((String element) {
      Widget screen = Container();
      menuItems.add(ListTile(
        title: Text(element, style: const TextStyle(fontSize: 18)),
        onTap: () {
          switch (element) {
            case 'Home':
              screen = const IntroScreen();
              break;

            case 'Simple Calculator':
              screen = CalcScreen();
              break;

            case 'Converter':
              screen = ConverterScreen();
              break;

            case 'Calc History':
              screen = PrevCalcScreen();
              break;
            case 'SQLite Calc History':
              screen = NotesScreen();
              break;
          }
          Navigator.of(context).pop();
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => screen));
        },
      ));
    });
    return menuItems;
  }
}
