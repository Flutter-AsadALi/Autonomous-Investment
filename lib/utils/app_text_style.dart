import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../resources/session_controller/session_controller.dart';
import 'app_colors.dart';
import 'app_fonts.dart';

class AppTextStyle {
  /* -------------------------------------------------------------------------- */
  /*                             Nexa Regular Black                             */
  /* -------------------------------------------------------------------------- */

  static TextStyle regularBlack10(BuildContext context) {
    return TextStyle(
      color: AppColors.black,
      fontSize: MediaQuery.of(context).size.width > 500 ? 8.0.sp : 10.0.sp,
      fontFamily: AppFonts.nexaRegular,
    );
  }

  static TextStyle regularBlack11(BuildContext context) {
    return TextStyle(
      color: AppColors.black,
      fontSize: MediaQuery.of(context).size.width > 500 ? 9.0.sp : 11.0.sp,
      fontFamily: AppFonts.nexaRegular,
    );
  }

  static TextStyle regularBlack12(BuildContext context) {
    return TextStyle(
      color: AppColors.black,
      fontSize: MediaQuery.of(context).size.width > 500 ? 10.0.sp : 12.0.sp,
      fontFamily: AppFonts.nexaRegular,
    );
  }

  static TextStyle regularBlack13(BuildContext context) {
    return TextStyle(
      color: AppColors.black,
      fontSize: MediaQuery.of(context).size.width > 500 ? 11.0.sp : 13.0.sp,
      fontFamily: AppFonts.nexaRegular,
    );
  }

  static TextStyle regularBlack14(BuildContext context) {
    return TextStyle(
      color: AppColors.black,
      fontSize: MediaQuery.of(context).size.width > 500 ? 12.0.sp : 14.0.sp,
      fontFamily: AppFonts.nexaRegular,
    );
  }

  /* -------------------------------------------------------------------------- */
  /*                               Nexa Bold Black                              */
  /* -------------------------------------------------------------------------- */

  static TextStyle boldBlack10(BuildContext context) {
    return TextStyle(
      color: AppColors.black,
      fontSize: MediaQuery.of(context).size.width > 500 ? 8.0.sp : 10.0.sp,
      fontFamily: AppFonts.nexaBold,
    );
  }

  static TextStyle boldBlack11(BuildContext context) {
    return TextStyle(
      color: AppColors.black,
      fontSize: MediaQuery.of(context).size.width > 500 ? 9.0.sp : 11.0.sp,
      fontFamily: AppFonts.nexaBold,
    );
  }

  static TextStyle boldBlack12(BuildContext context) {
    return TextStyle(
      color: AppColors.black,
      fontSize: MediaQuery.of(context).size.width > 500 ? 10.0.sp : 12.0.sp,
      fontFamily: AppFonts.nexaBold,
    );
  }

  static TextStyle boldBlack13(BuildContext context) {
    return TextStyle(
      color: AppColors.black,
      fontSize: MediaQuery.of(context).size.width > 500 ? 11.0.sp : 13.0.sp,
      fontFamily: AppFonts.nexaBold,
    );
  }

  static TextStyle boldBlack14(BuildContext context) {
    return TextStyle(
      color: AppColors.black,
      fontSize: MediaQuery.of(context).size.width > 500 ? 12.0.sp : 14.0.sp,
      fontFamily: AppFonts.nexaBold,
    );
  }

  /* -------------------------------------------------------------------------- */
  /*                             Nexa Regular Green                             */
  /* -------------------------------------------------------------------------- */

  static TextStyle regularGreen12(BuildContext context) {
    return TextStyle(
      color: AppColors.green,
      fontSize: MediaQuery.of(context).size.width > 500 ? 10.0.sp : 12.0.sp,
      fontFamily: AppFonts.nexaRegular,
    );
  }

  static TextStyle regularRed10(BuildContext context) {
    return TextStyle(
      color: AppColors.red,
      fontSize: MediaQuery.of(context).size.width > 500 ? 8.0.sp : 10.0.sp,
      fontFamily: AppFonts.nexaRegular,
    );
  }

  /* -------------------------------------------------------------------------- */
  /*                             Nexa Regular White                             */
  /* -------------------------------------------------------------------------- */

  static TextStyle regularWhite10(BuildContext context) {
    return TextStyle(
      color: AppColors.white,
      fontSize: MediaQuery.of(context).size.width > 500 ? 8.0.sp : 10.0.sp,
      fontFamily: AppFonts.nexaRegular,
    );
  }

  static TextStyle regularWhite11(BuildContext context) {
    return TextStyle(
      color: AppColors.white,
      fontSize: MediaQuery.of(context).size.width > 500 ? 9.0.sp : 11.0.sp,
      fontFamily: AppFonts.nexaRegular,
    );
  }

