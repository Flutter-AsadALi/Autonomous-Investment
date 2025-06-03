import 'package:flutter/material.dart';
import 'package:flutter_app/utils/app_text_style.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../controllers/normal_store_controller/all_products_controller.dart';
import '../../model/product_details_model.dart';
import '../../resources/common/image_resize.dart';
import '../../utils/app_bar.dart';
import '../../widgets/shimmer_widget.dart';

class ProductsDetailsView extends StatefulWidget {
  final String piD;

  const ProductsDetailsView({super.key, required this.piD});

  @override
  State<ProductsDetailsView> createState() => _ProductsDetailsViewState();
}

class _ProductsDetailsViewState extends State<ProductsDetailsView> {
  @override
  void initState() {
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   Provider.of<AllProductsController>(context, listen: false).getProductsDetails(context,widget.piD);
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        title: "Details",
        onBackPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SafeArea(
        child: Consumer<AllProductsController>(
          builder: (context, productProvider, child) {
            final product = productProvider.productDetailsModel;

            return productProvider.isLoadingDetails
                ? const ShimmerProductDetails()
                : ListView(
                    children: [
                      FlutterCarousel(
                          options: FlutterCarouselOptions(
                            height: 35.h,
                            showIndicator: true,
                            aspectRatio: 16 / 9,
                            viewportFraction: 1.0,
                            initialPage: 0,
                            autoPlay: true,
                            autoPlayInterval: const Duration(seconds: 5),
                            autoPlayAnimationDuration:
                                const Duration(milliseconds: 800),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enlargeCenterPage: false,

                          ),
                          items: productProvider.productDetailsModel!.images!
                              .map((e) {
                            return InkWell(
                              onTap: () {},
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1.0,
                                      color: Colors.grey.withOpacity(0.2)),
                                  borderRadius: BorderRadius.circular(0.5.h),
                                ),
                                child: ImageResize(
                                  fit: BoxFit.fitHeight,
                                  url: e.toString(),
                                  // width: 90.w,
                                  height: 30.h,
                                  // size: kSize.large,
                                ),
                              ),
                            );
                          }).toList()),
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 1.h, horizontal: 2.h),
                        child: Column(
                          spacing: 2.h,
                          children: [
                            Text(
                                productProvider.productDetailsModel!.title ??
                                    '',
                                style: AppTextStyle.boldBlack12(context)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    "Brand: ${productProvider.productDetailsModel!.brand ?? 'N/A'}",
                                    style: AppTextStyle.regularGrey12(context)),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 2.h, vertical: 0.5.h),
                                  decoration: BoxDecoration(
                                    color: productProvider.productDetailsModel!
                                                .availabilityStatus
                                                ?.toLowerCase() ==
                                            'available'
                                        ? Colors.green.withOpacity(0.2)
                                        : Colors.red.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    productProvider.productDetailsModel!
                                            .availabilityStatus ??
                                        '',
                                    style: TextStyle(
                                      color: productProvider
                                                  .productDetailsModel!
                                                  .availabilityStatus
                                                  ?.toLowerCase() ==
                                              'available'
                                          ? Colors.green
                                          : Colors.red,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 11.sp,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                                "Price: AED ${productProvider.productDetailsModel!.price ?? '0'}",
                                style: AppTextStyle.regularBlack12(context)),
                            Text(
                              productProvider
                                      .productDetailsModel!.description ??
                                  'No description available.',
                              style: AppTextStyle.regularBlack12(context),
                              // TextStyle(fontSize: 12.sp, color: Colors.grey[800]),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 3.w, vertical: 2.h),
                              child: Text(
                                "Customer Reviews",
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            // ListView.separated(
                            //   scrollDirection: Axis.horizontal,
                            //   padding: EdgeInsets.symmetric(horizontal: 3.w),
                            //   itemCount: productProvider
                            //       .productDetailsModel!.reviews!.length,
                            //   separatorBuilder: (_, __) => SizedBox(width: 2.w),
                            //   itemBuilder: (_, index) {
                            //     return ReviewItem(
                            //         review: productProvider
                            //             .productDetailsModel!.reviews![index]);
                            //   },
                            // ),


                            SizedBox(
                              height: 20.h, // or adjust based on content
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                padding: EdgeInsets.symmetric(horizontal: 3.w),
                                child: Row(
                                  children: productProvider.productDetailsModel!.reviews!
                                      .map((review) => Padding(
                                    padding: EdgeInsets.only(right: 2.w),
                                    child: SizedBox(
                                      width: 80.w,
                                      child: ReviewItem(review: review),
                                    ),
                                  ))
                                      .toList(),
                                ),
                              ),
                            ),




                            ClipRRect(
                              borderRadius: BorderRadius.circular(1.h),
                              child: Image.network(
                                productProvider
                                    .productDetailsModel!.meta!.qrCode
                                    .toString(),
                                // thumbnail,
                                width: 10.h,
                                height: 10.h,
                                fit: BoxFit.cover,
                                errorBuilder: (_, __, ___) =>
                                    const Icon(Icons.broken_image),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  );
          },
        ),
      ),
    );
  }
}

class ReviewItem extends StatelessWidget {
  final Review review;

  const ReviewItem({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    final String name = review.reviewerName ?? 'Anonymous';
    final int rating = (review.rating ?? 0).clamp(0, 5);
    final DateTime date = review.date ?? DateTime.now();
    final String comment = review.comment ?? '';

    return Card(
      margin: EdgeInsets.symmetric(vertical: 1.h, horizontal: 3.w),
      elevation: 1,
      child: Padding(
        padding: EdgeInsets.all(2.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Avatar with initials
            CircleAvatar(
              backgroundColor: Colors.grey[200],
              radius: 3.h,
              child: Text(
                name.isNotEmpty ? name[0].toUpperCase() : '?',
                style: AppTextStyle.regularBlack12(context)
              ),
            ),
            SizedBox(width: 3.w),

            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name + Rating
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        name,
                        style: AppTextStyle.boldBlack12(context),
                      ),

                    ],
                  ),

                  SizedBox(height: 0.5.h),

                  // Date
                  Text(
                    _formatDate(date),
                    style: AppTextStyle.regularGrey12(context),
                  ),
                  SizedBox(height: 1.h),

                  // Comment
                  Text(
                    comment,
                    style: AppTextStyle.regularBlack12(context),
                  ),
                  Row(
                    children: List.generate(5, (index) {
                      return Icon(
                        index < rating
                            ? Icons.star
                            : Icons.star_border,
                        size: 14.sp,
                        color: Colors.amber,
                      );
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day}";
  }
}

