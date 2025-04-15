class Coord {
  // الاحداثيات
  final double? lon; // خط الطول
  final double? lat; // خط العرض

  Coord({this.lon, this.lat});

  factory Coord.fromJson(dynamic json) {
    if (json == null) {
      return Coord();
    }

    return Coord(lon: json['lon'], lat: json['lat']);
  }
}
