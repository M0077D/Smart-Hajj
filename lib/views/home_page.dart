import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hajj_app/constants.dart';
import 'package:hajj_app/views/EmergencyPage.dart';
import 'package:hajj_app/views/azkar_page.dart';
import 'package:hajj_app/views/home_body.dart';
import 'package:hajj_app/views/location_page.dart';
import 'package:hajj_app/views/prayer_time.dart';
import 'package:hajj_app/views/quibla.dart';
import 'package:hajj_app/views/tasbih_page.dart';
import 'package:hajj_app/widgets/List_title_drawer.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:hajj_app/widgets/navigation_bottom.dart';
import 'package:hajj_app/views/prayer_time.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';
import 'package:pray_times/pray_times.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static String id = 'HomePage';  

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: (){
                Navigator.pushNamed(context, LocationPage.id);
              }, 
              icon: const Icon(CupertinoIcons.location_solid)
              ),
        automaticallyImplyLeading: false,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'قافلة المسلمين',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            CircleAvatar(
              backgroundColor: Colors.black,
              radius: 20,
              backgroundImage: AssetImage('assets/images/Hajj.png'),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: KPrimaryColor,
      ),
      // bottomNavigationBar: NavigationBottom(), 
          endDrawer: Drawer(
          child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: KPrimaryColor,
            ),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/OIP.jpeg'),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  'قافلة المسلمين',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ),
          ListTileDrawer(
            title: 'مواقيت الصلاه',
            icon: const Icon(FlutterIslamicIcons.kowtow),
            onTap: () {
              Navigator.pushNamed(context, PrayerTimePage.id);
            },
          ),
          ListTileDrawer(
            title: ' اتجاه القبله',
            icon: const Icon(FlutterIslamicIcons.qibla),
            onTap: () {
              Navigator.pushNamed(context, QuiblahPage.id);
            },
          ),
          ListTileDrawer(
            title: 'الاذكار',
            icon: const Icon(FlutterIslamicIcons.hadji),
            onTap: () {
              Navigator.pushNamed(context, AzkarPage.id);
            },
          ),
           ListTileDrawer(
            title: 'المسبحه',
            icon: const Icon(FlutterIslamicIcons.tasbih),
            onTap: () {
              Navigator.pushNamed(context, TasbihPage.id);
            },
          ),
          ListTileDrawer(
            title: 'المساعدة',
            icon: const Icon(Icons.help_center_outlined),
            onTap: () {
              Navigator.pushNamed(context, EmergencyPage.id);
            }
          ),
        ],
      )),  
     body: const NavigationBottom(), 
    // body: HomeBody(),
        
        
      
    );
  }

}
