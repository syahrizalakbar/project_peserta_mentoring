part of 'widgets.dart';

class InputTextField extends StatefulWidget {
  final String title, hintText;
  final bool typeSecure, typeNumber;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  InputTextField(
      {this.controller,
      this.title = '',
      this.hintText = '',
      this.suffixIcon,
      this.typeNumber = false,
      this.typeSecure = false});

  @override
  _InputTextFieldState createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextField> {
  bool _secureText = true;

  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          margin: EdgeInsets.fromLTRB(24, 14, 24, 6),
          child: Text(widget.title, style: blackFontStyle1),
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 24),
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              color: greyColor, borderRadius: BorderRadius.circular(4)),
          child: TextFormField(
            controller: widget.controller,
            cursorColor: mainBlueColor,
            obscuringCharacter: '*',
            obscureText: widget.typeSecure != true ? false : _secureText,
            keyboardType:
                widget.typeNumber != false ? TextInputType.number : null,
            decoration: InputDecoration(
              suffixIcon: widget.typeSecure != true
                  ? widget.suffixIcon
                  : IconButton(
                      onPressed: showHide,
                      icon: Icon(_secureText
                          ? Icons.visibility_off
                          : Icons.visibility),
                    ),
              border: InputBorder.none,
              hintStyle: greyFontStyle,
              hintText: widget.hintText,
            ),
          ),
        ),
      ],
    );
  }
}
