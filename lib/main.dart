import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      home: const Scaffold(
        body: ByStream(),
      ),
    );
  }
}

class ByFuture extends StatelessWidget {
  const ByFuture({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<ConnectivityResult>(
          future: Connectivity().checkConnectivity(),
          builder: ((context, snapshot) => (snapshot.hasData)
              ? Result.showConnectivityResult(snapshot.data!)
              : const Text("Check Connection..."))),
    );
  }
}

class ByStream extends StatelessWidget {
  const ByStream({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: StreamBuilder<ConnectivityResult>(
        stream: Connectivity().onConnectivityChanged,
        builder: ((context, snapshot) => (snapshot.hasData)
            ? Result.showConnectivityResult(snapshot.data!)
            : const Text("Check Connection...")),
      ),
    );
  }
}

class Result {
  static Icon showConnectivityResult(ConnectivityResult result) {
    if (result == ConnectivityResult.wifi) {
      return const Icon(MdiIcons.wifi);
    } else if (result == ConnectivityResult.mobile) {
      return const Icon(MdiIcons.signalCellular3);
    } else {
      return const Icon(MdiIcons.airplane);
    }
  }
}
