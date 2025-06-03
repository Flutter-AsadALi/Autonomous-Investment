import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/app_preferences_controller/prefrences_controller.dart';
import '../../controllers/normal_store_controller/all_products_controller.dart';
import '../../resources/routes/navigation_service.dart';
import '../../resources/routes/routes_name.dart';
import '../../utils/preference_labels.dart';

class SplashServices {
  void isSplashToLogin(BuildContext context) async {

    final appPreferencesProvider = Provider.of<AppPreferencesProvider>(context, listen: false);
    final navigationService = Provider.of<NavigationService>(context, listen: false);
    final labelProvider = Provider.of<AllProductsController>(context, listen: false);
    await appPreferencesProvider.remove(AppPreferencesLabels.authToken);
    appPreferencesProvider.clearEncryptedPrefs();
    Timer(const Duration(seconds: 2), () async {
      navigationService.navigateAndReplaceAll(RoutesName.allProductsListView);
    });


  }
}
