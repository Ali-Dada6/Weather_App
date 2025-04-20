import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_project/controller/HomeController.dart';
import '../model/current_weather_data.dart';

class MyList extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => VerticalDivider(
          color: Colors.transparent,
          width: 5,
        ),
        itemCount: controller.dataList.length,
        itemBuilder: (context, index) {
          CurrentWeatherData? data = (controller.dataList.isNotEmpty)
              ? controller.dataList[index]
              : null;

          final condition = data?.weather?[0].main?.toLowerCase() ?? '';

          final Map<String, String> weatherIcons = {
            'rain': 'assets/images/rain.png',
            'clear': 'assets/images/verySuny.png',
            'snow': 'assets/images/iced.png',
            'clouds': 'assets/images/cloudy.png',
            'drizzle': 'assets/images/rain.png',
            'thunderstorm': 'assets/images/rain.png',
            'mist': 'assets/images/cloudy.png',
            'haze': 'assets/images/cloudy.png',
          };

          final String imagePath =
              weatherIcons[condition] ?? 'assets/images/cloudy.png';

          return Container(
            width: 140,
            height: 150,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    data?.name ?? '',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black45,
                          fontFamily: 'flutterfonts',
                        ),
                  ),
                  Text(
                    data != null
                        ? '${(data.main!.temp! - 273.15).round()}℃'
                        : '',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black45,
                          fontFamily: 'flutterfonts',
                        ),
                  ),
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Text(
                    data?.weather?[0].description ?? '',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Colors.black45,
                          fontFamily: 'flutterfonts',
                          fontSize: 14,
                        ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
