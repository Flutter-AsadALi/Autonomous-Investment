
import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_style.dart';

/* -------------------------------------------------------------------------- */
/*                        Show Success SnackBar                               */
/* -------------------------------------------------------------------------- */
void showSuccessMessage(
    String message, {
      required BuildContext context,
      ScaffoldMessengerState? messengerState,
    }) {
  final s = messengerState ?? ScaffoldMessenger.of(context);
  s.showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: AppTextStyle.boldWhite10(context),
      ),
      backgroundColor: AppColors.green,
    ),
  );
}

/* -------------------------------------------------------------------------- */
/*                        Show Error SnackBar                                 */
/* -------------------------------------------------------------------------- */
void showErrorMessage(
    String message, {
      required BuildContext context,
      ScaffoldMessengerState? messengerState,
    }) {
  final s = messengerState ?? ScaffoldMessenger.of(context);
  s.showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: AppTextStyle.boldWhite10(context),
      ),
      backgroundColor: AppColors.red,
    ),
  );
}



