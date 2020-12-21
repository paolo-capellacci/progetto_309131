
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:progetto_309131/screens/widget/logo.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Logo(),
            Text('Info Page'),

          ],
        ),
      ),
    );
  }
}
