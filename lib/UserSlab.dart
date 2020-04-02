import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vsm/model/market.dart';

import 'MaterialColors.dart';
import 'app_data/app_data.dart';

class UserSlab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => UserSlabState();
}

class UserSlabState extends State<UserSlab> {
  int currentQuantPurchased = 0;

  List sums = [0, 0, 0, 0, 0];
  int fsum = 0;
  int netWorth = 0, calculator = 0;
  @override
  Widget build(BuildContext context) {
    Future<bool> _onExit() {
      return showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text('Do you want to exit?'),
                actions: <Widget>[
                  FlatButton(
                    child: Text('Yes'),
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                  ),
                  RaisedButton(
                    color: MaterialColors.mpurple1,
                    child: Text(
                      'No',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.pop(context, false);
                    },
                  ),
                ],
              ));
    }

    dynamic variable;
    print(Market.setStocks);

    // for (int i = 0; i < 5; i++) {
    // Market.setStocks[i][AppData.currentRound + 1] > 0
    //     ? currentQuantPurchased =
    //         Market.setStocks[i][AppData.currentRound + 1]
    //     : currentQuantPurchased = 0;
    // profit += (currentQuantPurchased *
    //     (Market.difference[AppData.currentRound + 1][i]));
    sums = [0, 0, 0, 0, 0];
    fsum = 0;
    for (int i = 0; i < 5; i++) {
      for (int j = 0; j < 5; j++) {
        sums[i] += Market.setStocks[i][j];
      }
    }
    for (int i = 0; i < 5; i++) {
      sums[i] *= Market.sellingPrice[i][AppData.currentRound + 2];
    }

    for (int i = 0; i < 5; i++) {
      fsum += sums[i];
    }

    setState(() {
      calculator = Market.userMoney + fsum;
      netWorth = calculator - AppData.prevNetWorth;
      AppData.prevNetWorth = calculator;
    });

    // }
   
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    if (AppData.currentRound == 3) {
      sums = [0, 0, 0, 0, 0];
      fsum = 0;
      for (int i = 0; i < 5; i++) {
        for (int j = 0; j < 5; j++) {
          sums[i] += Market.setStocks[i][j];
        }
      }
      for (int i = 0; i < 5; i++) {
        sums[i] *= Market.sellingPrice[i][AppData.currentRound + 2];
      }

      for (int i = 0; i < 5; i++) {
        fsum += sums[i];
      }
      netWorth = Market.userMoney + fsum;
      variable = "Networth : " + netWorth.toString();
    }
    
    // for (int i = 0; i < 5; i++) {
    //  // networth =
    //   // netWorth +=
    //   //     Market.stocks[i] * Market.sellingPrice[i][AppData.currentRound + 1] -
    //   //         (15 - Market.currentstock[i]) *
    //   //             Market.sellingPrice[i][AppData.currentRound + 2];

    // }
    if (Market.powerCard2Active) {
      bool isNegative = true;
      netWorth < 0 ? netWorth *= -1 : isNegative = false;
      int multiplier = (netWorth * 0.1).round();
      multiplier > 1500 ? multiplier = 1500 : multiplier = multiplier;
      if (isNegative) {
        netWorth *= -1;
        netWorth = netWorth + multiplier;
      } else {
        netWorth = netWorth + multiplier;
      }
      Market.powerCard2Active = false;
    }
 if (netWorth >= 0) {
      variable = "Net : +" + netWorth.toString();
    }
    if (netWorth < 0) {
      variable = "Net : " + netWorth.toString();
    }
    // this is the networth value
    // Update from the database

    Color c;
    if (netWorth < 0) {
      c = Colors.red;
    } else if (netWorth < 500 && netWorth >= 0) {
      c = Colors.indigo;
    } else if (netWorth >= 500 && netWorth < 1500) {
      c = Colors.pink[200];
    } else if (netWorth >= 1500 && netWorth < 5000) {
      c = Colors.orange;
    } else if (netWorth >= 5000 && netWorth < 7500) {
      c = Colors.yellow;
    } else if (netWorth >= 7500 && netWorth < 10000) {
      c = Colors.green;
    } else if (netWorth >= 10000) {
      c = Colors.purpleAccent;
    }
    if (AppData.currentRound == 3) {
      if (netWorth < 30000) {
        c = Colors.indigo;
      } else if (netWorth >= 30000 && netWorth < 50000) {
        c = Colors.red;
      } else if (netWorth >= 50000 && netWorth < 70000) {
        c = Colors.orange;
      } else if (netWorth >= 70000 && netWorth < 90000) {
        c = Colors.yellow;
      } else if (netWorth >= 90000 && netWorth < 11000) {
        c = Colors.green;
      } else if (netWorth >= 10000) {
        c = Colors.purpleAccent;
      }
    }

    return WillPopScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: MaterialColors.mpurple1,
            title: RichText(
              text: TextSpan(
                  text: "Market Closedown ",
                  style:
                      TextStyle(fontWeight: FontWeight.w500, fontSize: 24.0)),
            ),
          ),
          body: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                    top: deviceHeight * .05, left: deviceWidth * 0.05),
                color: MaterialColors.mblue,
                height: deviceHeight * .16,
                width: deviceWidth * .70,
                child: Align(
                  alignment: Alignment.center,
                  child: RichText(
                    text: TextSpan(
                        text: "Market Closedown!",
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w400,
                            fontSize: 22.0,
                            )),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: deviceHeight * .14, left: deviceWidth * .05),
                color: c,
                child: Align(
                  alignment: Alignment.center,
                  child: RichText(
                    text: TextSpan(
                        text: variable,
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w400,
                            fontSize: 22.0,
                            )),
                  ),
                ),
                height: deviceHeight * .1,
                width: deviceWidth * .70,
              ),
              Container(
                margin: EdgeInsets.only(
                    top: deviceHeight * .04, right: deviceWidth * .04),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: FloatingActionButton(
                    child: Icon(Icons.navigate_next),
                    splashColor: MaterialColors.mpurple1,
                    onPressed: () {
                      for (int i = 0; i < 5; i++) {
                        Market.currentstock[i] = 15;
                      }
                      AppData.currentRound++;
                      Navigator.pushReplacementNamed(context, '/home');
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      onWillPop: _onExit,
    );
  }
}
