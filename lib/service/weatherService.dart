import 'package:weatherapp/api/apiRepo.dart';
import 'package:weatherapp/model/currentWeatherData.dart';
import 'package:weatherapp/model/fiveDaysData.dart';

class WeatherService {
  String city;

  WeatherService({this.city});

  String baseUrl="https://api.openweathermap.org/data/2.5";
  String apiKey="appid=cb96a6733c2bb8d1a3201c114910af80";
  void getCurrentWeatherData({
    Function ()beforeSend,
    Function (CurrentWeatherData currentWeatherData) onSuccess,
    Function (dynamic error) onError,
}) {
    //method body
    final url="$baseUrl/weather?q=$city&$apiKey";
    ApiRepo(url: url, payload:null).getData(
      beforeSend: ()=>beforeSend(),
      onSuccess: (data)=>onSuccess(CurrentWeatherData.fromJson(data)),
      onError: (error)=>onError(error),
    );
  }

  void getFiveThreeHourForcastData({
    Function ()beforeSend,
    Function (CurrentWeatherData currentWeatherData) onSuccess,
    Function (dynamic error) onError,
}) {
    //method body
    final url="$baseUrl/forecast?q=$city&$apiKey";
    ApiRepo(url: url, payload:null).getData(
      beforeSend: ()=>beforeSend(),
      onSuccess: (data)=> {
        onSuccess((data['list'] as List)
          ?.map((t) => FiveDaysData.fromJson(t))
          ?.toList() ??
          List.empty()),
      },
      onError: (error)=>onError(error),
    );
  }
}