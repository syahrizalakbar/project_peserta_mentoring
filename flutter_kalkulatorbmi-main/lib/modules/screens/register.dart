import 'package:flutter_kalkulatorbmi/modules/screens/validation.dart';
import 'package:flutter/material.dart';
import 'tab_screen.dart';

class PageLogin extends StatelessWidget with Validation{
  final myUsernameController = TextEditingController();
  final myPasswordController = TextEditingController();
  String nUsername, nPassword;

  //tambahkan form
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              //cek data field nya kosong
              validator: validateName,
              controller: myUsernameController,
              decoration: InputDecoration(
                hintText: 'Input Username',
              ),
            ),
            TextFormField(
              //cek data field nya kosong
              validator: validatePassword,
              maxLength: 17,
              maxLengthEnforced: true,
              controller: myPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Input Password',
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            MaterialButton(
              minWidth: 85.0,
              height: 50.0,
              color: Colors.green,
              textColor: Colors.white,
              onPressed: () {

                //cek apakah username = admin
                //cek password = admin, jika sesuai bisa login

                //ngambil value dari widget textfield
                nUsername = myUsernameController.text;
                nPassword = myPasswordController.text;

                if (_formKey.currentState.validate()) {

                  if(nUsername != 'admin'){
                    print("username salah");
                  }else if(nPassword != 'admin'){
                    print("password salah");
                  }else{
                    //aksi pindah
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TabScreen() // variable yang di pass ke page home
                            ));
                  }
                }
              },
              child: Text('Submit'),
            )
          ],
        ),
      ),

    );
  }
}