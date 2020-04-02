class Market {
  final String title;
  final String subtitle;
  final String imageUrl;

  static var currentstock = [15,15,15,15,15];
  static int userMoney = 100000;
  static int powerCard1 = 0;
  static int powerCard2 = 0;
  static int boughtPowerCard1 = 0;
  static int boughtPowerCard2 = 0;
  static var stocks = [0, 0, 0, 0, 0];
  static var setStocks = [[0, 0, 0, 0, 0, 0],[0, 0, 0, 0, 0, 0],[0, 0, 0, 0, 0, 0],[0, 0, 0, 0, 0, 0],[0, 0, 0, 0, 0, 0]];
  static var sellingPrice = [[1900,2100,2300,2500,2200,2600],[3000,3400,3300,3500,3600,3800],[2350,2200,2000,2200,2400,2300],[2400,2000,2450,2550,2650,2750],[1200,1100,1150,1450,1650,1100]];
  static int availPowerCard1=1;
  static int availPowerCard2=2;
  //static var difference = [[200, 400, -150, -400, -100],[200, -200, -150, -150, 50],[150, 300, 75, 150, 300],[-300, -150, -100, 50, 200],[-50, -250, 125, 100, -550]];
  static bool counterResetPower = false;
  static bool allowPowerCards = true;
  static bool hasPowerCode = false;
  static bool powerCard1Active = false;
  static bool powerCard2Active = false;
  static bool isButtonDisabled = true;
  static bool timerStarted = false;
  static var sold = 0;

  static final List powerCode = [
    "513abc",
    "y832a3",
    "aw2314",
    "va134a",
  ];

  Market({
    this.title,
    this.subtitle,
    this.imageUrl,
  });
}
