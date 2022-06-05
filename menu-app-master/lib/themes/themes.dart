import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

Color silverColor = Color(0xFFFbdc3c7);
Color greyPage = Color(0xFFFFAFAFC);
Color mainBlueColor = Color(0xFFF273c75);
Color greyColor = Color(0xFFFecf0f1);
Color greyHintColor = Color(0xFFF8D92A3);
Color yellowColor = Color(0xFFFBD460);
Color whiteColor = Colors.white;

var width = Get.width;
var height = Get.height;

TextStyle blackFontStyle1 = GoogleFonts.poppins()
    .copyWith(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500);
TextStyle blackFontStyleBold = GoogleFonts.poppins()
    .copyWith(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold);
TextStyle blueFontStyleBold = GoogleFonts.poppins()
    .copyWith(color: mainBlueColor, fontSize: 13, fontWeight: FontWeight.bold);
TextStyle greyFontStyle = GoogleFonts.poppins()
    .copyWith(color: greyHintColor, fontSize: 13, fontWeight: FontWeight.w300);
TextStyle whiteFontStyle = GoogleFonts.poppins()
    .copyWith(color: whiteColor, fontSize: 16, fontWeight: FontWeight.w300);
