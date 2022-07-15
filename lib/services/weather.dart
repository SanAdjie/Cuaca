import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

class WeatherModel {
  LokasiCuaca cuaca = LokasiCuaca();

  int indexGambar;
  String latitude;
  String longitude;

  List<String> linkGIF = [
    //Hujan Bledek
    "https://i.pinimg.com/originals/ce/eb/2a/ceeb2a360c12badbcade94ed02d01283.gif",
    //Hujan
    "https://i.pinimg.com/originals/d3/58/1c/d3581ce877a35b4a8b44523e8ff6fdec.gif",
    //Hujan Ringan,
    "https://i.pinimg.com/originals/0d/2b/9d/0d2b9d6b72b3556948da08add5027f6a.gif",
    //Salju
    "https://i.pinimg.com/originals/4b/1a/91/4b1a917fc966487b2699ea5d29e70e18.gif",
    //
    "https://i.pinimg.com/originals/ca/cf/64/cacf64036a76e5b1a09a8b6a35ac9492.gif",
    //
    "https://giffiles.alphacoders.com/400/4006.gif"
  ];

  Future getLocationWeather() async{
    await cuaca.getLocationInit();
    latitude = cuaca.latitude.toString();
    longitude = cuaca.longitude.toString();
    print(latitude);
    print(longitude);

    NetworkHelper jaringanApi = NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=679dd247723a578e229d80420c74103e&units=metric');

    var dataCuaca = await jaringanApi.getData();

    return dataCuaca;
  }

  Future getCityWeather(String namaKota) async{

    NetworkHelper jaringanApi = NetworkHelper('https://api.openweathermap.org/data/2.5/weather?q=$namaKota&appid=679dd247723a578e229d80420c74103e&units=metric');

    var dataCuaca = await jaringanApi.getData();

    return dataCuaca;
  }



  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getGambar(int condition) {
    if (condition < 300) {
      return linkGIF[0];
    } else if (condition < 400) {
      return linkGIF[1];
    } else if (condition < 600) {
      return linkGIF[2];
    } else if (condition < 700) {
      return linkGIF[3];
    } else if (condition < 800) {
      return linkGIF[4];
    } else if (condition == 800) {
      return linkGIF[5];
    } else if (condition <= 804) {
      return linkGIF[5];
    } else {
      return linkGIF[5];
    }
  }

  String getMessage(double temp) {
    if(temp > 100){
      return 'Data Cuaca Error';
    } else if (temp > 25) {
      return 'Saatnya Nyerang Es 🍹';
    } else if (temp > 20) {
      return 'Cocok buat Istirahat 😴';
    } else if (temp < 10) {
      return 'Dingin, enak untuk tidur 🛌🏼';
    } else {
      return 'Pakai ini ya🧥';
    }
  }
}
