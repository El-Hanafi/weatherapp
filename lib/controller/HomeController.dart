import 'package:get/get.dart';
import 'package:weatherapp/model/currentWeatherData.dart';
import 'package:weatherapp/service/weatherService.dart';
import 'package:weatherapp/model/fiveDaysData.dart';

class HomeController extends GetXControllerBuilder {
  String city;

  HomeController({this.city});

  CurrentWeatherData currentWeatherData=CurrentWeatherData();
  List<FiveDaysData> fiveDaysData = [];
  List<CurrentWeatherData> dataList =[];

  @override
  void onInit() {
    initState();
    getTopFiveCities();
    super.onInit();
  }
  
  void updateWeather () {
    initState();
  }

  void initState() {
    getCurrentWeatherDate();
    getTopDaysData();
  }

  void getCurrentWeatherDate() {
  WeatherService(city: city).getCurrentWeatherData(
      onSuccess: (data){
  currentWeatherData=data;
  update();
  },
  onError: (error){
        print(error);
        update();
  }
  );
  }

  getFiveDaysData() {
    WeatherService(city: city).getFiveThreeHourForcastData(
        onSuccess: (data){
          fiveDaysData=data;
          update();
        },
        onError: (error){
          print(error);
          update();
        }
    );
  }


  void getTopFiveCities() {
    List<String> cities=['marrakesh','casablanca','rabat','tanger','fes'];
    cities.forEach((element) {
      WeatherService(city: city).getCurrentWeatherData(
          onSuccess: (data){
            dataList.add(data);
            update();
          },
          onError: (error){
            print(error);
            update();
          }
      );
    })

  }


}