import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../../network_client/network_clients.dart';
import '../controllers/app_preferences_controller/prefrences_controller.dart';
import '../controllers/internet_checker_controller/internet_checker_controller.dart';
import '../resources/session_controller/session_controller.dart';
import '../../utils/preference_labels.dart';

List<SingleChildWidget> createBindings(BuildContext context) {
  return [
    /* -------------------------------------------------------------------------- */
    /*                                   AppPreferencesProvider                   */
    /* -------------------------------------------------------------------------- */
    ChangeNotifierProvider<AppPreferencesProvider>(
      create: (_) => AppPreferencesProvider(),
    ),

    /* -------------------------------------------------------------------------- */
    /*                                   NetworkClient                            */
    /* -------------------------------------------------------------------------- */
    Provider<NetworkClient>(
      create: (context) => NetworkClient(
        // getUserAuthToken: () async {
        //   // Fetch the token from AppPreferencesProvider
        //   final preferences = Provider.of<AppPreferencesProvider>(context, listen: false);
        //   String? authToken = await preferences.getString(AppPreferencesLabels.authToken);
        //   SessionController.authToken = authToken;
        //   return authToken;
        // },
      ),
    ),


    /* -------------------------------------------------------------------------- */
    /*                                   InternetConnectionProvider               */
    /* -------------------------------------------------------------------------- */
    ChangeNotifierProvider<InternetConnectionProvider>(
      create: (_) => InternetConnectionProvider(),
    ),
  ];
}
