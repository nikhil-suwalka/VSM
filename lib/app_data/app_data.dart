

import 'package:vsm/model/profile.dart';
import 'package:vsm/model/market.dart';
import 'package:vsm/model/trial.dart';

class AppData {
  static List<Profile> profiles = [
    new Profile(
      title: "INDIA",
      imageUrl: "assets/images/India.png",
      quantity: Market.stocks[0].toString(),
      sellingPrice: Market.sellingPrice[0][inRound].toString(),
    ),
    Profile(
      title: "USA",
      imageUrl: "assets/images/USA.png",
      quantity: Market.stocks[1].toString(),
      sellingPrice: Market.sellingPrice[1][inRound].toString(),
    ),
    Profile(
      title: "CHINA",
      imageUrl: "assets/images/China.png",
      quantity: Market.stocks[2].toString(),
      sellingPrice: Market.sellingPrice[2][inRound].toString(),
    ),
    Profile(
      title: "RUSSIA.",
      imageUrl: "assets/images/Russia.png",
      quantity: Market.stocks[3].toString(),
      sellingPrice: Market.sellingPrice[3][inRound].toString(),
    ),
    Profile(
      title: "IRAN",
      imageUrl: "assets/images/Iran.png",
      quantity: Market.stocks[4].toString(),
      sellingPrice: Market.sellingPrice[4][inRound].toString(),
    ),
  ];

  static List<Market> stocks = [
    Market(
      title: "India",
      subtitle: Market.sellingPrice[0][inRound].toString(),
      imageUrl: "assets/images/India.png",
    ),
    Market(
      title: "USA",
      subtitle: Market.sellingPrice[1][inRound].toString(),
      imageUrl: "assets/images/USA.png",
    ),
    Market(
      title: "China",
      subtitle: Market.sellingPrice[2][inRound].toString(),
      imageUrl: "assets/images/China.png",
    ),
    Market(
      title: "Russia",
      subtitle: Market.sellingPrice[3][inRound].toString(),
      imageUrl: "assets/images/Russia.png",
    ),
    Market(
      title: "Iran",
      subtitle: Market.sellingPrice[4][inRound].toString(),
      imageUrl: "assets/images/Iran.png",
    )
  ];
   static List<Market> trialStocks = [
    Market(
      title: "Oculus",
      subtitle: Trial.sellingPrice[0][inRound].toString(),
      imageUrl: "assets/images/oculus.jpg",
    ),
    Market(
      title: "CTech",
      subtitle: Trial.sellingPrice[1][inRound].toString(),
      imageUrl: "assets/images/trialLogo2.png",
    ),
    Market(
      title: "Purohit",
      subtitle: Trial.sellingPrice[2][inRound].toString(),
      imageUrl: "assets/images/purohit.jpg",
    ),
 
  ];

  static var sponsorImages = ['assets/images/trialLogo1.png', 'assets/images/trialLogo2.png', 'assets/images/trialLogo1.png', 'assets/images/trialLogo2.png', 'assets/images/trialLogo1.png'];
  static var sponsorCodes = ['ixqsuk', 'isduqv', 'bhayip', 'uxyafq', 'edkpbf'];
  static var trialSponserCodes = ['123','789'];
  // Round 2nd Sponsor codes = ['ixqsuk', 'isduqv', 'bhayip', 'uxyafq', 'edkpbf'];
  static var prevNetWorth = 100000;
  static int currentRound = -1;
  static int countTimer = 10;
  static int inRound = 0;
  static int trialRound = -1;
  static var trailprevNetWorth = 20000;

}
