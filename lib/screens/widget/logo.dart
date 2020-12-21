
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.08,
      child: Center(
        child: Image.asset(
          "assets/images/logo.png",
          fit: BoxFit.fitHeight,
          alignment: Alignment.centerLeft,
        ),
      ),
    );
  }
}
