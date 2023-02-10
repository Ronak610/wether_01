import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../until/Apihttp.dart';
import '../Modal/wethar_modal.dart';
import '../provider/Wethar_provider.dart';

class Wethar_page extends StatefulWidget {
  const Wethar_page({Key? key}) : super(key: key);

  @override
  State<Wethar_page> createState() => _Wethar_pageState();
}

class _Wethar_pageState extends State<Wethar_page> {
  WetherProvider? wetherProvidertrue;

  @override
  Widget build(BuildContext context) {
    var wetherProvidertrue = Provider.of<WetherProvider>(context, listen: true);

    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            FutureBuilder<WeatherModal?>(
                future: ApiHttp().getwether("${wetherProvidertrue.contry}"),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  } else if (snapshot.hasData) {
                    WeatherModal? data = snapshot.data;
                    return Stack(
                      children: [
                        Container(
                          height: MediaQuery
                              .of(context)
                              .size
                              .height,
                          width: double.infinity,
                          color: Colors.black,
                          child: Row(),
                        ),
                        Container(
                          height: 650,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.cyan,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(50),
                                bottomRight: Radius.circular(50)),
                          ),
                          child: Column(children: [
                            ListTile(
                              title: TextField(
                                controller: wetherProvidertrue.txtSearch,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              trailing: ElevatedButton(
                                  onPressed: () {
                                    wetherProvidertrue.ChnageCountry(
                                        wetherProvidertrue.txtSearch.text);
                                    Navigator.pushNamed(context, 'W');
                                  },
                                  child: Text("Search")),
                            ),
                            Text(
                              "${data!.name}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 35),
                            ),
                            Image.asset("assets/image/cloud.png"),
                            Text(
                              "${(data.main!.temp! - 273).toStringAsFixed(
                                  0)}",
                              style: TextStyle(
                                  fontSize: 150,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "${DateTime
                                  .now()
                                  .weekday == 1 ? "monday" : ""}${DateTime
                                  .now()
                                  .weekday == 1 ? "monday" : ""}${DateTime
                                  .now()
                                  .weekday == 2 ? "Tuesday" : ""}${DateTime
                                  .now()
                                  .weekday == 3
                                  ? "Wednesday"
                                  : ""}${DateTime
                                  .now()
                                  .weekday == 4 ? "Thursday" : ""}${DateTime
                                  .now()
                                  .weekday == 5 ? "friday" : ""}${DateTime
                                  .now()
                                  .weekday == 6
                                  ? "Saturday"
                                  : ""} ,${DateTime
                                  .now()
                                  .day} ${DateTime
                                  .now()
                                  .month == 1 ? "Jan" : ""}${DateTime
                                  .now()
                                  .month == 2 ? "Feb" : ""}${DateTime
                                  .now()
                                  .month == 3 ? "Mar" : ""}${DateTime
                                  .now()
                                  .month == 4 ? "Apr" : ""}${DateTime
                                  .now()
                                  .month == 5 ? "May" : ""}${DateTime
                                  .now()
                                  .month == 6 ? "Jun" : ""}${DateTime
                                  .now()
                                  .month == 7 ? "Jul" : ""}${DateTime
                                  .now()
                                  .month == 8 ? "Aug" : ""}${DateTime
                                  .now()
                                  .month == 9 ? "Sep" : ""}${DateTime
                                  .now()
                                  .month == 10 ? "Oct" : ""}${DateTime
                                  .now()
                                  .month == 11 ? "Nov" : ""}${DateTime
                                  .now()
                                  .month == 12 ? "Dec" : ""}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 5,
                                width: double.infinity,
                                color: Colors.white24,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment
                                  .spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(
                                      Icons.air,
                                      size: 35,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      "${data.wind!.speed} Km/h",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      "Wind",
                                      style: TextStyle(
                                          color: Colors.white70,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(
                                      Icons.water_drop_rounded,
                                      size: 35,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      "${data.main!.humidity} %",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      "Humidity",
                                      style: TextStyle(
                                          color: Colors.white70,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Icon(Icons.cloud,
                                          size: 35, color: Colors.white),
                                      Text(
                                        "${data.clouds!.all}%",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.white),
                                      ),
                                      Text(
                                        "${data.weather![0].description}",
                                        style: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ],),
                          ],
                          ),
                        ),
                      ],
                    );
                  }
                  return CircularProgressIndicator();
                }
            ),
          ],
        ),
      ),
    );
  }
}
