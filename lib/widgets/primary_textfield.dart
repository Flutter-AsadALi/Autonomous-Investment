import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:provider/provider.dart';

import 'package:sizer/sizer.dart';


import '../resources/session_controller/session_controller.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_style.dart';

// ignore: must_be_immutable
class PrimaryTextField extends StatelessWidget {
  PrimaryTextField(
      {
        super.key,
      this.heading = "",
      required this.controller,
      required this.hintText,
      required this.styleText,
      required this.bkColor,
      this.enable = true,
      this.iconVal = false,
      this.borderColor,
      this.borderWidth,
      this.readVal = false,
      this.keyboardType,
      this.maxLine,
      this.inputFormatters,
      this.prefixIcon});

  final String heading;
  final TextEditingController controller;
  final String hintText;
  final bool enable;
  Color? borderColor;
  double? borderWidth;
  Color bkColor;
  int? maxLine;
  final bool readVal;
  final bool iconVal;
  final TextInputType? keyboardType;
  final TextStyle styleText;
  final List<TextInputFormatter>? inputFormatters;
  VoidCallback? onChangeVal;
  final Icon? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (heading.isNotEmpty)
          Text(
            heading,
            style: AppTextStyle.boldWhite12(context),
          ),
        if (heading.isNotEmpty)
          SizedBox(
            height: 1.0.h,
          ),
        Container(
          // height: 6.0.h,
          decoration: BoxDecoration(
              color: bkColor,
              borderRadius: BorderRadius.circular(1.h),
              border: Border.all(color: AppColors.blackLight)),
          child: Center(
            child: TextField(
              autocorrect: true,
              controller: controller,
              enabled: enable,
              textAlign: TextAlign.start,
              style: styleText,
              keyboardType: keyboardType,
              inputFormatters: inputFormatters,
              cursorColor: AppColors.black,
              decoration: InputDecoration(
                prefixIcon: iconVal ? prefixIcon : const SizedBox(),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 2.h, vertical: 1.5.h),
                hintStyle: AppTextStyle.regularGrey12(context),
                hintText: hintText,
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SimpleTextField extends StatelessWidget {
  const SimpleTextField(
      {Key? key,
      this.heading = "",
      required this.controller,
      required this.hintText,
      this.enable = true,
      required this.lines})
      : super(key: key);
  final String heading;
  final TextEditingController controller;
  final String hintText;
  final bool enable;
  final int lines;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (heading.isNotEmpty)
          Text(
            heading,
            style: AppTextStyle.boldBlack10(context),
          ),
        if (heading.isNotEmpty)
          SizedBox(
            height: 1.0.h,
          ),
        Container(
          // height: 6.0.h,
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(1.h),
              border: Border.all(color: AppColors.blackLight)),

          child: Center(
            child: TextField(
              maxLines: lines,
              enabled: enable,
              controller: controller,
              //obscureText: !authController.isVisible.value,
              cursorColor: AppColors.black,
              textAlign: TextAlign.start,
              style: AppTextStyle.regularBlack10(context),

              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 2.h, vertical: 2.5.h),
                hintStyle: AppTextStyle.regularGrey10(context),
                hintText: hintText,
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}



// ignore: must_be_immutable
class PrimaryTextWithCameraField extends StatelessWidget {
  PrimaryTextWithCameraField({
    super.key,
    this.heading = "",
    required this.controller,
    required this.hintText,
    this.enable = true,
    required this.bkColor,
    this.readVal = false,
    this.keyboardType,
    this.inputFormatters,
  });
  final String heading;
  final TextEditingController controller;
  final String hintText;
  final bool enable;
  Color bkColor;
  final bool readVal;
  final TextInputType? keyboardType;
  final List<FilteringTextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (heading.isNotEmpty)
            Text(
              heading,
              style: AppTextStyle.boldBlack10(context),
            ),
          if (heading.isNotEmpty)
            SizedBox(
              height: 1.0.h,
            ),
          Container(
            // height: 6.0.h,
            decoration: BoxDecoration(
              color: bkColor,
              borderRadius: BorderRadius.circular(1.h),
            ),
            child: Center(
              child: TextField(
                autocorrect: true,
                controller: controller,
                enabled: enable,
                textAlign: TextAlign.start,
                style: AppTextStyle.regularGrey10(context),
                keyboardType: keyboardType,
                inputFormatters: inputFormatters,
                cursorColor: AppColors.black,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 2.h, vertical: 1.5.h),
                  hintStyle: AppTextStyle.regularGrey10(context),
                  hintText: hintText,
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SelectTextField extends StatelessWidget {
  const SelectTextField({
    super.key,
    this.heading = "",
    required this.controller,
    required this.hintText,
    this.enable = true,
  });
  final String heading;
  final TextEditingController controller;
  final String hintText;
  final bool enable;

  @override
  Widget build(BuildContext context) {
    bool listOpen = false;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (heading.isNotEmpty)
          Text(
            heading,
            style: AppTextStyle.boldBlack10(context),
          ),
        if (heading.isNotEmpty)
          SizedBox(
            height: 1.0.h,
          ),
        Container(
          // height: 6.0.h,
          decoration: BoxDecoration(
            //color: AppColors.paleGrey,
            borderRadius: BorderRadius.circular(1.h),
          ),
          child: Center(
            child: listOpen == false
                ? TextField(
                    autocorrect: true,
                    controller: controller,
                    enabled: enable,
                    readOnly: true,
                    textAlign: TextAlign.start,
                    style: AppTextStyle.regularGrey10(context),
                    cursorColor: AppColors.black,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 2.h, vertical: 1.5.h),
                      suffixIcon: IconButton(
                        onPressed: () {
                          log("tap1");
                        },
                        icon: Icon(
                          PhosphorIcons.caret_down_bold,
                          size: 2.5.h,
                          color: AppColors.black,
                        ),
                      ),
                      hintStyle: AppTextStyle.regularGrey10(context),
                      hintText: hintText,
                      border: InputBorder.none,
                    ),
                  )
                : Container(
                    height: 45,
                    decoration: BoxDecoration(
                      color: AppColors.paleGrey,
                      borderRadius: BorderRadius.circular(1.h),
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}
