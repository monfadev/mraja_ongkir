import 'package:flutter/material.dart';
import 'package:mraja_ongkir/ui/screens/screens.dart';

import 'core/config/config.dart';

void main() {
  runApp(const Root());
}

class Root extends StatefulWidget {
  const Root({Key? key}) : super(key: key);

  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  bool _ready = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then((value) => setState(() {
          _ready = true;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: titleName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: fontName,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: _ready ? const MainScreen() : const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Splash Screen"),
      ),
    );
  }
}
