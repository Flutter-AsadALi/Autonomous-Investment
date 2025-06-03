import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/resources/routes/navigation_service.dart';
import 'package:flutter_app/utils/loading_indicator.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../network_client/network_clients.dart';
import '../controllers/app_preferences_controller/prefrences_controller.dart';
import '../controllers/internet_checker_controller/internet_checker_controller.dart';
import 'controllers/normal_store_controller/all_products_controller.dart';
import 'resources/routes/app_routes.dart';
import 'resources/routes/routes_name.dart';
import 'resources/session_controller/session_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /* -------------------------------------------------------------------------- */
    /*                             DeviceOrientation                              */
    /* -------------------------------------------------------------------------- */
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return Sizer(
      builder: (context, orientation, deviceType) {
        return MultiProvider(
          providers: providers(),
          child: Builder(
            builder: (context) {
              final navigationService =
                  Provider.of<NavigationService>(context, listen: false);
              return GlobalLoaderOverlay(
                useDefaultLoading: false,
                overlayWidgetBuilder: (progress) {
                  return const LoadingIndicator();
                },
                child: MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData(
                      scaffoldBackgroundColor: SessionController.theme),
                  initialRoute: RoutesName.splashView,
                  navigatorKey: navigationService.navigatorKey,
                  onGenerateRoute: AppRoutes.generateRoute,
                ),
              );
            },
          ),
        );
      },
    );
  }

  providers() {
    return [
      /* -------------------------------------------------------------------------- */
      /*                                   AppPreferencesProvider                   */
      /* -------------------------------------------------------------------------- */
      ChangeNotifierProvider<AppPreferencesProvider>(
        create: (_) => AppPreferencesProvider(),
      ),
      /* -------------------------------------------------------------------------- */
      /*                                   NavigationService                       */
      /* -------------------------------------------------------------------------- */
      Provider<NavigationService>(create: (_) => NavigationService()),
      /* -------------------------------------------------------------------------- */
      /*                                   NetworkClient                            */
      /* -------------------------------------------------------------------------- */
      Provider<NetworkClient>(
        create: (context) => NetworkClient(),
      ),

      /* -------------------------------------------------------------------------- */
      /*                                   InternetConnectionProvider               */
      /* -------------------------------------------------------------------------- */
      ChangeNotifierProvider<InternetConnectionProvider>(
        create: (_) => InternetConnectionProvider(),
      ),

      /* -------------------------------------------------------------------------- */
      /*                                   AllProductsController                   */
      /* -------------------------------------------------------------------------- */
      ChangeNotifierProvider<AllProductsController>(
        create: (_) => AllProductsController(),
      ),
    ];
  }
}
