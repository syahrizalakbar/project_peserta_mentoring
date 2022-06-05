import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'bmiresult.dart';
import 'bmiresultfemale.dart';

enum Gender { Male, Female }

Gender gender;
int Height = 180;
int Weight = 50;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: Card_bmi(
                        Onpressed: () {
                          setState(() {
                            gender = Gender.Male;
                          });
                        },
                        Card_color: gender == Gender.Male
                            ? Colors.blueAccent
                            : Color(0xff50F1FB),
                        Card_child: Card_detail(
                            iconname: FontAwesomeIcons.male, Label: "MALE"))),
                Expanded(
                    child: Card_bmi(
                        Onpressed: () {
                          setState(() {
                            gender = Gender.Female;
                          });
                        },
                        Card_color: gender == Gender.Female
                            ? Colors.blueAccent
                            : Color(0xff50F1FB),
                        Card_child: Card_detail(
                            iconname: FontAwesomeIcons.female,
                            Label: "FEMALE"))),
              ],
            ),
          ),
          Expanded(
              child: Card_bmi(
            Card_child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'HEIGHT',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(Height.toString(),
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.w900)),
                    Text('cm', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w900)),
                  ],
                ),
                SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: Color(0xff0085FF),
                      overlayColor: Colors.white,
                      activeTrackColor: Colors.blueAccent,
                      inactiveTickMarkColor: Colors.white,
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                        min: 100,
                        max: 250,
                        value: Height.toDouble(),
                        onChanged: (double value) {
                          setState(() {
                            Height = value.round();
                          });
                        }))
              ],
            ),
            Card_color: Color(0xff50F1FB),
          )),
          Expanded(
              child: Card_bmi(
                Card_child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'WEIGHT',
                      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(Weight.toString(),
                            style: TextStyle(
                                fontSize: 40, fontWeight: FontWeight.w900)),
                        Text('cm', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w900)),
                      ],
                    ),
                    SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          thumbColor: Color(0xff0085FF),
                          overlayColor: Colors.white,
                          activeTrackColor: Colors.blueAccent,
                          inactiveTickMarkColor: Colors.white,
                          thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                        ),
                        child: Slider(
                            min: 10,
                            max: 120,
                            value: Weight.toDouble(),
                            onChanged: (double value) {
                              setState(() {
                                Weight = value.round();
                              });
                            }))
                  ],
                ),
                Card_color: Color(0xff50F1FB),
              )),
          Container(
            child: RaisedButton(
              onPressed: () {
                if ( gender == Gender.Male ){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BMIResultMale(tinggi_badan: Height, berat_badan: Weight)),
                  );
                } else if ( gender == Gender.Female ){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BMIResultFemale(tinggi_badan: Height, berat_badan: Weight)),
                  );
                }
              },
              padding: EdgeInsets.only(top: 10),
              color: Colors.blueAccent,
              // textColor: Colors.white,
              child: Text(
                'CALCULATE BMI',
                style:
                TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Card_detail extends StatelessWidget {
  final String Label;
  final IconData iconname;

  Card_detail({@required this.iconname, @required this.Label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconname,
          size: 80,
        ),
        SizedBox(height: 20),
        Text(Label, style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700))
      ],
    );
  }
}

class Card_bmi extends StatelessWidget {
  final Color Card_color;
  final Widget Card_child;
  final Function Onpressed;

  Card_bmi({@required this.Card_color, this.Card_child, this.Onpressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: Onpressed,
      child: Container(
        child: Card_child,
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: Card_color, borderRadius: BorderRadius.circular(15.0)),
      ),
    );
  }
}
