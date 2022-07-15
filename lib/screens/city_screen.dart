import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String namaKota;

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage("https://64.media.tumblr.com/235a889370d3abf085934ccb958a328d/0cf975fb0b55b684-8e/s1280x1920/c122a96a54edc2380834c758dccc71d96e79df1f.gifv")
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context,namaKota);
                    },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  onChanged: (value){
                    namaKota = value;
                    print(namaKota);
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20, 5, 2, 5),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    hintText: 'Masukkan Lokasi',
                    filled: true,
                    icon: Icon(Icons.location_city, color: Colors.white,size: 50)
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context, namaKota);
                },
                child: Text(
                  'Dapatkan Cuaca',
                  style: kButtonTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
