import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'location.dart';
import 'package:http/http.dart' as http;
const apikey= '06e6039dd310b4639b1b01f55d8be054';

void main() {
  runApp(Clima());
}
class Clima extends StatefulWidget {
  const Clima({Key key}) : super(key: key);

  @override
  _ClimaState createState() => _ClimaState();
}

class _ClimaState extends State<Clima> {
  double latitude;
  double longitude;
  @override
  void initState() {
    super.initState();
    getlocation();
  }
  void getlocation() async {
    Location location= Location();
    await location.getlocation();
    latitude = location.latitude;
    longitude = location.longitude;
    getdata();
  }
  void getdata() async{
 http.Response response= await http.get('https://samples.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid==$apikey');
 print(response.body);
 }
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: Center(
          child: SpinKitWanderingCubes(
            color: Colors.white ?? Colors.amber,
            size: 100,
          ),
        ),
      ),
    );
  }
}




