  static TextStyle regularWhite12(BuildContext context) {
    return TextStyle(
      color: AppColors.white,
      fontSize: MediaQuery.of(context).size.width > 500 ? 10.0.sp : 12.0.sp,
      fontFamily: AppFonts.nexaRegular,
    );
  }

  static TextStyle regularWhite13(BuildContext context) {
    return TextStyle(
      color: AppColors.white,
      fontSize: MediaQuery.of(context).size.width > 500 ? 11.0.sp : 13.0.sp,
      fontFamily: AppFonts.nexaRegular,
    );
  }

  static TextStyle regularWhite14(BuildContext context) {
    return TextStyle(
      color: AppColors.white,
      fontSize: MediaQuery.of(context).size.width > 500 ? 12.0.sp : 14.0.sp,
      fontFamily: AppFonts.nexaRegular,
    );
  }

  /* -------------------------------------------------------------------------- */
  /*                               Nexa Bold White                              */
  /* -------------------------------------------------------------------------- */

  static TextStyle boldWhite10(BuildContext context) {
    return TextStyle(
      color: AppColors.white,
      fontSize: MediaQuery.of(context).size.width > 500 ? 8.0.sp : 10.0.sp,
      fontFamily: AppFonts.nexaBold,
    );
  }

  static TextStyle boldWhite11(BuildContext context) {
    return TextStyle(
      color: AppColors.white,
      fontSize: MediaQuery.of(context).size.width > 500 ? 9.0.sp : 11.0.sp,
      fontFamily: AppFonts.nexaBold,
    );
  }

  static TextStyle boldWhite12(BuildContext context) {
    return TextStyle(
      color: AppColors.white,
      fontSize: MediaQuery.of(context).size.width > 500 ? 10.0.sp : 12.0.sp,
      fontFamily: AppFonts.nexaBold,
    );
  }

  static TextStyle boldWhite13(BuildContext context) {
    return TextStyle(
      color: AppColors.white,
      fontSize: MediaQuery.of(context).size.width > 500 ? 11.0.sp : 13.0.sp,
      fontFamily: AppFonts.nexaBold,
    );
  }

  static TextStyle boldWhite14(BuildContext context) {
    return TextStyle(
      color: AppColors.white,
      fontSize: MediaQuery.of(context).size.width > 500 ? 12.0.sp : 14.0.sp,
      fontFamily: AppFonts.nexaBold,
    );
  }

  /* -------------------------------------------------------------------------- */
  /*                               Nexa Regular Grey                            */
  /* -------------------------------------------------------------------------- */

  static TextStyle regularGrey10(BuildContext context) {
    return TextStyle(
      color: AppColors.grey,
      fontSize: MediaQuery.of(context).size.width > 500 ? 8.0.sp : 10.0.sp,
      fontFamily: AppFonts.nexaRegular,
    );
  }

  static TextStyle regularGrey11(BuildContext context) {
    return TextStyle(
      color: AppColors.grey,
      fontSize: MediaQuery.of(context).size.width > 500 ? 9.0.sp : 11.0.sp,
      fontFamily: AppFonts.nexaRegular,
    );
  }

  static TextStyle regularGrey12(BuildContext context) {
    return TextStyle(
      color: AppColors.grey,
      fontSize: MediaQuery.of(context).size.width > 500 ? 10.0.sp : 12.0.sp,
      fontFamily: AppFonts.nexaRegular,
    );
  }

  static TextStyle regularGrey13(BuildContext context) {
    return TextStyle(
      color: AppColors.grey,
      fontSize: MediaQuery.of(context).size.width > 500 ? 11.0.sp : 13.0.sp,
      fontFamily: AppFonts.nexaRegular,
    );
  }

  static TextStyle regularGrey14(BuildContext context) {
    return TextStyle(
      color: AppColors.grey,
      fontSize: MediaQuery.of(context).size.width > 500 ? 12.0.sp : 14.0.sp,
      fontFamily: AppFonts.nexaRegular,
    );
  }

  ///////////////////////////////////////////////
  ///     Regular Theme
  ///////////////////////////////////////////////

  static TextStyle regularTheme10(BuildContext context) {
    return TextStyle(
      color: SessionController.themeLightColor,
      fontSize: MediaQuery.of(context).size.width > 500 ? 8.0.sp : 10.0.sp,
      fontFamily: AppFonts.nexaRegular,
    );
  }

  static TextStyle regularTheme11(BuildContext context) {
    return TextStyle(
      color: SessionController.themeLightColor,
      fontSize: MediaQuery.of(context).size.width > 500 ? 9.0.sp : 11.0.sp,
      fontFamily: AppFonts.nexaRegular,
    );
  }

  static TextStyle regularTheme12(BuildContext context) {
    return TextStyle(
      color: SessionController.themeLightColor,
      fontSize: MediaQuery.of(context).size.width > 500 ? 10.0.sp : 12.0.sp,
      fontFamily: AppFonts.nexaRegular,
    );
  }

