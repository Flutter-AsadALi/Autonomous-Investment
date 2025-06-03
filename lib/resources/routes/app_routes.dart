import 'package:flutter/material.dart';
import 'package:flutter_app/resources/routes/routes_name.dart';

import '../../app_screens/product_manage/products_details_view.dart';
import '../../app_screens/product_manage/products_view.dart';
import '../../app_screens/splash_view/splash_view.dart';


class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splashView:
        return _buildRoute(const SplashView(), settings);
      case RoutesName.allProductsListView:
        return _buildRoute(const AllProductsView(), settings);
        case RoutesName.detailsView:
          final args = settings.arguments as List;
          final pid = args[0] as String; // Extract the OrderDatum
        return _buildRoute( ProductsDetailsView(piD: pid.toString(),), settings);
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }

  static PageRouteBuilder _buildRoute(Widget page, RouteSettings settings) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 250),
    );
  }
}
