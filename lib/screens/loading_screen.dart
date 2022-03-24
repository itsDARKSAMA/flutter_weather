import 'package:flutter/material.dart';
import 'package:flutter_weather/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_weather/services/weather.dart';


class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void _getLocationData() async {
    try {
     
      var weatherData = await WeatherModel().getLocationWeather();

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return LocationScreen(
              locationWeather: weatherData,
            );
          },
        ),
      );
    } catch (e) {
      print('error : ${e.toString()}');
    }
  }

  @override
  void initState() {
    super.initState();
    _getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SpinKitDoubleBounce(
      color: Colors.white,
      size: 100.0,
    ));
  }
}
