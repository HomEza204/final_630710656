import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final dio = Dio();
  Map<String, dynamic> data = {}; // ใช้ Map แทน List

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response = await dio.get('https://cpsu-test-api.herokuapp.com/api/1_2566/weather/current?city=paris');
      debugPrint(response.toString());
      if (response.statusCode == 200) {
        setState(() {
          data = response.data;
        });
      } else {
        throw Exception('ไม่สามารถดึงข้อมูลได้');
      }
    } catch (e) {
      print('เกิดข้อผิดพลาด: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    var x = data['condition'];

    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: RawMaterialButton(onPressed: () {

                  }, child: Text('Bangkok',style: TextStyle(fontSize: 30.0)),
                  ),
                ),
                Expanded(
                  child: RawMaterialButton(onPressed: () {

                  }, child: Text('Paris',style: TextStyle(fontSize: 30.0)),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 70),
              child: Text(data['city'],style: TextStyle(fontSize: 50),),
            ),
            Text(data['country'],style: TextStyle(fontSize: 25),),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Text(data['lastUpdated'],style: TextStyle(color: Colors.grey),),
            ),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Image.network(data['icon'].toString(),),
            ),
            Text(data['condition']['text'],style: TextStyle(fontSize: 25)),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Text(data['tempC'].toString(),style: TextStyle(fontSize: 60)),
            ),
            Text('Feels like ${data['feelsLikeC'].toString()}',style: TextStyle(fontSize: 25,color: Colors.grey)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('°C',style: TextStyle(fontSize: 25)),
                Text('|',style: TextStyle(fontSize: 25)),
                Text('°F',style: TextStyle(fontSize: 25)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 120),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Icon(Icons.water_drop,size: 40),
                          Text('HUMIDITY',style: TextStyle(fontSize: 20),),
                          Text(data['humidity'].toString(),style: TextStyle(fontSize: 20),),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Icon(Icons.air,size: 40),
                          Text('WIND',style: TextStyle(fontSize: 20),),
                          Text(data['windMph'].toString(),style: TextStyle(fontSize: 20),),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Icon(Icons.sunny,size: 40),
                          Text('UV',style: TextStyle(fontSize: 20),),
                          Text(data['uv'].toString(),style: TextStyle(fontSize: 20),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}