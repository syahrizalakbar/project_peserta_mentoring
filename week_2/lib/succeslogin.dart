import 'package:flutter/material.dart';
import 'package:week_2/main.dart';

class Success extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Center(
                child: Text("Login Success"),
              ),
            ),
            Container(
              child: ElevatedButton(
                child: Text('Kembali'),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyApp()));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
