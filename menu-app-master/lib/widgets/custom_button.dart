part of 'widgets.dart';

class CustomMyButton extends StatelessWidget {
  final Function() onPressedBtn;
  final Color? btnColor, textColor;
  final String title;
  final bool? isDecoration;
  CustomMyButton(
      {required this.onPressedBtn,
      this.title = '',
      this.btnColor,
      this.textColor,
      this.isDecoration});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
      decoration: (isDecoration != true)
          ? null
          : BoxDecoration(
              border: Border.all(color: whiteColor),
              borderRadius: BorderRadius.circular(2)),
      child: ElevatedButton(
        onPressed: onPressedBtn,
        style: ElevatedButton.styleFrom(primary: btnColor),
        child: Text(
          title,
          style: whiteFontStyle.copyWith(color: textColor),
        ),
      ),
    );
  }
}
