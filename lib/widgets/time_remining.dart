import 'package:hajj_app/widgets/prayer_time_class.dart';

class TimeReminingForPray{
  static double latitude = 30.033333;
  static double longitude = 31.233334;
  static const timzone = 3.0;
  static List<String> prayerTimes = PrayerTimeClass.prayTimeZone(latitude, longitude, timzone);
  static List<String> prayerNames = PrayerTimeClass.prayNameZone(latitude, longitude, timzone);
  // Function to convert string time to DateTime
// Function to convert string time to DateTime
static DateTime convertToDateTime(String timeString) {
  DateTime now = DateTime.now();
  List<String> parts = timeString.split(':');
  return DateTime(now.year, now.month, now.day, int.parse(parts[0]), int.parse(parts[1]));
}

// Function to calculate remaining time to the next prayer
static List<int> calculateRemainingTime(List<String> prayerTimes) {
  DateTime now = DateTime.now();
  List<DateTime> prayerDateTimes = prayerTimes.map((time) => convertToDateTime(time)).toList();

  // Find the minimum positive difference
  Duration minDifference = Duration(days: 1); // Set to a large value initially
  int minIndex = -1;
  for (int i = 0; i < prayerDateTimes.length; i++) {
    Duration difference = prayerDateTimes[i].difference(now);
    if (difference.isNegative) {
      // Skip if the prayer time has already passed
      continue;
    }
    if (difference < minDifference) {
      minDifference = difference;
      minIndex = i;
    }
  }


  // Calculate remaining time in hours and minutes
  int remainingHours = minDifference.inHours;
  int remainingMinutes = minDifference.inMinutes.remainder(60);

  List<int> remain_H_M_S = [minDifference.inHours,minDifference.inMinutes,minDifference.inSeconds];

  return remain_H_M_S;
}

static String calculateRemainingTimeName(List<String> prayerTimes) {
  DateTime now = DateTime.now();
  List<DateTime> prayerDateTimes = prayerTimes.map((time) => convertToDateTime(time)).toList();

  // Find the minimum positive difference
  Duration minDifference = Duration(days: 1); // Set to a large value initially
  int minIndex = -1;
  for (int i = 0; i < prayerDateTimes.length; i++) {
    Duration difference = prayerDateTimes[i].difference(now);
    if (difference.isNegative) {
      // Skip if the prayer time has already passed
      continue;
    }
    if (difference < minDifference) {
      minDifference = difference;
      minIndex = i;
    }
  }


  // Calculate remaining time in hours and minutes
  int remainingHours = minDifference.inHours;
  int remainingMinutes = minDifference.inMinutes.remainder(60);
if(minIndex == Null){minIndex = 0;}
  return prayerTimes[minIndex];
}
  

}