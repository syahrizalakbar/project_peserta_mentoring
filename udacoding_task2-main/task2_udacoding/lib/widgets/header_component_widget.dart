part of 'widgets.dart';

class HeaderWidgetComponent extends StatelessWidget {
  final String headerName;
  final Function onTap;

  HeaderWidgetComponent({this.headerName, this.onTap});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 88,
      padding: EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
      child: Stack(
        children: [
          onTap != null
              ? Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: 34,
                    height: 34,
                    child: RaisedButton(
                      color: primaryColor,
                      elevation: 0,
                      hoverElevation: 0,
                      focusElevation: 0,
                      highlightElevation: 0,
                      padding: EdgeInsets.zero,
                      splashColor: Colors.black.withOpacity(0.3),
                      visualDensity: VisualDensity.comfortable,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: FaIcon(
                        FontAwesomeIcons.arrowLeft,
                        color: whiteColor,
                        size: 18,
                      ),
                      onPressed: () {
                        if (onTap != null) {
                          onTap();
                        }
                      },
                    ),
                  ),
                )
              : SizedBox(),
          Center(
            child: Text(
              headerName,
              style: boldWhiteFont.copyWith(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
