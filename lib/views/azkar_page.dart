import 'package:flutter/material.dart';
import 'package:hajj_app/constants.dart';
import 'package:hajj_app/helpers/readazkarjson.dart';

class AzkarPage extends StatefulWidget {
  static String id = 'AzkarPage';
  @override
  _AzkarPageState createState() => _AzkarPageState();
}

class _AzkarPageState extends State<AzkarPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
 // List _items = [];

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'الاذكار',
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              // give the tab bar a height [can change hheight to preferred height]
              Container(
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(
                    25.0,
                  ),
                ),
                child: TabBar(
                  controller: _tabController,
                  // give the indicator a decoration (color and border radius)
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      25.0,
                    ),
                    color: KPrimaryColor,
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  tabs: [
                    // first tab [you can add an icon using the icon property]
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Tab(
                        text: 'اذكار الصباح',
                      ),
                    ),

                    // second tab [you can add an icon using the icon property]
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Tab(
                        text: 'اذكار المساء',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Tab(
                        text: 'اذكار بعد الصلاه',
                      ),
                    )
                  ],
                ),
              ),
              // tab bar view here
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    // first tab bar view widget
                    ReadAzkarJson(
                      path: 'assets/json/azkar_sabah.json',
                    ),

                    //second tab bar view widget
                    ReadAzkarJson(
                      path: 'assets/json/azkar_massa.json',
                      
                    ),
                    // third tab bar view widget
                    ReadAzkarJson(
                      path: 'assets/json/PostPrayer_azkar.json',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