  static TextStyle regularTheme13(BuildContext context) {
    return TextStyle(
      color: SessionController.themeLightColor,
      fontSize: MediaQuery.of(context).size.width > 500 ? 11.0.sp : 13.0.sp,
      fontFamily: AppFonts.nexaRegular,
    );
  }

  static TextStyle regularTheme14(BuildContext context) {
    return TextStyle(
      color: SessionController.themeLightColor,
      fontSize: MediaQuery.of(context).size.width > 500 ? 12.0.sp : 14.0.sp,
      fontFamily: AppFonts.nexaRegular,
    );
  }

  ///////////////////////////////////////////////
  ///     Bold Theme
  ///////////////////////////////////////////////

  static TextStyle boldTheme10(BuildContext context) {
    return TextStyle(
      color: SessionController.themeLightColor,
      fontSize: MediaQuery.of(context).size.width > 500 ? 8.0.sp : 10.0.sp,
      fontFamily: AppFonts.nexaBold,
    );
  }

  static TextStyle boldTheme11(BuildContext context) {
    return TextStyle(
      color: SessionController.themeLightColor,
      fontSize: MediaQuery.of(context).size.width > 500 ? 9.0.sp : 11.0.sp,
      fontFamily: AppFonts.nexaBold,
    );
  }

  static TextStyle boldTheme12(BuildContext context) {
    return TextStyle(
      color: SessionController.themeLightColor,
      fontSize: MediaQuery.of(context).size.width > 500 ? 10.0.sp : 12.0.sp,
      fontFamily: AppFonts.nexaBold,
    );
  }

  static TextStyle boldTheme13(BuildContext context) {
    return TextStyle(
      color: SessionController.themeLightColor,
      fontSize: MediaQuery.of(context).size.width > 500 ? 11.0.sp : 13.0.sp,
      fontFamily: AppFonts.nexaBold,
    );
  }

  static TextStyle boldTheme14(BuildContext context) {
    return TextStyle(
      color: SessionController.themeLightColor,
      fontSize: MediaQuery.of(context).size.width > 500 ? 12.0.sp : 14.0.sp,
      fontFamily: AppFonts.nexaBold,
    );
  }

  ///////////////////////////////////////////////
  ///     Bold Theme Dark
  ///////////////////////////////////////////////

  static TextStyle boldThemeDark10(BuildContext context) {
    return TextStyle(
      color: SessionController.themeDarkColor,
      fontSize: MediaQuery.of(context).size.width > 500 ? 8.0.sp : 10.0.sp,
      fontFamily: AppFonts.nexaBold,
    );
  }

  static TextStyle boldThemeDark11(BuildContext context) {
    return TextStyle(
      color: SessionController.themeDarkColor,
      fontSize: MediaQuery.of(context).size.width > 500 ? 9.0.sp : 11.0.sp,
      fontFamily: AppFonts.nexaBold,
    );
  }

  static TextStyle boldThemeDark12(BuildContext context) {
    return TextStyle(
      color: SessionController.themeDarkColor,
      fontSize: MediaQuery.of(context).size.width > 500 ? 10.0.sp : 12.0.sp,
      fontFamily: AppFonts.nexaBold,
    );
  }

  static TextStyle boldThemeDark13(BuildContext context) {
    return TextStyle(
      color: SessionController.themeDarkColor,
      fontSize: MediaQuery.of(context).size.width > 500 ? 11.0.sp : 13.0.sp,
      fontFamily: AppFonts.nexaBold,
    );
  }

  static TextStyle boldThemeDark14(BuildContext context) {
    return TextStyle(
      color: SessionController.themeDarkColor,
      fontSize: MediaQuery.of(context).size.width > 500 ? 12.0.sp : 14.0.sp,
      fontFamily: AppFonts.nexaBold,
    );
  }

  ///////////////////////////////////////////////
  ///     Extra Bold Dark Theme
  ///////////////////////////////////////////////

  static TextStyle xBoldDarkTheme20(BuildContext context) {
    return TextStyle(
      color: SessionController.themeDarkColor,
      fontSize: MediaQuery.of(context).size.width > 500 ? 18.0.sp : 20.0.sp,
      fontFamily: AppFonts.nexaXBold,
    );
  }

  static TextStyle xBoldTheme20(BuildContext context) {
    return TextStyle(
      color: SessionController.themeLightColor,
      fontSize: MediaQuery.of(context).size.width > 500 ? 18.0.sp : 20.0.sp,
      fontFamily: AppFonts.nexaXBold,
    );
  }

  static TextStyle xBoldTheme22(BuildContext context) {
    return TextStyle(
      color: SessionController.themeLightColor,
      fontSize: MediaQuery.of(context).size.width > 500 ? 20.0.sp : 22.0.sp,
      fontFamily: AppFonts.nexaXBold,
    );
  }
}
