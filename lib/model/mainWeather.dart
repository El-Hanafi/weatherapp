class MainWeather{
  double temp, feels_like, temp_min, temp_max, pressure, humidity,sea_level,grnd_level;

  MainWeather(
      {this.temp,
      this.feels_like,
      this.temp_min,
      this.temp_max,
      this.pressure,
      this.humidity,
      this.sea_level,
      this.grnd_level});


  factory MainWeather.fromJson(Map<String, dynamic> json) {
    return MainWeather(
      temp: double.parse(json["temp"]),
      feels_like: json["feels_like"],
      temp_min: json["temp_min"],
      temp_max: json["temp_max"],
      pressure: json["pressure"],
      humidity: json["humidity"],
      sea_level: json["sea_level"],
      grnd_level: json["grnd_level"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "temp": this.temp,
      "feels_like": this.feels_like,
      "temp_min": this.temp_min,
      "temp_max": this.temp_max,
      "pressure": this.pressure,
      "humidity": this.humidity,
      "sea_level": this.sea_level,
      "grnd_level": this.grnd_level,
    };
  }


}