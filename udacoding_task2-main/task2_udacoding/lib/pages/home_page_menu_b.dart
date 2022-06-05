part of 'pages.dart';

class HomePageMenub extends StatelessWidget {
  final username;
  final password;

  HomePageMenub({Key key, @required this.username, this.password})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Username : ' + username),
          Text('Password : ' + password),
          SizedBox(
            height: 30,
          ),
          Container(
            width: MediaQuery.of(context).size.width / 2,
            height: 45,
            child: RaisedButton(
              color: Colors.blue[800],
              elevation: 0,
              hoverElevation: 0,
              focusElevation: 0,
              highlightElevation: 0,
              splashColor: Colors.black.withOpacity(0.4),
              visualDensity: VisualDensity.comfortable,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'LogOut',
                style: semiWhiteFont.copyWith(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                Get.offAll(MainMenu());
              },
            ),
          ),
        ],
      ),
    ));
  }
}
