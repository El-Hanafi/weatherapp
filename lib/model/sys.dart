class Sys {
  String country;
  int sunrise, sunset,id;

  Sys({this.country, this.sunrise, this.sunset, this.id});

  factory Sys.fromJson(Map<String, dynamic> json) {
    return Sys(
      country: json["country"],
      sunrise: int.parse(json["sunrise"]),
      sunset: json["sunset"],
      id: json["id"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "country": this.country,
      "sunrise": this.sunrise,
      "sunset": this.sunset,
      "id": this.id,
    };
  }
//


}