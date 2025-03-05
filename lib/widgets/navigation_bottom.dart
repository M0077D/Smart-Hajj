import 'package:flutter/material.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:hajj_app/views/doaa_body.dart';
import 'package:hajj_app/views/home_body.dart';
import 'package:hajj_app/views/mnask_body.dart';
import 'package:hajj_app/views/place_body.dart';

class NavigationBottom extends StatefulWidget {
  const NavigationBottom({super.key});
  

  @override
  State<NavigationBottom> createState() => _NavigationBottomState();
}

class _NavigationBottomState extends State<NavigationBottom> {
  int currentPageIndex = 0;


  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      // appBar: currentPageIndex == 2 || currentPageIndex == 3
      //     ? null
      //     :AppBar(
      //   automaticallyImplyLeading: false,
      //     ),
      
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.amber,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            label: 'الصفحة الرئيسية',
            icon: Icon(Icons.home),
          ),
          NavigationDestination(
            label: 'الادعيه ',
            icon: Icon(FlutterIslamicIcons.takbir),
          ),
          NavigationDestination(
            label: 'المناسك ',
            icon: Icon(FlutterIslamicIcons.kaaba),
          ),
          NavigationDestination(
            label: 'رؤيه الاماكن المقدسه',
            icon: Icon(FlutterIslamicIcons.qibla),
          ),
        ],
      ),
      body: <Widget>[
        const HomeBody(),
        const DoaaBody(),
        const MnaskBody(),
        const PlaceBody(),
      ][currentPageIndex]
    );
  }
}
