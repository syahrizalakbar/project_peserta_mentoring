part of 'widgets.dart';

class MainMenuWidget extends StatelessWidget {
  final String menuName;
  final String iconPath;
  final Function onTap;
  final Color color;

  MainMenuWidget({this.menuName, this.iconPath, this.onTap, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2 - 1.5 * 24,
      height: 187,
      child: RaisedButton(
        onPressed: onTap,
        color: color,
        elevation: 0,
        hoverElevation: 0,
        focusElevation: 0,
        highlightElevation: 0,
        splashColor: Colors.black.withOpacity(0.3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 90,
              height: 90,
              margin: EdgeInsets.only(bottom: 18),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    iconPath,
                  ),
                ),
              ),
            ),
            Text(
              menuName,
              style: boldWhiteFont.copyWith(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
