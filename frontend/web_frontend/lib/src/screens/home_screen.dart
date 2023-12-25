import 'package:flutter/material.dart';
import 'package:web_frontend/src/components/appbar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(context, index: 0),
      // title: "Home",
      body: Center(
        child: Text('Welcome to the Home Screen!'),
      ),
    );
  }
}
