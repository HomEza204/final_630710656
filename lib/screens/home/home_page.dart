import 'package:final_630710656/models/weather.dart';
import 'package:flutter/material.dart';

import '../../repositories/weather_repositories.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Weather>? _weathers;
  var _isLoading = false;
  String? _errorMessage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWeathers();
  }

  getWeathers() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    await Future.delayed(Duration(seconds: 2));

    try {
      var weathers = await WeatherRepository().getWeathers();
      debugPrint('Number of weathers: ${weathers}');

      setState(() {
        _weathers = weathers as List<Weather>?;
      });
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    buildLoadingOverlay() => Container(
        color: Colors.black.withOpacity(0.2),
        child: Center(child: CircularProgressIndicator()));

    buildError() => Center(
        child: Padding(
            padding: const EdgeInsets.all(40.0),
            child:
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(_errorMessage ?? '', textAlign: TextAlign.center),
              SizedBox(height: 32.0),
              ElevatedButton(onPressed: getWeathers, child: Text('Retry'))
            ])));

    buildWeathers() => const Scaffold(
      body: Text('data'),
    );

    return Scaffold(
      body: Stack(
        children: [
          if (_weathers?.isNotEmpty ?? false) buildWeathers(),
          if (_errorMessage != null) buildError(),
          if (_isLoading) buildLoadingOverlay()
        ],
      ),
    );
  }
}
