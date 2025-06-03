import 'dart:async';
import 'dart:developer' as developer;

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import '../../utils/show_messages.dart';
import '../app_preferences_controller/preferenceUtils.dart';

class InternetConnectionProvider with ChangeNotifier {
  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> connectivitySubscription;

  ConnectivityResult get connectionStatus => _connectionStatus;

  InternetConnectionProvider() {
    initConnectivity();
    connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  // Initialize connectivity status
  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    await PreferenceUtils.getInstance(); // Assuming this handles some preference logic
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      developer.log('Couldn\'t check connectivity status', error: e);
      return;
    }

    await _updateConnectionStatus(result);
  }

  // Update connectivity status
  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    _connectionStatus = result;
    if (_connectionStatus == ConnectivityResult.none) {
      // showErrorMessage("No Internet Connection", context: context);
    }
    notifyListeners(); // Notify listeners for state change
  }

  // Clean up connectivity stream subscription when no longer needed
  void disposeProvider() {
    connectivitySubscription.cancel();
    notifyListeners();
  }

  @override
  void dispose() {
    connectivitySubscription.cancel();
    super.dispose();
  }
}
