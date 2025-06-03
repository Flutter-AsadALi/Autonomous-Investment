import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  /// Navigate to a new screen by route name
  Future<dynamic> navigateTo(String routeName, {Object? arguments}) {
    return navigatorKey.currentState!.pushNamed(routeName, arguments: arguments);
  }

  /// Navigate and replace the current screen with a new one
  Future<dynamic> navigateAndReplace(String routeName, {Object? arguments}) {
    return navigatorKey.currentState!.pushReplacementNamed(routeName, arguments: arguments);
  }

  /// Navigate and remove all previous routes until reaching the specified new route
  Future<dynamic> navigateAndReplaceAll(String routeName, {Object? arguments}) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
      routeName,
          (Route<dynamic> route) => false,  // Removes all routes until the new one
      arguments: arguments,
    );
  }

  /// Go back to the previous screen
  void goBack() {
    if (navigatorKey.currentState!.canPop()) {
      navigatorKey.currentState!.pop();
    }
  }
}

/*

final navigationService = Provider.of<NavigationService>(context, listen: false);

// Navigate to a new screen
navigationService.navigateTo(RoutesName.dash);

// Replace current screen with a new one
navigationService.navigateAndReplace(RoutesName.signUpScreens);

// Clear all previous screens and navigate to a new one
navigationService.navigateAndReplaceAll(RoutesName.splashView);

// Go back to the previous screen
navigationService.goBack();

*/
