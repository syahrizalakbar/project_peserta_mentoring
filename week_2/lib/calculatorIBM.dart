import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  TextEditingController _heightController = new TextEditingController();
  TextEditingController _weightController = new TextEditingController();

  var height = 0.0;
  var weight = 0.0;
  var pesan = "";
  calculate() {
    var bmi = (weight) / (height * height);

    if (bmi <= 17.0) {
      pesan = "Kurus, kekurangan berat badan berat";
    }
    if (bmi > 17.0 && bmi < 18.5) {
      pesan = "Kurus, kekurangan berat badan ringan";
    }
    if (bmi >= 18.5 && bmi < 25.0) {
      pesan = "Normal";
    }
    if (bmi >= 25.1 && bmi < 27.0) {
      pesan = "Gemuk, kelebihan berat badan tingkat ringan";
    }
    if (bmi >= 27.0) {
      pesan = "Gemuk, kelebihan berat badan tingkat berat";
    }
    return pesan;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                color: Colors.yellow,
                child: Text(
                  "CALCULATOR BMI",
                  style: TextStyle(fontSize: 30),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(10),
                color: Colors.yellow,
                child: TextFormField(
                  controller: _heightController,
                  autofocus: true,
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'Height',
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0))),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.all(10),
                color: Colors.yellow,
                child: TextFormField(
                  controller: _weightController,
                  autofocus: true,
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'Weight',
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0))),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 20,
              ),
              MaterialButton(
                padding: EdgeInsets.fromLTRB(130, 20, 130, 20),
                minWidth: 250,
                color: Colors.blue,
                child: Text(
                  "Calculate",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  setState(() {
                    height = double.parse(_heightController.text);
                    weight = double.parse(_weightController.text);
                    calculate();
                  });
                },
              ),
              SizedBox(
                height: 10,
              ),
              Text(pesan),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ));
  }
}
