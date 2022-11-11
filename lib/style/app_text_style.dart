import 'package:flutter/cupertino.dart';
import 'package:graildo_assessment/style/app_colors.dart';

class AppTextStyle {
  static const mediumBlue = TextStyle(
      color: AppColors.primaryColor, fontSize: 20, fontWeight: FontWeight.w500);
  static TextStyle greySmall = TextStyle(
    color: const Color(0xff4B4B4B).withOpacity(0.8),
    fontSize: 10,
  );
  static TextStyle blackSmall = const TextStyle(
    color: Color(0xff000000),
    fontSize: 13,
    fontWeight: FontWeight.w300,
  );
  static TextStyle blackMedium = const TextStyle(
    color: Color(0xff3A3A3A),
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );
  static TextStyle appHintStyle = const TextStyle(
    color: Color(0xff9C9C9C),
    fontSize: 14,
    fontWeight: FontWeight.w300,
  );
}
