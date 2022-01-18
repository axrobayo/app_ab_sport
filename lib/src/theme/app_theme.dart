import 'package:flutter/material.dart';

class AppTheme {
  //AppTheme._();

  static final Color colorHighPriority = Colors.red;
  static final Color colorMediumPriority = Colors.yellow;
  static const Color colorLowPriority = Colors.green;

  //static const TextStyle _headLine1 =
  //TextStyle(fontFamily: 'Nexa', fontWeight: FontWeight.bold);

  static final TextStyle _headLine2 = _headLine2;
  /*static final TextStyle _headLine3 = _headLine2.copyWith();
  static final TextStyle _headLine4 = _headLine3.copyWith();
  static final TextStyle _headLine5 = _headLine4.copyWith();
  static final TextStyle _headLine6 =
      _headLine5.copyWith(fontFamily: 'Akrobat');
  static final TextStyle _subTitle1 = _headLine6.copyWith();
  static final TextStyle _subTitle2 = _subTitle1.copyWith();
  static final TextStyle _bodyText1 = _subTitle2.copyWith();*/
  //static final TextStyle _bodyText2 = _bodyText1.copyWith();

  static ThemeData themeData(bool lightMode) {
    return ThemeData(
        //textTheme: _textTheme,
        brightness: lightMode ? Brightness.dark : Brightness.light);
  }
}
