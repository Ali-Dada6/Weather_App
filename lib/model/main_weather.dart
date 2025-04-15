class MainWeather {
  final double? temp; //درجة الحراره
  final double? feelsLike; //الدرجه المحسوسه
  final double? tempMin; //الحد الادنى لدرجة الحراره
  final double? tempMax; //الحد الاعلى لدرجة الحراره
  final int? pressure; //الشغط الجوي
  final int? humidity; //نسبة الرطوبه

  MainWeather(
      {this.temp,
      this.feelsLike,
      this.tempMin,
      this.tempMax,
      this.pressure,
      this.humidity});

  factory MainWeather.fromJson(dynamic json) {
    if (json == null) {
      return MainWeather();
    }

    return MainWeather(
      temp: json['temp'],
      feelsLike: double.parse(json['feels_like'].toString()),
      tempMin: json['temp_min'],
      tempMax: json['temp_max'],
      pressure: json['pressure'],
      humidity: json['humidity'],
    );
  }
}
