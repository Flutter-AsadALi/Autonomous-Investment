import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../controllers/normal_store_controller/all_products_controller.dart';
import 'splash_services.dart';
import '../../utils/images_path.dart';


class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  SplashServices splashServices = SplashServices();

  @override
  void initState() {
    super.initState();
    // Fetch language and labels
    WidgetsBinding.instance.addPostFrameCallback((_) {
      splashServices.isSplashToLogin(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<AllProductsController>(
          builder: (context, labelProvider, child) {
            if (labelProvider.isLoading) {
              return const CircularProgressIndicator(); // Loading indicator while labels are being fetched
            } else {
              return Container(
                padding: EdgeInsets.symmetric(vertical: 0.h,horizontal: 1.h),
                child: Image(
                  image: AssetImage(
                    AppImagesPath.fullAppLogoIcon,
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
