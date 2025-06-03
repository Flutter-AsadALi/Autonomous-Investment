import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sizer/sizer.dart';

import '../../../controllers/normal_store_controller/all_products_controller.dart';
import '../../../resources/routes/navigation_service.dart';
import '../../../resources/routes/routes_name.dart';
import '../../../utils/app_bar.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_text_style.dart';
import '../../../widgets/image_gallery_widget.dart';
import '../../../widgets/search_widget.dart';
import '../../../widgets/shimmer_widget.dart';

class AllProductsView extends StatefulWidget {
  const AllProductsView({super.key});

  @override
  State<AllProductsView> createState() => _AllProductsViewState();
}

class _AllProductsViewState extends State<AllProductsView> {
  bool _isSearchActive = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<AllProductsController>(context, listen: false)
          .setContext(context);
      Provider.of<AllProductsController>(context, listen: false)
          .getProductsList(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final navigationService =
        Provider.of<NavigationService>(context, listen: false);
    return WillPopScope(
      onWillPop: ()async{
        return false;

      },
      child: Scaffold(
        appBar: PrimaryAppBar(
          title: "Products view",
          showBackArrowIcon: false,
          onBackPressed: () {
            // Navigator.pop(context);
          },
          actions: [
            IconButton(
                icon: Icon(
                  _isSearchActive
                      ? Icons.search_off
                      : PhosphorIcons.magnifying_glass_fill,
                  color: AppColors.white,
                ),
                onPressed: () {
                  setState(() {
                    _isSearchActive = !_isSearchActive;
                  });
                }),
          ],
        ),
        body: Consumer<AllProductsController>(
          builder: (context, productProvider, child) {
            return productProvider.isLoading
                ? const Center(child: ShimmerOutBoundList())
                : SafeArea(
                    child: Column(
                    spacing: 2.h,
                    children: [
                      // SizedBox(height: 2.h,),
                      _isSearchActive
                          ? Container(
                              padding: EdgeInsets.fromLTRB(2.h, 2.h, 2.h, 0),
                              child: SearchWidget(
                                hintText: "Search here...",
                                searchController:
                                    productProvider.searchController,
                                fillColor: Colors.white.withOpacity(0.3),
                                borderColor: Colors.blueAccent,
                                iconColor: Colors.white,
                                textColor: Colors.white,
                                borderRadius: 4.h,
                                prefixIcon: PhosphorIcons.magnifying_glass,
                                clearIcon: PhosphorIcons.x_circle,
                                iconSize: 24,
                                useGradient: true,
                                useGlassMorphism: true,
                                blurStrength: 30.0,
                                onChanged: (val) {
                                  if (val.isEmpty) {
                                    productProvider.resetProducts();
                                  } else {
                                    productProvider.filterProducts(val);
                                  }
                                },
                                clearPress: () {
                                  productProvider.resetProducts();
                                },
                                gradient: LinearGradient(
                                  colors: [
                                    AppColors.linearGradientLight,
                                    AppColors.linearGradientDark
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                              ),
                            )
                          : const SizedBox(),
                      Expanded(
                        child: SmartRefresher(
                          controller: productProvider.refreshController,
                          enablePullDown: true,
                          enablePullUp: true,
                          // Enable pull-up for testing onLoading
                          onRefresh: () async {
                            print("onRefresh triggered");
                            double currentScrollOffset = productProvider
                                .refreshController
                                .position!
                                .pixels; // Save current scroll offset
                            await Provider.of<AllProductsController>(context, listen: false).getProductsList(context, isPag: false);
                            productProvider.refreshController.refreshCompleted();
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              productProvider.refreshController.position
                                  ?.jumpTo(currentScrollOffset);
                            });
                          },
                          onLoading: () async {
                            print("onLoading triggered");
                            double currentScrollOffset = productProvider
                                .refreshController
                                .position!
                                .pixels; // Save current scroll offset
                            await Provider.of<AllProductsController>(context, listen: false).getProductsList(context, isPag: true);

                            productProvider.refreshController
                                .loadComplete(); // Notify loading complete
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              productProvider.refreshController.position
                                  ?.jumpTo(currentScrollOffset);
                            });
                          },
                          child: ListView.builder(
                            padding: EdgeInsets.symmetric(
                                horizontal: 4.w, vertical: 2.h),
                            itemCount: productProvider.filteredProducts.length,
                            itemBuilder: (context, index) {
                              final product =
                                  productProvider.filteredProducts[index];
                              List<String> imagesD = [];
                              return ProductListTile(
                                title: product.title ?? '',
                                price: product.price ?? 0.0,
                                stock: product.stock ?? 0,
                                thumbnail: product.thumbnail ?? '',
                                onTap: () {
                                  productProvider.getProductsDetails(context, product.id.toString());
                                  navigationService.navigateTo(RoutesName.detailsView, arguments: [product.id.toString()],);
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (_) => ProductDetailsScreen(product: product),
                                  //   ),
                                  // );
                                },
                              );

                            },
                          ),
                        ),
                      )
                    ],
                  ));
          },
        ),
      ),
    );
  }

  richText(BuildContext context, String name, String pName) {
    return RichText(
      maxLines: 3,
      text: TextSpan(
        children: [
          TextSpan(
            text: name,
            style: AppTextStyle.regularWhite12(context).copyWith(
              color: AppColors.themeLightColor,
            ),
          ),
          TextSpan(
            text: pName,
            style: AppTextStyle.regularWhite12(context).copyWith(
              color: AppColors.themeDarkColor,
            ),
          ),
        ],
      ),
    );
  }
}
class ProductListTile extends StatelessWidget {
  final String title;
  final double price;
  final int stock;
  final String thumbnail;
  final VoidCallback onTap;

  const ProductListTile({
    super.key,
    required this.title,
    required this.price,
    required this.stock,
    required this.thumbnail,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      // color: AppColors.t,
      elevation: 2,
      margin: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
      child: ListTile(
        onTap: onTap,
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(1.h),
          child: Image.network(
            thumbnail,
            width: 12.w,
            height: 12.w,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => const Icon(Icons.broken_image),
          ),
        ),
        title: Text(title, style: AppTextStyle.boldBlack12(context)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Price: AED ${price.toStringAsFixed(2)}",style: AppTextStyle.regularBlack12(context),),
            Text(
              stock > 0 ? "In Stock" : "Out of Stock",
               style:stock > 0 ? AppTextStyle.regularGreen12(context):AppTextStyle.regularRed10(context)
              // TextStyle(
              //   color: stock > 0 ? Colors.green : Colors.red,
              //   fontWeight: FontWeight.w500,
              // ),
            ),
          ],
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      ),
    );
  }
}

