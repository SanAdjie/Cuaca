import 'package:clima/screens/city_screen.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/weather.dart';


class LocationScreen extends StatefulWidget {

  //Property
  final locationWeather;

  //Constructor
  LocationScreen({this.locationWeather});

  //Methods
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {

  var cuacaBerubah;

  WeatherModel cuaca = WeatherModel();

  double temperatur;
  int cuacaId;
  String namaDaerah;

  @override
  void initState() {
    super.initState();

    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState((){
      if(widget.locationWeather == null){
        temperatur = 0;
        cuacaId = 0;
        namaDaerah = "";
        return;
      }
    temperatur = widget.locationWeather["main"]['temp'];
    cuacaId = widget.locationWeather['weather'][0]['id'];
    namaDaerah = widget.locationWeather['name'];
    });
  }

  void updateUI2(dynamic weatherData) {
    setState((){
      if(cuacaBerubah == null){
        temperatur = 999;
        cuacaId = 0;
        namaDaerah = "-";
        return;
      }
      temperatur = cuacaBerubah["main"]['temp'];
      cuacaId = cuacaBerubah['weather'][0]['id'];
      namaDaerah = cuacaBerubah['name'];
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(cuaca.getGambar(cuacaId)),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      cuacaBerubah = await cuaca.getLocationWeather();
                      updateUI2(cuacaBerubah);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                      color: Colors.white,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                        var backwardData = await Navigator.push(context, MaterialPageRoute(builder: (context){
                          return CityScreen();
                        }));
                        if(backwardData != null){
                          cuacaBerubah = await cuaca.getCityWeather(backwardData);
                          updateUI2(cuacaBerubah);
                        }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '${temperatur.toStringAsFixed(0)}°',
                      style: kTempTextStyle,
                    ),
                    Text(cuaca.getWeatherIcon(cuacaId),
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                    ("${cuaca.getMessage(temperatur)}" + "\n di " + namaDaerah),
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
