import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_project/constants/images.dart';
import '../../controller/HomeController.dart';

class HomeScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeController>(builder: (controller) {
        return SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _buildHeader(context, controller),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildHeader(BuildContext context, HomeController controller) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          colorFilter: ColorFilter.mode(Colors.black38, BlendMode.darken),
          image: AssetImage('assets/images/cloud-in-blue-sky.jpg'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.only(
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
              icon: Icon(Icons.menu, color: Colors.white),
              onPressed: () {},
            ),
          ),
          _buildSearchBar(controller),
          _buildWeatherCard(context, controller),
        ],
      ),
    );
  }

  Widget _buildSearchBar(HomeController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: TextField(
        onChanged: (value) => controller.city = value,
        style: TextStyle(color: Colors.white),
        textInputAction: TextInputAction.search,
        onSubmitted: (value) => controller.updateWeather(),
        decoration: InputDecoration(
          suffixIcon: Icon(Icons.search, color: Colors.white),
          hintStyle: TextStyle(color: Colors.white),
          hintText: 'SEARCH',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _buildWeatherCard(BuildContext context, HomeController controller) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
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
            _buildWeatherDetails(controller),
          ],
        ),
      ),
    );
  }

  Widget _buildWeatherDetails(HomeController controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          children: <Widget>[
            Text('${controller.currentWeatherData.weather![0].description}'),
            Text(
                '${(controller.currentWeatherData.main!.temp! - 273.15).round()}°C'),
            Text(
                'Min: ${(controller.currentWeatherData.main!.tempMin! - 273.15).round()}°C / Max: ${(controller.currentWeatherData.main!.tempMax! - 273.15).round()}°C'),
          ],
        ),
        Column(
          children: <Widget>[
            // Lottie.asset(Images.cloudyAnim, width: 120, height: 120),
            if (controller.currentWeatherData.weather![0].main == 'Rain')
              Image(
                  image: AssetImage('assets/images/rain.png'),
                  width: 80,
                  height: 80)
            else if (controller.currentWeatherData.weather![0].main == 'Clear')
              Image(
                image: AssetImage('assets/images/verySuny.png'),
                width: 80,
                height: 80,
              )
            else if (controller.currentWeatherData.weather![0].main == 'Snow')
              Image(
                image: AssetImage('assets/images/iced.png'),
                width: 80,
                height: 80,
              )
            else
              Image(
                  image: AssetImage('assets/images/suny.png'),
                  width: 80,
                  height: 80),

            Text('Wind ${controller.currentWeatherData.wind!.speed} m/s'),
          ],
        ),
      ],
    );
  }
}
