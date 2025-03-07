import 'package:flutter/material.dart';
import 'package:hajj_app/views/prayer_time.dart';

class CustomContainerprayer extends StatelessWidget {
   CustomContainerprayer({super.key, required this.image, required this.text, required this.prayerName, required this.remainingTime, required this.text2});
 String image;
 String text;
 String prayerName;
 String remainingTime;
 String text2;
  @override
  Widget build(BuildContext context) {
    return  
     GestureDetector(
        onTap: (){
          Navigator.pushNamed(context, PrayerTimePage.id);
        },
       child: Container(
                  width: double.infinity,
                  height: 250,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                     mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          text,
                          style: const TextStyle(fontSize: 24, color: Color.fromARGB(255, 122, 122, 53), fontWeight: FontWeight.bold),
                        ),
                        Text(
                          prayerName,
                          style: const TextStyle(fontSize: 24, color: Color.fromARGB(255, 122, 122, 53), fontWeight: FontWeight.bold),
                        ),
                        Text(
                          remainingTime,
                          style: const TextStyle(fontSize: 18, color: Color.fromARGB(255, 122, 122, 53), fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                          Text(
                          text2,
                          style: const TextStyle(fontSize: 14, color: Color.fromARGB(255, 122, 122, 53)),
                        ),
                      ],
                    ),
                  ),
                ),
     );
    
  }
}