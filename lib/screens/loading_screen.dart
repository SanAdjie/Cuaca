import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  //Property


  //Method
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  Future getLocationData() async{
    var weatherData = await WeatherModel().getLocationWeather();
    print(weatherData);

      Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen(locationWeather: weatherData);
    })
    );
  }

  @override
  Widget build(BuildContext context) {

    //Method
    return Scaffold(
      body: Container(
        child: Center(
          child: SpinKitSpinningLines(
            color: Colors.white,
            size: 100,
          ),
        ),
      ),
    );
  }
}
