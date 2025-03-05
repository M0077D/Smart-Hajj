import 'package:flutter/material.dart';
import 'package:hajj_app/helpers/360vr.dart';

class PlaceBody extends StatelessWidget {
  static const String id = 'place_body';
  const PlaceBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: TextButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: ((context) => View360())));
        },
        child: Text('360 View'))
        );
  }
}