import 'package:flutter/material.dart';
import 'package:flutter_find_funny/pages/tabs_page.dart';
import 'package:flutter_find_funny/utils/utils.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: TabsPage(),
      ),
    );
  }
}
