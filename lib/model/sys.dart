class Sys {
  // بيانات النظام الجغرافي والزمني للطقس.
  final int? type; // نوع النظام
  final int? id; // معرف النظام
  final String? country; // الدولة
  final int? sunrise; // وقت شروق الشمس
  final int? sunset; // وقت غروب الشمس

  Sys({this.type, this.id, this.country, this.sunrise, this.sunset});

  factory Sys.fromJson(dynamic json) {
    if (json == null) {
      return Sys();
    }

    return Sys(
      type: json['type'],
      id: json['id'],
      country: json['country'],
      sunrise: json['sunrise'],
      sunset: json['sunset'],
    );
  }
}
