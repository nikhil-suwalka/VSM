import 'package:flutter/material.dart';
import 'package:vsm/HomePageBody.dart';

class StockPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: new EdgeInsets.only(bottom: 16.0),
      color: Colors.white,
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          new InkWell(
            child: HomePageBody("assets/images/India.png", "INDIA",
                "India  is the seventh-largest country and the most populous democracy in the world. Capital: Delhi"),
            onTap: () {
              print("Hello1");
            },
          ),
          new InkWell(
            child: HomePageBody("assets/images/USA.png", "USA",
                "USA is a country comprising 50 states, five major self-governing territories, and various possessions. Capital: Washington D.C."),
            onTap: () {
              print("Hello2");
            },
          ),
          new InkWell(
            child: HomePageBody("assets/images/China.png", "CHINA",
                "China, is a country in East Asia and is the world's most populous country, with a population of around 1.428 billion in 2017. Capital: Beijing"),
            onTap: () {
              print("Hello3");
            },
          ),
          new InkWell(
            child: HomePageBody(
                "assets/images/Russia.png",
                "RUSSIA",
                "Russia, is a European country located in Eastern Europe with a vast expanse of territory that stretches across Northern Asia. Capital: Moscow"),
            onTap: () {
              print("Hello4");
            },
          ),
          new InkWell(
            child: HomePageBody(
                "assets/images/Iran.png",
                "IRAN",
                "Iran , also called Persia, and officially the Islamic Republic of Iran, is a country in Western Asia. Capital: Tehran"),
            onTap: () {
              print("Hello5");
            },
          ),
        ],
      ),
    );
  }
}
