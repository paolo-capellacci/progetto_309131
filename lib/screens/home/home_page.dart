import 'package:flutter/material.dart';
import 'package:progetto_309131/models/tool.dart';
import 'package:progetto_309131/providers/service_tool.dart';
import 'package:progetto_309131/screens/widget/logo.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Container(
          margin: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Selector<ServiceTool, Tool>(shouldRebuild: (pre, next) {
                return pre != next;
              }, selector: (context, notifier) {
                return notifier.selectedTool;
              }, builder: (BuildContext context, tool, child) {
                if (tool == null) {
                  return CircularProgressIndicator();
                }
                return Column(
                  children: [
                    Logo(),
                    Text('Home'),
                    //TopHome(tool: tool),
                    //CenterHome(tool: tool),
                    //BottomHome(),
                  ],
                );
              }),

            ],
          ),
        ),
    );
  }
}
