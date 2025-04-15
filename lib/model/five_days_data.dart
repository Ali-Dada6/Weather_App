class FiveDayData {
  final String? dateTime; // تاريخ ووقت
  final int? temp; // درجة الحرارة

  FiveDayData({this.dateTime, this.temp});

  factory FiveDayData.fromJson(dynamic json) {
    if (json == null) {
      return FiveDayData();
    }

    //  يتم تحويل تاريخ ووقت الطقس إلى صيغة اليوم-الساعة
    var f = json['dt_txt'].split(' ')[0].split('-')[2];
    var l = json['dt_txt'].split(' ')[1].split(':')[0];
    var fandl = '$f-$l';

    return FiveDayData(
      dateTime: '$fandl',
      temp: (double.parse(json['main']['temp'].toString()) - 273.15)
          .round(), // تحويل درجة الحرارة من كيلفن إلى مئوي
    );
  }
}
