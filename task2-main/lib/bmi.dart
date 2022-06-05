import 'package:flutter/material.dart';
import 'package:task2/login.dart';

class Bmi extends StatefulWidget {
  @override
  _BmiState createState() => _BmiState();
}

class _BmiState extends State<Bmi> {
  final _heightController = TextEditingController();

  final _weightController = TextEditingController();

  double _bmi;
  String _message = 'Please enter your height an weight';

  void _calculate() {
    final double height = double.tryParse(_heightController.value.text);
    final double weight = double.tryParse(_weightController.value.text);

    if (height <= 0 || weight <= 0) {
      setState(() {
        _message = "Your height and weigh must be positive numbers";
      });
      return;
    }

    setState(() {
      _bmi = weight / (height * height);
      if (_bmi >= 28) {
        _message = "Obese";
      } else if (_bmi >= 23) {
        _message = 'Overweight';
      } else if (_bmi >= 17.5) {
        _message = 'Normal';
      } else {
        _message = 'Underweight';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              curve: Curves.easeInOut,
              child: Text(
                "Menu",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
                title: Text("Logout"),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Login(),
                    ),
                  );
                }),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("BMI"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.all(10),
                // color: Colors.blue[700],
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: _heightController,
                        keyboardType: TextInputType.number,
                        maxLength: 3,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        decoration: InputDecoration(
                            suffix: Text('cm'),
                            filled: true,
                            hintText: 'Tinggi'),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextField(
                        controller: _weightController,
                        keyboardType: TextInputType.number,
                        maxLength: 3,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        decoration: InputDecoration(
                            suffix: Text('kg'),
                            filled: true,
                            hintText: 'Berat'),
                      ),
                    ),
                  ],
                )),
            Container(
              //height: double.infinity,
              margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
              child: RaisedButton(
                onPressed: () {
                  _calculate();
                },
                padding: EdgeInsets.all(4),
                color: Colors.blue,
                child: Text(
                  'HITUNG BMI',
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 34),
            Container(
              child: Text(
                _bmi == null ? 'No Result' : _bmi.toStringAsFixed(2),
                style: TextStyle(fontSize: 30),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: Text(
                _message,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
