import 'package:flutter/material.dart';
import '../controllers/sp_helper.dart';
import '../models/calculations.dart';

class PrevCalcScreen extends StatefulWidget {
  const PrevCalcScreen({Key? key}) : super(key: key);

  @override
  _PrevCalcScreenState createState() => _PrevCalcScreenState();
}

class _PrevCalcScreenState extends State<PrevCalcScreen> {
  List<Calculations> sessions = [];
  //final TextEditingController txtEquation = TextEditingController();
  final SPCalcResult helper = SPCalcResult();

  @override
  void initState() {
    helper.init().then((value) {
      updateScreen();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Calc History'),
      ),
      body: ListView(children: getContent()),
      
    );
  }
  //  Future<dynamic> showSessionDialog(BuildContext context) async {
  //   return showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //             title: const Text('Insesrt Training Session'),
  //             content: SingleChildScrollView(
  //                 child: Column(children: [
  //               TextField(
  //                 controller: txtDescription,
  //                 decoration: const InputDecoration(hintText: 'Description'),
  //               ),
  //               TextField(
  //                 controller: txtDuration,
  //                 decoration: const InputDecoration(hintText: 'Duration'),
  //               )
  //             ])),
  //             actions: [
  //               TextButton(
  //                 child: const Text('Cancel'),
  //                 onPressed: () {
  //                   Navigator.pop(context);
  //                   txtDescription.text = '';
  //                   txtDuration.text = '';
  //                 },
  //               ),
  //               ElevatedButton(
  //                 child: const Text('Save'),
  //                 onPressed: saveSession,
  //               ),
  //             ]);
  //       });
  // }

  

  List<Widget> getContent() {
    List<Widget> tiles = [];
    sessions.forEach((session) {
      tiles.add(Dismissible(
        key: UniqueKey(),
        onDismissed: (_) {
          helper.deleteSession(session.id).then((value) => updateScreen());
        },
        child: ListTile(
          title: Text('${session.expression}=${session.calcHistory}'),
          subtitle:
              Text('${session.date}'),
        ),
      ));
    });
    return tiles;
  }

  void updateScreen() {
    sessions = helper.getSessions();
    setState(() {});
  }
}
