import 'package:flutter/material.dart';

import '../provider/data.dart';

class Suivi extends StatefulWidget {
  const Suivi({Key? key}) : super(key: key);

  @override
  State<Suivi> createState() => _SuiviState();
}

class _SuiviState extends State<Suivi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: generateList(),
      ),
    );
  }
}
List<Widget> generateList() {
  var pressures = List<Pressure>.from(listPressure);
  List<Widget> elements = [];
  for (var i = 0; i < pressures.length; i++) {
    var pressure = pressures[i];

    elements.add(
      Card(
        margin: EdgeInsets.all(8),
        shadowColor: Color.fromARGB(100, 253, 0, 0),
        color: Color.fromARGB(255, 202, 219, 255),
        elevation: 10,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              width: double.infinity,
              child: Text(
                "Fait le : " +
                    pressure.date.day.toString() +
                    "/" +
                    pressure.date.month.toString() +
                    "/" +
                    pressure.date.year.toString() +
                    " a " +
                    pressure.date.hour.toString() +
                    "h" +
                    pressure.date.minute.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    backgroundColor: Color.fromARGB(255, 202, 219, 255)),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
            child: Row(
              children: [
                const Text("Tension : "),
                Text(pressure.sys.toString() + " / "),
                Text(pressure.pouls.toString() + "/"),
                const Text(". Pulsation : "),
                Text(pressure.dias.toString()),
              ],
            ),
          )
        ]),
      ),
    );
  }
  return elements;
}
