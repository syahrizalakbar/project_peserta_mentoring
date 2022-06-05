part of 'widgets.dart';

class AuthRichText extends StatelessWidget {
  final String? textAsk, textAuth;
  final Function() onTap;
  AuthRichText({this.textAsk, this.textAuth, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 13),
        child: RichText(
          text: TextSpan(
              style: blackFontStyleBold.copyWith(fontSize: 13),
              children: [
                TextSpan(text: textAsk),
                TextSpan(text: textAuth, style: blueFontStyleBold)
              ]),
        ),
      ),
    );
  }
}
