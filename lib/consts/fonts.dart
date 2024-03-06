import 'dart:ffi';
import 'dart:ui';

import 'package:doctor_qppointment_app/consts/consts.dart';

class AppFonts{
  static String SourceSansPro_Bold = "SourceSansPro_Bold",
      SourceSansPro_Light = "SourceSansPro_Light"
  ;
}

class AppStyles{
  static TextStyle normalText = TextStyle(
    fontFamily: AppFonts.SourceSansPro_Light,
    fontSize: 20,
    color: AppColors.textColor
  );



}