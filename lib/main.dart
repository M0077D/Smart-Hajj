import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hajj_app/firebase_options.dart';
import 'package:hajj_app/helpers/read_doaa_json.dart';
import 'package:hajj_app/views/EmergencyPage.dart';
import 'package:hajj_app/views/azkar_page.dart';
import 'package:hajj_app/views/doaa_body.dart';
import 'package:hajj_app/views/home_body.dart';
import 'package:hajj_app/views/home_page.dart';
import 'package:hajj_app/views/location_page.dart';
import 'package:hajj_app/views/login_page.dart';
import 'package:hajj_app/views/prayer_time.dart';
import 'package:hajj_app/views/quibla.dart';
import 'package:hajj_app/views/register_page.dart';
import 'package:hajj_app/views/tasbih_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Hajj());
}

class Hajj extends StatelessWidget {
  const Hajj({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        loginPage.id: (context) => loginPage(),
        RegisterPage.id: (context) => RegisterPage(),
        HomePage.id: (context) => HomePage(),
        QuiblahPage.id: (context) => QuiblahPage(),
        AzkarPage.id: (context) => AzkarPage(),
        PrayerTimePage.id: (context) => PrayerTimePage(),
        ReadDoaaJson.id: (context) => ReadDoaaJson(path: 'assets/json/doaa.json'),
        TasbihPage.id: (context) => TasbihPage(),
        EmergencyPage.id: (context) => EmergencyPage(),
        LocationPage.id: (context) => LocationPage(),
        // HomeBody.id: (context) =>  HomeBody(),
        // DoaaBody.id: (context) =>  DoaaBody(),
      },
      initialRoute: HomePage.id,
    );
  }
}
