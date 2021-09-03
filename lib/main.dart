import 'package:flutter/material.dart';
import 'package:stepperissue/steppertest.dart';
import 'package:stepperissue/store.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(
    VxState(
      store: MyStore(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: VxInformationParser(),
      routerDelegate: VxNavigator(
        routes: {
          '/': (uri, param) {
            return MaterialPage(
              name: "Stepper",
              child: StepperTest(),
            );
          },
        },
      ),
    );
  }
}
