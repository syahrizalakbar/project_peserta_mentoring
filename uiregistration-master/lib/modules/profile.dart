import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
            child: Container(
          margin: EdgeInsets.all(20),
          child: Text(
            'Selamat Datang',
            style: TextStyle(
                color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
          ),
        )),
        Container(
          child: Image.asset(
            'assets/images/login.jpg',
            fit: BoxFit.cover,
            height: 100,
            width: 100,
          ),
        ),
        Column(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  'Nama : Mulyawan Sentosa',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  'Alamat : Rangkasbitung',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  'Usename : admin',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    ));
  }
}
