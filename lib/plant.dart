import 'package:flutter/material.dart';

class Plant extends StatefulWidget {
  const Plant({Key? key}) : super(key: key);

  @override
  _PlantState createState() => _PlantState();
}

class _PlantState extends State<Plant> {
  int a = 0;
  double years = 0;

  Future getDate() async {
    DateTime? date = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now());
    if (date == null) return;
    a = DateTime.now().difference(date).inDays;
    years = ((a / 1460) / 366) + (a / 365);
    setState(() {});
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
                    onPressed: getDate,
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
                        Text('${years.toStringAsFixed(2)} Years'),
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
