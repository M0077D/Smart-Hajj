import 'package:flutter/material.dart';
import 'package:hajj_app/constants.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class TasbihPage extends StatefulWidget {
  static const String id = 'TasbihPage';
  const TasbihPage({super.key});

  @override
  State<TasbihPage> createState() => _TasbihPageState();
}

class _TasbihPageState extends State<TasbihPage> {
  int _counter = 0;
  int _loops = 0;
  int _selectedCount = 33; // Default count

  void _incrementCounter() {
    setState(() {
      _counter++;
      if (_counter % _selectedCount == 0) {
        _loops++;
      }
      if(_counter == _selectedCount) {
        _counter = 0;
      }
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
      _loops = 0;
    });
  }

  void _updateSelectedCount(int count) {
    setState(() {
      _resetCounter();
      _selectedCount = count;
    });
  }

  @override
  Widget build(BuildContext context) {
    double percent = (_counter % _selectedCount) / _selectedCount;

    return Scaffold(
      backgroundColor: KPrimaryColor,
      appBar: AppBar(
        title: const Text('Praise Page'),
      ),
      body: Stack(
        children: <Widget>[
          // Image.asset(
          //   'assets/images/sebha.jpg',
          //   fit: BoxFit.cover,
          //   height: double.infinity,
          //   width: double.infinity,
          //   alignment: Alignment.center,
          // ),
          Column(
            children: <Widget>[
              const SizedBox(height: 180),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () => _updateSelectedCount(33),
                    child: const Text('33'),
                  ),
                  ElevatedButton(
                    onPressed: () => _updateSelectedCount(99),
                    child: const Text('99'),
                  ),
                  ElevatedButton(
                    onPressed: () => _updateSelectedCount(100),
                    child: const Text('100'),
                  ),
                  ElevatedButton(
                    onPressed: _resetCounter,
                    child: const Text('Reset'),
                  ),
                  Text(
                    'Loop $_loops',
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 60),
              Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height / 12,
                ),
                child: Container(
                  width: 280.0,
                  height: 280.0,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    ),
                  child: ElevatedButton(
                    onPressed: _incrementCounter,
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      shape: const CircleBorder(),
                      backgroundColor: Colors.transparent,
                      foregroundColor: Colors.white,
                    ),
                    child: CircularPercentIndicator(
                          radius: 140.0,
                          lineWidth: 6.0,
                          percent: percent,
                          backgroundColor: Colors.grey,
                          progressColor: Colors.blue,
                          center: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                              'Click to praise',
                              style: TextStyle(
                                color: Colors.white
                              ),
                              ),
                              Text(
                                '${(_counter % _selectedCount)+1}',
                                style: const TextStyle(
                                  fontSize: 40.0,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                  ),
                  ),
                ),
            ],
          ),
        ]
      ),
    );
  }
}






