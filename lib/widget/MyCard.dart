// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import 'package:lottie/lottie.dart';
// import 'package:weather_project/controller/HomeController.dart';
// import '../constants/images.dart';

// class MyCard extends GetView<HomeController> {
//   @override
//   Widget build(BuildContext context) {
//     final weather = controller.currentWeatherData;
//     return Container(
//       decoration: BoxDecoration(
//         image: DecorationImage(
//           colorFilter: ColorFilter.mode(Colors.black38, BlendMode.darken),
//           image: const AssetImage('assets/images/cloud-in-blue-sky.jpg'),
//           fit: BoxFit.cover,
//         ),
//         borderRadius: const BorderRadius.only(
//           bottomLeft: Radius.circular(25),
//           bottomRight: Radius.circular(25),
//         ),
//       ),
//       child: Stack(
//         children: <Widget>[
//           AppBar(
//             backgroundColor: Colors.transparent,
//             elevation: 0,
//             leading: IconButton(
//               icon: const Icon(Icons.menu, color: Colors.white),
//               onPressed: () {},
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
//             child: TextField(
//               onChanged: (value) => controller.city = value,
//               textInputAction: TextInputAction.search,
//               onSubmitted: (_) => controller.updateWeather(),
//               style: const TextStyle(color: Colors.white),
//               decoration: InputDecoration(
//                 suffixIcon: const Icon(Icons.search, color: Colors.white),
//                 hintText: 'SEARCH',
//                 hintStyle: const TextStyle(color: Colors.white),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                   borderSide: const BorderSide(color: Colors.white),
//                 ),
//               ),
//             ),
//           ),
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Container(
//               height: MediaQuery.of(context).size.height / 4,
//               margin: const EdgeInsets.symmetric(horizontal: 15),
//               child: Card(
//                 elevation: 5,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(25),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(20),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Text(
//                         weather.name ?? '',
//                         style: Theme.of(context).textTheme.bodyLarge?.copyWith(
//                               fontWeight: FontWeight.bold,
//                               color: Colors.black45,
//                             ),
//                       ),
//                       Text(
//                         DateFormat.MMMMEEEEd().format(DateTime.now()),
//                         style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//                               color: Colors.black45,
//                             ),
//                       ),
//                       Divider(),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Column(
//                             children: [
//                               Text(
//                                 weather.weather?.first.description ?? '',
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .bodyLarge
//                                     ?.copyWith(
//                                       color: Colors.black45,
//                                     ),
//                               ),
//                               const SizedBox(height: 10),
//                               Text(
//                                 '${(weather.main?.temp ?? 273.15 - 273.15).round()}℃',
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .headlineMedium
//                                     ?.copyWith(
//                                       color: Colors.black45,
//                                     ),
//                               ),
//                               Text(
//                                 'Min: ${(weather.main?.tempMin ?? 273.15 - 273.15).round()}°C / Max: ${(weather.main?.tempMax ?? 273.15 - 273.15).round()}°C',
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .bodySmall
//                                     ?.copyWith(
//                                       color: Colors.black45,
//                                     ),
//                               ),
//                             ],
//                           ),
//                           Column(
//                             children: [
//                               SizedBox(
//                                 width: 120,
//                                 height: 120,
//                                 child: Lottie.asset(Images.cloudyAnim),
//                               ),
//                               Text(
//                                 'Wind: ${weather.wind?.speed ?? 0} m/s',
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .bodySmall
//                                     ?.copyWith(
//                                       color: Colors.black45,
//                                     ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_project/controller/HomeController.dart';
import '../constants/images.dart';

class MyCard extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    final weather = controller.currentWeatherData;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          colorFilter: ColorFilter.mode(Colors.black38, BlendMode.darken),
          image: const AssetImage('assets/images/cloud-in-blue-sky.jpg'),
          fit: BoxFit.cover,
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      child: Column(
        children: <Widget>[
          AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: TextField(
              onChanged: (value) => controller.city = value,
              textInputAction: TextInputAction.search,
              onSubmitted: (_) => controller.updateWeather(),
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                suffixIcon: const Icon(Icons.search, color: Colors.white),
                hintText: 'SEARCH',
                hintStyle: const TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.white),
                ),
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '${controller.currentWeatherData.name}'.toUpperCase(),
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Colors.black45,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    DateFormat().add_MMMMEEEEd().format(DateTime.now()),
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Colors.black45,
                          fontSize: 16,
                        ),
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(
                              '${controller.currentWeatherData.weather![0].description}'),
                          Text(
                              '${(controller.currentWeatherData.main!.temp! - 273.15).round()}°C'),
                          Text(
                              'Min: ${(controller.currentWeatherData.main!.tempMin! - 273.15).round()}°C / Max: ${(controller.currentWeatherData.main!.tempMax! - 273.15).round()}°C'),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Lottie.asset(Images.cloudyAnim,
                              width: 120, height: 120),
                          Text(
                              'Wind ${controller.currentWeatherData.wind!.speed} m/s'),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
