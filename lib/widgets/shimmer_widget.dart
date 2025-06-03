import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

import '../resources/session_controller/session_controller.dart';
import '../utils/app_colors.dart';

class ShimmerALLList extends StatelessWidget {
  const ShimmerALLList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.white,
      body: shimmerList(),
    );
  }

  Widget shimmerList() {
    return Column(
      children: [
        Shimmer.fromColors(
          baseColor: Colors.grey[200]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            height: 10.h,
            color: AppColors.grey,
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) {
              return Material(
                color: AppColors.white,
                child: Padding(
                  padding: EdgeInsets.all(1.h),
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 30.h,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(2.h)),
                      child: Padding(
                        padding: EdgeInsets.all(1.h),
                        child: Column(
                          children: [
                            Shimmer.fromColors(
                              baseColor: Colors.grey[400]!,
                              highlightColor: Colors.grey[100]!,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    height: 8.h,
                                    width: 8.h,
                                    decoration: BoxDecoration(
                                        color: AppColors.blue,
                                        shape: BoxShape.circle),
                                  ),
                                  Container(
                                    width: 50.w,
                                    height: 5.h,
                                    // Adjust the height as needed
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(1.h),
                                      color: Colors.grey[300],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Shimmer.fromColors(
                              baseColor: Colors.grey[400]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(
                                height: 5.h,
                                // Adjust the height as needed
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(1.h),
                                  color: Colors.grey[300],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Shimmer.fromColors(
                                  baseColor: Colors.grey[400]!,
                                  highlightColor: Colors.grey[100]!,
                                  child: Container(
                                    width: 30.w,
                                    height: 5.h,
                                    // Adjust the height as needed
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(1.h),
                                      color: Colors.grey[300],
                                    ),
                                  ),
                                ),
                                Shimmer.fromColors(
                                  baseColor: Colors.grey[400]!,
                                  highlightColor: Colors.grey[100]!,
                                  child: Container(
                                    width: 30.w,
                                    height: 5.h,
                                    // Adjust the height as needed
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(1.h),
                                      color: Colors.grey[300],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class ShimmerOutBoundList extends StatelessWidget {
  const ShimmerOutBoundList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.white,
      body: shimmerOutBoundList(),
    );
  }

  Widget shimmerOutBoundList() {
    return Column(
      children: [
        Shimmer.fromColors(
          baseColor: Colors.grey[200]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            height: 10.h,
            color: AppColors.grey,
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 3.h,
                    width: 3.h,
                    decoration: BoxDecoration(
                        color: AppColors.grey, shape: BoxShape.circle),
                  ),
                  Material(
                    color: AppColors.white,
                    child: Padding(
                      padding: EdgeInsets.all(1.h),
                      child: Container(
                          width: 80.w,
                          height: 20.h,
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(2.h)),
                          child: Padding(
                            padding: EdgeInsets.all(1.h),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Shimmer.fromColors(
                                  baseColor: Colors.grey[400]!,
                                  highlightColor: Colors.grey[100]!,
                                  child: Container(
                                    height: 5.h,
                                    // Adjust the height as needed
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(1.h),
                                      color: Colors.grey[300],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Shimmer.fromColors(
                                  baseColor: Colors.grey[400]!,
                                  highlightColor: Colors.grey[100]!,
                                  child: Container(
                                    height: 5.h,
                                    // Adjust the height as needed
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(1.h),
                                      color: Colors.grey[300],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

/* -------------------------------------------------------------------------- */
/*                         ShimmerWidget => DASHBOARD                         */
/* -------------------------------------------------------------------------- */

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 7.h),
        Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 9.h,
                width: 9.h,
                decoration: BoxDecoration(
                    color: AppColors.blue, shape: BoxShape.circle),
              ),
              SizedBox(
                width: 6.w,
              ),
              Container(
                width: 50.w,
                height: 5.h,
                // Adjust the height as needed
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1.h),
                  color: Colors.grey[300],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 1.h),
        Container(
          width: 70.w,
          height: 5.h,
          // Adjust the height as needed
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(1.h),
            color: Colors.grey[300],
          ),
        ),
        SizedBox(height: 8.h),
        // Large Container with Shimmer Effect
        Container(
            width: 80.w,
            height: 15.h,
            // Adjust the height as needed
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1.h),
              color: Colors.grey[300],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      height: 4.h,
                      width: 4.h,
                      decoration: BoxDecoration(
                          color: AppColors.black, shape: BoxShape.circle),
                    )),
                Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      height: 3.h,
                      width: 3.h,
                      decoration: BoxDecoration(
                          color: AppColors.black, shape: BoxShape.circle),
                    )),
              ],
            )),
        SizedBox(
          height: 5.h,
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const WidgetDash(),
            SizedBox(
              width: 15.w,
            ),
            const WidgetDash()
          ],
        ),
        SizedBox(
          height: 5.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const WidgetDash(),
            SizedBox(
              width: 15.w,
            ),
            const WidgetDash()
          ],
        ),
        SizedBox(
          height: 5.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const WidgetDash(),
            SizedBox(
              width: 15.w,
            ),
            const WidgetDash()
          ],
        ),
      ],
    );
  }
}

class ShimmerProductDetails extends StatelessWidget {
  const ShimmerProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Container(
              height: 30.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2.h),
              ),
            ),
            SizedBox(height: 2.h),

            // Title
            Container(
              height: 3.h,
              width: 60.w,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(1.h),
              ),
            ),
            SizedBox(height: 1.h),

            // Brand and Availability
            Row(
              children: [
                Container(
                  height: 2.5.h,
                  width: 30.w,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(1.h),
                  ),
                ),
                SizedBox(width: 5.w),
                Container(
                  height: 2.5.h,
                  width: 25.w,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(1.h),
                  ),
                ),
              ],
            ),
            SizedBox(height: 2.h),

            // Price
            Container(
              height: 2.5.h,
              width: 40.w,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(1.h),
              ),
            ),
            SizedBox(height: 2.h),

            // Description Lines
            ...List.generate(4, (index) => Padding(
              padding: EdgeInsets.only(bottom: 1.h),
              child: Container(
                height: 2.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(1.h),
                ),
              ),
            )),

            // Bottom button placeholder
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 4.h),
                height: 5.h,
                width: 60.w,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2.h),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


class WidgetDash extends StatelessWidget {
  const WidgetDash({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: 28.w,
        height: 10.h,
        padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.w),
        decoration: BoxDecoration(
          border: Border.all(color: SessionController.themeLightColor),
          borderRadius: BorderRadius.all(Radius.circular(2.h)),
          color: AppColors.white,
        ),
      ),
    );
  }
}
