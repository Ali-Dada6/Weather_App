class Clouds {
  final int? all; // الغيوم

  Clouds({this.all});

  factory Clouds.fromJson(dynamic json) {
    if (json == null) {
      return Clouds();
    }

    return Clouds(
      all: json['all'],
    );
  }
}
