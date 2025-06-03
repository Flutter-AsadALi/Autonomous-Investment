import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'app_colors.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 4.0.h,
        height: 4.0.h,
        child:
        CircularProgressIndicator(
          color: AppColors.themeDarkColor,
        ),
      ),
    );
  }
}
