import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = '5d22c3033427378a7061f622ad54ecc1';
const urlPath = 'http://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather({String cityName}) async {
    NetworkHelper networkHelper =
        NetworkHelper('$urlPath?q=$cityName&appid=$apiKey&units=metric');
    var weatherData = await networkHelper.getData();
    //print(weatherData);
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location lc = Location();
    await lc.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        '$urlPath?lat=${lc.latitude}&lon=${lc.longitude}&appid=$apiKey&units=metric');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(double temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
