import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage>{
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  double _result;

  void calculateBMI(){
    double height = double.parse(_heightController.text)/100;
    double weight = double.parse(_weightController.text);

    double result = weight / (height*height);
    print(result);

    setState(() {
      _result = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator")
      ),
      drawer: Drawer(
        elevation: 1.5,
        child: Column(
          children: <Widget>[
            DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.orange
                ),
            ),
            Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    ListTile(
                      title: Text("Setting"),
                      leading: Icon(Icons.settings),
                      onTap: (){},
                    ),
                    ListTile(
                      title: Text("Log out"),
                      leading: Icon(Icons.exit_to_app),
                      onTap: (){
                        Navigator.of(context).pushNamed('/login_page');
                      },
                    )
                  ],
                )
            )
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child:Column(
          children: <Widget>[
            TextField(
              controller: _heightController,
              decoration: InputDecoration(
                labelText: 'Height in cm',
                icon: Icon(Icons.trending_up),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _weightController,
              decoration: InputDecoration(
                labelText: 'Weight in kg',
                icon: Icon(Icons.line_weight),
              ),
            ),
            SizedBox(height: 15),
            RaisedButton(
              color: Colors.orange,
              child: Text(
                "Calculate",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                // ignore: unnecessary_statements
                calculateBMI();
              }
            ),
            SizedBox(height: 15),
            Text(
              _result == null ? "Enter value" : "BMI: ${_result.toStringAsFixed(2)}",
              style: TextStyle(
                color: Colors.orange,
                fontSize: 19.4,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        )
      )
    );


  }
}