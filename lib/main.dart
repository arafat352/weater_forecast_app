import 'package:flutter/material.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather Forecasts',
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF201E81), Color(0xFF9527B8)],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Replace this with your actual asset image
            Icon(Icons.cloud, size: 180, color: Colors.white),
            SizedBox(height: 40),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
                children: [
                  TextSpan(text: 'Weather\n', style: TextStyle(color: Colors.white)),
                  TextSpan(text: 'ForeCasts', style: TextStyle(color: Color(0xFFFCD34D))),
                ],
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFCD34D),
                shape: StadiumBorder(),
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ForecastScreen()),
                );
              },
              child: Text('Get Start', style: TextStyle(

                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Colors.indigoAccent)),
            ),
          ],
        ),
      ),
    );
  }
}

class ForecastScreen extends StatelessWidget {
  final List<Map<String, String>> forecast = [
    {"day": "Mon", "temp": "19°C"},
    {"day": "Tue", "temp": "18°C"},
    {"day": "Wed", "temp": "18°C"},
    {"day": "Thu", "temp": "19°C"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF201E81), Color(0xFF9527B8)],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            Center(
              child: Column(
                children: [
                  Text(
                    'North America',
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Max: 24°   Min: 18°',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),

            // 7-Days Forecast Title
            Text(
              '7-Days Forecasts',
              style: TextStyle(
                  color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),

            // Forecast Cards
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: forecast.map((item) {
                return Container(
                  width: 60,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Text(item['temp']!, style: TextStyle(color: Colors.white)),
                      Icon(Icons.cloud, color: Colors.white),
                      Text(item['day']!, style: TextStyle(color: Colors.white)),
                    ],
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 30),

            // Air Quality Section
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Icon(Icons.air, color: Colors.white),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('AIR QUALITY', style: TextStyle(color: Colors.white70)),
                        SizedBox(height: 6),
                        Text('3 - Low Health Risk',
                            style: TextStyle(color: Colors.white, fontSize: 16)),
                      ],
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16),
                ],
              ),
            ),
            SizedBox(height: 200),

            // Sunrise & UV Index Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildInfoBox(
                  title: 'SUNRISE',
                  mainText: '5:28 AM',
                  subText: 'Sunset: 7.25PM',
                  icon: Icons.wb_sunny_outlined,
                ),
                buildInfoBox(
                  title: 'UV INDEX',
                  mainText: '4',
                  subText: 'Moderate',
                  icon: Icons.wb_sunny,
                ),
              ],
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget buildInfoBox({
    required String title,
    required String mainText,
    required String subText,
    required IconData icon,
  }) {
    return Container(
      width: 150,
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.white),
          SizedBox(height: 6),
          Text(title, style: TextStyle(color: Colors.white70, fontSize: 12)),
          SizedBox(height: 4),
          Text(mainText, style: TextStyle(color: Colors.white, fontSize: 18)),
          SizedBox(height: 2),
          Text(subText, style: TextStyle(color: Colors.white70, fontSize: 12)),
        ],
      ),
    );
  }
}
