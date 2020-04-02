
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'MaterialColors.dart';
import 'app_data/app_data.dart';
import 'database_helper.dart';
import 'model/market.dart';

class SponsorPage extends StatefulWidget {
  @override
  _SponsorPageState createState() => _SponsorPageState();
}

class _SponsorPageState extends State<SponsorPage> {
  TextEditingController roundController = TextEditingController();
  bool _correctRound = true;
  DatabaseHelper db = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
 Future<bool> _onExit(){
  return showDialog(context: context,builder: (context)=> AlertDialog(
          title: Text('Do you want to exit?'),
          actions: <Widget>[
            FlatButton(
              child: Text('Yes'),
              onPressed: () {
               SystemChannels.platform.invokeMethod('SystemNavigator.pop');
              },
            ),
            RaisedButton(
              color: MaterialColors.mpurple1,
              child: Text(
                'No',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.pop(context,false);
              },
            ),
          ],
        ));
}
    print(AppData.currentRound + 1);
    return WillPopScope(
          child: Scaffold(
        appBar: AppBar(
          title: Text("Round " + (AppData.currentRound + 1 + 1).toString()),
        ),
        body: SingleChildScrollView(
                  child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 20.0),
                child: Image.asset(AppData.sponsorImages[AppData.currentRound + 1],
                    scale: 1.4, width: 200.0, height: 200.0),
              ),
              // Container(
              //   padding: EdgeInsets.only(top: 10.0),
              //   child: Align(
              //     child: FloatingActionButton.extended(onPressed: null, label: Text("Back")),
              //     alignment: Alignment.bottomLeft,
              //   ),
              // ),
              Container(
                padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 40.0),
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    errorText: _correctRound ? null : "Enter a valid Round code",
                    border: OutlineInputBorder(),
                  ),
                  controller: roundController,
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20.0, left: 10.0, bottom: 90.0),
                child: Align(
                  alignment: Alignment.center,
                  child: FloatingActionButton(
                    child: Icon(Icons.add_alarm),
                    onPressed: () {
                      String roundCode =
                          roundController.text.toString().toLowerCase();
                      if (roundCode ==
                          AppData.sponsorCodes[AppData.currentRound + 1]) {
                        setState(() {
                          AppData.inRound += 1;
                          Market.allowPowerCards = false;
                          Market.isButtonDisabled = false;
                        });
                        Navigator.pushReplacementNamed(context, '/home');
                      } else {
                        setState(() {
                          _correctRound = false;
                        });
                      }
                    },
                    elevation: 10.0,
                  ),
                ),
              ),
              Container(
                padding:
                    EdgeInsets.only(left: MediaQuery.of(context).size.width * .07,bottom: 10),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: FloatingActionButton.extended(
                      heroTag: "btn1",
                      icon: Icon(Icons.navigate_before),
                      onPressed: () {
                        Market.isButtonDisabled = true;
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            '/home', (Route<dynamic> route) => false);
                      },
                      label: Text("Back")),
                ),
              ),
            ],
          ),
        ), //   <-- image
      ), onWillPop: _onExit,
    );
  }
}
