import 'package:flutter/material.dart';

class UhiDrawer extends StatelessWidget {
  const UhiDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 250,
      child: Column(children: const <Widget>[
        SizedBox(
            height: 250,
            width: 250,
            
          ),
      ],)
    );
  }
}