import 'package:flutter_weather/services/location.dart';
import 'package:flutter_weather/services/networking.dart';

const apiKey = "YOUR API";
const openWeatherMapURL = "https://api.openweathermap.org/data/2.5/weather";

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async{
    NetworkHelper networkHelper = NetworkHelper(
      '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric',
    );
    return await networkHelper.getData();
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getLocation();

    String query =
        '?lat=${location.getLatitude()}&lon=${location.getLongitude()}&appid=$apiKey&units=metric';

    NetworkHelper networkHelper = NetworkHelper(openWeatherMapURL + query);

    // var weatherData = await networkHelper.getData();
    // return weatherData;
    return await networkHelper.getData();
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temperature) {
    if (temperature > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temperature > 20) {
      return 'Time for shorts and ๐';
    } else if (temperature < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
