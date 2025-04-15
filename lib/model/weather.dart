class Weather {
  // بيانات الطقس (المعرف، نوع الطقس او حالته، الوصف، الأيقونة).
  final int? id; // المعرف
  final String? main; //  نوع الطقس او حالته
  final String? description; // الوصف
  final String? icon; // الأيقونة

  Weather({this.id, this.main, this.description, this.icon});

  factory Weather.fromJson(dynamic json) {
    if (json == null) {
      return Weather();
    }

    return Weather(
        id: json['id'],
        main: json['main'],
        description: json['description'],
        icon: json['icon']);
  }
}
