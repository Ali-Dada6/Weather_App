class Wind {
  // بيانات الرياح (السرعة والاتجاه).
  final double? speed; // سرعة الرياح
  final int? deg; // اتجاه الرياح

  Wind({this.speed, this.deg});

  factory Wind.fromJson(dynamic json) {
    if (json == null) {
      return Wind();
    }

    return Wind(
      speed: double.parse(json['speed'].toString()),
      deg: json['deg'],
    );
  }
}
