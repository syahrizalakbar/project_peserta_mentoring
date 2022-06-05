part of 'pages.dart';

class CalculatorBmi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.back();
        return;
      },
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              color: primaryColor,
            ),
            SafeArea(
              child: Stack(
                children: [
                  Container(
                    color: screenColor,
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        HeaderWidgetComponent(
                          headerName: 'Menu C Calculator BMI',
                          onTap: () {
                            Get.back();
                          },
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        // Calculator Bmi
                        BmiCalculator(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BmiCalculator extends StatefulWidget {
  @override
  _BmiCalculatorState createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  double _heightOfUser = 100.0;
  double _weightOfUser = 40.0;

  double _bmi = 0;

  BMIModel _bmiModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 200,
            width: 200,
            child: Image.asset(
              "assets/images/heart.png",
              fit: BoxFit.contain,
              color: Colors.red,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "BMI Calculator",
            style: TextStyle(
                color: Colors.red[700],
                fontSize: 34,
                fontWeight: FontWeight.w700),
          ),
          Text(
            "We care about your health",
            style: TextStyle(
                color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 32,
          ),
          Text(
            "Height (cm)",
            style: TextStyle(
                color: Colors.grey, fontSize: 24, fontWeight: FontWeight.w400),
          ),
          Container(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Slider(
              min: 80.0,
              max: 250.0,
              onChanged: (height) {
                setState(() {
                  _heightOfUser = height.roundToDouble();
                });
              },
              value: _heightOfUser,
              divisions: 100,
              activeColor: Colors.pink,
              label: "$_heightOfUser",
            ),
          ),
          Text(
            "$_heightOfUser cm",
            style: TextStyle(
                color: Colors.red, fontSize: 18, fontWeight: FontWeight.w900),
          ),
          SizedBox(
            height: 24,
          ),
          Text(
            "Weight (kg)",
            style: TextStyle(
                color: Colors.grey, fontSize: 24, fontWeight: FontWeight.w400),
          ),
          Container(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Slider(
              min: 30.0,
              max: 120.0,
              onChanged: (height) {
                setState(() {
                  _weightOfUser = height.roundToDouble();
                });
              },
              value: _weightOfUser,
              divisions: 100,
              activeColor: Colors.pink,
              label: "$_weightOfUser",
            ),
          ),
          Text(
            "$_weightOfUser kg",
            style: TextStyle(
                color: Colors.red, fontSize: 18, fontWeight: FontWeight.w900),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            child: FlatButton.icon(
              onPressed: () {
                setState(() {
                  _bmi = _weightOfUser /
                      ((_heightOfUser / 100) * (_heightOfUser / 100));

                  if (_bmi >= 18.5 && _bmi <= 25) {
                    _bmiModel = BMIModel(
                        bmi: _bmi,
                        isNormal: true,
                        comments: "You are Totaly Fit");
                  } else if (_bmi < 18.5) {
                    _bmiModel = BMIModel(
                        bmi: _bmi,
                        isNormal: false,
                        comments: "You are Underweighted");
                  } else if (_bmi > 25 && _bmi <= 30) {
                    _bmiModel = BMIModel(
                        bmi: _bmi,
                        isNormal: false,
                        comments: "You are Overweighted");
                  } else {
                    _bmiModel = BMIModel(
                        bmi: _bmi, isNormal: false, comments: "You are Obesed");
                  }
                });

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultBmiPage(
                              bmiModel: _bmiModel,
                            )));
              },
              icon: Icon(
                Icons.favorite,
                color: Colors.white,
              ),
              label: Text("CALCULATE"),
              textColor: Colors.white,
              color: Colors.pink,
            ),
            width: double.infinity,
            padding: EdgeInsets.only(left: 16, right: 16),
          )
        ],
      ),
    );
  }
}
