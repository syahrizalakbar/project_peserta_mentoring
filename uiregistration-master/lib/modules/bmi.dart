import 'package:flutter/material.dart';
import 'package:sk_alert_dialog/sk_alert_dialog.dart';

class Bmi extends StatefulWidget {
  const Bmi({
    Key key,
  }) : super(key: key);

  @override
  _BmiState createState() => _BmiState();
}

class _BmiState extends State<Bmi> {
  TextEditingController jkController = TextEditingController();
  TextEditingController beratController = TextEditingController();
  TextEditingController tinggiController = TextEditingController();
  String dropdownValue = 'Laki-Laki';
  String jk = 'Laki-Laki', status = "";
  int berat = 0, tinggi = 0;
  double hasil = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                  child: Container(
                margin: EdgeInsets.all(20),
                child: Text(
                  'Kalkulator BMI',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              )),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Jenis Kelamin',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  )),
              SizedBox(
                height: 5,
              ),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.withOpacity(0.3),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 0.0, style: BorderStyle.none),
                  ),
                  // prefixIcon: Icon(Icons.mail_outline),
                ),
                value: dropdownValue,
                icon: const Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                // style: const TextStyle(color: Colors.deepPurple),
                onChanged: (String newValue) {
                  print('Jenis Kelamin Hasil Klik' + newValue);
                  setState(() {
                    jk = newValue;
                  });
                },
                items: <String>['Laki-Laki', 'Perempuan']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Berat Badan (kg)',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  )),
              SizedBox(
                height: 5,
              ),
              TextField(
                controller: beratController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.withOpacity(0.3),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 0.0, style: BorderStyle.none),
                  ),
                  hintText: '0',
                  // prefixIcon: Icon(Icons.mail_outline),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Tinggi Badan (cm)',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  )),
              SizedBox(
                height: 5,
              ),
              TextField(
                controller: tinggiController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.withOpacity(0.3),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 0.0, style: BorderStyle.none),
                  ),
                  hintText: '0',
                  // prefixIcon: Icon(Icons.lock),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: RaisedButton(
                    color: Color.fromRGBO(251, 97, 0, 1),
                    child: Text(
                      'CEK BMI',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    onPressed: () {
                      String jk1 = "", status1 = "";
                      berat = int.tryParse(beratController.text) ?? 0;
                      tinggi = int.tryParse(tinggiController.text) ?? 0;
                      if (berat <= 0 || tinggi <= 0) {
                        SKAlertDialog.show(
                          context: context,
                          type: SKAlertType.info,
                          title: 'Nilai Masih Kosong',
                          message: 'Berat Badan atau ' +
                              '\n Tinggi Badan Masih Kosong ',
                          onOkBtnTap: (value) {
                            print('Okay Button Tapped');
                          },
                        );
                      } else {
                        hasil = berat / ((tinggi / 100) * (tinggi / 100));
                        if (jk == 'Laki-Laki') {
                          if (hasil < 17) {
                            status1 = 'Kurus';
                          } else if (hasil < 23) {
                            status1 = 'Ideal';
                          } else if (hasil < 27) {
                            status1 = 'Gemuk';
                          } else {
                            status1 = 'Obesitas';
                          }
                        } else {
                          if (hasil < 18) {
                            status1 = 'Kurus';
                          } else if (hasil < 25) {
                            status1 = 'Ideal';
                          } else if (hasil < 27) {
                            status1 = 'Gemuk';
                          } else {
                            status1 = 'Obesitas';
                          }
                        }
                        setState(() {
                          status = status1;
                        });
                        SKAlertDialog.show(
                          context: context,
                          type: SKAlertType.info,
                          title: 'Hasil',
                          message: 'Jenis Kelamin: ' +
                              jk +
                              '\n'
                                  'Berat Badan: ' +
                              berat.toString() +
                              ' kg \n'
                                  'Tinggi Badan: ' +
                              tinggi.toString() +
                              ' cm \n'
                                  'BMI: ' +
                              hasil.toStringAsFixed(2) +
                              ' kg/m2 \n'
                                  'Status: ' +
                              status,
                          onOkBtnTap: (value) {
                            print('Okay Button Tapped');
                          },
                        );
                      }
                    },
                    padding: EdgeInsets.all(15)),
              ),
              SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
