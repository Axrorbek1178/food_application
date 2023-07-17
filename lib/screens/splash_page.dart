import 'package:flutter/material.dart';

import '../main.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 4)).then((value) =>
        Navigator.pushAndRemoveUntil(
            context, MaterialPageRoute(builder: (_) => MyApp()),
            (route)=> false));
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Colors.orange,Colors.blue]
          ),
        ),
        child: Center(
          child: Image.asset("assets/Enter.png", width: 200, ),
        ),
      )
    );


  }
}
