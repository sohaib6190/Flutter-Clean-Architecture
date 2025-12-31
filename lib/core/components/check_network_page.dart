import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';


import '../services/connectivity_service.dart';
import 'no_internet_screen.dart';

class InternetConnectivityWrapper extends StatefulWidget {
  final Widget child;

  const InternetConnectivityWrapper({super.key, required this.child});

  @override
  State<InternetConnectivityWrapper> createState() =>
      _InternetConnectivityWrapperState();
}

class _InternetConnectivityWrapperState
    extends State<InternetConnectivityWrapper> {
  String? currentRoute;
  ConnectivityResult? connection;

  @override
  void initState() {
    super.initState();
    ConnectivityService.instance.connectionStatusStream.listen((result) {
      setState(() {
        connection = result.$1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if ((connection == ConnectivityResult.none || connection == null)) {
      return const NoInternetScreen();
    }

    return widget.child;
  }
}
