import 'package:flutter/material.dart';

class Plant extends StatefulWidget {
  const Plant({Key? key}) : super(key: key);

  @override
  _PlantState createState() => _PlantState();
}

class _PlantState extends State<Plant> {
  int a = 0;

  Future dating() async {
    DateTime? date = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now());
    var data2 = DateTime.now();
    var data3 = data2.difference(date!).inDays;
    setState(() {});
    a = data3;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Date Calculator'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  const Text('Choose Your Date'),
                  FloatingActionButton(
                    onPressed: dating,
                    child: const Icon(Icons.post_add_rounded),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        const Text('Days : '),
                        Text('$a days'),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text('Years : '),
                        Text('${(a / 365).toStringAsFixed(2)} Years'),
                      ],
                    ),
                  )
                ],
              ),
            ]),
      ),
    );
  }
}
