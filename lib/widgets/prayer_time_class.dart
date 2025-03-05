import 'package:geolocator/geolocator.dart';
import 'package:pray_times/pray_times.dart';

class PrayerTimeClass{
  static List<String> prayTimeZone (double latitude, double longitude, double timezone){
    PrayerTimes pray = PrayerTimes();
    pray.setTimeFormat(pray.Time12);
    pray.setCalcMethod(pray.MWL);
    pray.setAsrJuristic(pray.Shafii);
    pray.setAdjustHighLats(pray.AngleBased);
    // {Fajr,Sunrise,Dhuhr,Asr,Sunset,Maghrib,Isha}
    var offsets = [0, 0, 0, 0, 0, 0, 0];
    pray.tune(offsets);
    final date = DateTime.now();
    // final date = DateTime(2023, DateTime.january, 20);
    List<String> prayerTimes =
        pray.getPrayerTimes(date, latitude, longitude, timezone);
    List<String> prayerNames = pray.getTimeNames();
    return prayerTimes;
    }
    
  static List<String> prayNameZone (double latitude, double longitude, double timezone){
    PrayerTimes pray = PrayerTimes();
    pray.setTimeFormat(pray.Time12);
    pray.setCalcMethod(pray.MWL);
    pray.setAsrJuristic(pray.Shafii);
    pray.setAdjustHighLats(pray.AngleBased);
    // {Fajr,Sunrise,Dhuhr,Asr,Sunset,Maghrib,Isha}
    var offsets = [0, 0, 0, 0, 0, 0, 0];
    pray.tune(offsets);
    final date = DateTime.now();
    // final date = DateTime(2023, DateTime.january, 20);
    List<String> prayerTimes =
        pray.getPrayerTimes(date, latitude, longitude, timezone);
    List<String> prayerNames = pray.getTimeNames();
    return prayerNames;
    }
    
static Future<Position> determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }
  
  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately. 
    return Future.error(
      'Location permissions are permanently denied, we cannot request permissions.');
  } 
  return await Geolocator.getCurrentPosition();
}
  // Existing code...
  static List<String> prayerNames = [
    'Fajr', // Dawn
    'Sunrise',
    'Dhuhr', // Noon
    'Asr',   // Afternoon
    'Maghrib', // Sunset
    'Isha',  // Night
  ];
  static Future<Map<String, dynamic>> getNextPrayerDetails() async {
  try {
    final position = await determinePosition();
    final latitude = 30.033333;
    final longitude = 31.233334;
    const timzone = 3.0;

    final prayerTimes = prayTimeZone(latitude, longitude, timzone);

    final currentTime = DateTime.now();
    String? nextPrayer;
    DateTime? nextPrayerTime;

    for (int i = 0; i < prayerTimes.length; i++) {
      final prayerTime = DateTime.parse(prayerTimes[i]);
      if (prayerTime.isAfter(currentTime)) {
        nextPrayer = prayerNames[i];
        nextPrayerTime = prayerTime;
        break;
      }
    }

    if (nextPrayerTime == null) {
      // Handle case when current time is after all prayer times
      throw Exception('Current time is after all prayer times');
    }

    final timeDifference = nextPrayerTime.difference(currentTime);
    final timeRemaining = timeDifference.inMinutes;

    return {'prayerName': nextPrayer, 'timeRemaining': timeRemaining};
  } catch (e) {
    print('Error fetching prayer times: $e');
    return {'prayerName': null, 'timeRemaining': null};
  }
}

}