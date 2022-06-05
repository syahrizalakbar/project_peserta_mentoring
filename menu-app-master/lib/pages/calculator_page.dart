part of 'pages.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();

  double? _result;

  @override
  Widget build(BuildContext context) {
    void calculateBMI() {
      double height = double.parse(heightController.text) / 100;
      double weight = double.parse(weightController.text);

      double heightSquare = height * height;
      double result = weight / heightSquare;

      _result = result;

      setState(() {});
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 24),
        child: Column(
          children: <Widget>[
            InputTextField(
              controller: heightController,
              title: 'Height',
              hintText: 'Height in cm',
              typeNumber: true,
              suffixIcon: Icon(Icons.height_rounded),
            ),
            InputTextField(
              controller: weightController,
              title: 'Weight',
              hintText: 'Weight in kg',
              typeNumber: true,
              suffixIcon: Icon(Icons.line_weight_rounded),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Row(
                children: [
                  Text('Result: '),
                  Text(
                    _result != null ? "${_result!.toStringAsFixed(2)}" : "0.0",
                    style: blueFontStyleBold.copyWith(fontSize: 20),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: CustomMyButton(
                    btnColor: mainBlueColor,
                    title: 'Calculate',
                    onPressedBtn: calculateBMI,
                  ),
                ),
                Expanded(
                  child: CustomMyButton(
                    btnColor: yellowColor,
                    title: 'Clear',
                    textColor: mainBlueColor,
                    onPressedBtn: () {
                      setState(() {
                        heightController.clear();
                        weightController.clear();
                        _result = null;
                      });
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
