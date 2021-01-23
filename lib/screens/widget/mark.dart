
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class Mark extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.08,
      child: Center(
        child: Image.asset(
          "assets/images/icon.png",
          fit: BoxFit.fitHeight,
          alignment: Alignment.centerLeft,
        ),
      ),
    );
  }
}