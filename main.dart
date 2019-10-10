import 'package:buypage/add_address.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:toast/toast.dart';
import 'package:timer_builder/timer_builder.dart';
import 'select_address.dart';
import 'fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var myController = TextEditingController(text: "");
  var myController2 = TextEditingController(text: "");
  var deviceHeight;
  var deviceWidth;

  var dialogBoxHeight = 0.0;
  var dialogBoxWidth = 0.0;
  var bgLayerHeight = 0.0;

  double qtyBoxValue = 0.0;
  double costBoxValue = 0.0;
  double cost = 0.0;
  double quantity = 0.0;
  double qtyRoundOff = 0.0;
  double costRoundOff = 0.0;
  double costRoundOfFinal = 0.0;

  double finalAmmount;
  var costText;
  var qtyText;

  bool textEnabled = false;

  var gold999LivePrice = 3907.37;
  var gold999GstPrice = 4024.59;

  var gold916LivePrice = 3588.78;
  var gold916GstPrice = 3696.44;

  var silverLivePrice = 47.95;
  var silverGstPrice = 49.39;

  double currenrLivePrice = 0.0;
  double currentLiveGst = 0.0;

  var button916Colour = Colors.white;
  var button999Colour = Colors.white;
  var buttonSilverColour = Colors.white;

  var textColour916 = Colors.black;
  var textColour999 = Colors.black;
  var textColourSilver = Colors.black;

  DateTime alert;
  bool expired;
  bool checker = false;
  void button916() {
    setState(() {
      button916Colour = Colors.blue;
      textColour916 = Colors.white;

      button999Colour = Colors.white;
      textColour999 = Colors.black;

      buttonSilverColour = Colors.white;
      textColourSilver = Colors.black;

      currenrLivePrice = gold916LivePrice;
      currentLiveGst = gold916GstPrice;
      textEnabled = true;

     
    });
    costCalculator();
  }

  void button999(context) {
    setState(() {
      button999Colour = Colors.blue;
      textColour999 = Colors.white;

      button916Colour = Colors.white;
      textColour916 = Colors.black;

      buttonSilverColour = Colors.white;
      textColourSilver = Colors.black;

      currenrLivePrice = gold999LivePrice;
      currentLiveGst = gold999GstPrice;
      textEnabled = true;
    });
    costCalculator();
  }

  void buttonSilver() {
    setState(() {
      buttonSilverColour = Colors.blue;
      textColourSilver = Colors.white;

      button999Colour = Colors.white;
      textColour999 = Colors.black;

      button916Colour = Colors.white;
      textColour916 = Colors.black;

      currenrLivePrice = silverLivePrice;
      currentLiveGst = silverGstPrice;
      textEnabled = true;

    });
    costCalculator();
  }

  void costCalculator() {
    setState(() {
      if (myController2.text == "0" ||
          myController2.text == "" ||
          myController2.text == "0.0") {
        costText = "0.0";
      }
      if (myController.text == "0" ||
          myController.text == "" ||
          myController.text == "0.0") {
        qtyBoxValue = 10;
      } else {
        cost = qtyBoxValue * currentLiveGst;
        costRoundOff = double.parse(cost.toStringAsFixed(2));
        costText = costRoundOff.toString();

        myController2.text = costText;
      }
    });
  }

  void quantityCalculator() {
    setState(() {
      // quantity = 0;
      if (myController.text == "0" ||
          myController.text == "" ||
          myController.text == "0.0") {
        costText = "0.0";
        qtyText = "0.00";
      }
      if (myController2.text == "0" ||
          myController2.text == "" ||
          myController2.text == "0.0") {
        costBoxValue = 0;
      }
      quantity = costBoxValue / currentLiveGst;
      qtyRoundOff = double.parse(quantity.toStringAsFixed(2));
      qtyText = qtyRoundOff.toString();
      myController.text = qtyText;

      costText = myController2.text;
    });
  }

  void openDialogBox() {
    dialogBoxHeight = 240;
    dialogBoxWidth = deviceWidth * 0.95;

    bgLayerHeight = deviceHeight;
  }

  void closeDialogBox() {
    dialogBoxHeight = 0.0;
    dialogBoxWidth = 0.0;

    bgLayerHeight = 0.0;
  }

  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
        builder: (BuildContext bc) {
          return Container(
            height: deviceHeight * 0.30,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: deviceWidth,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 0),
                      child: Text(
                        "Billing Address",
                        style: TextStyle(
                            fontFamily: Fonts().fontRegular,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: deviceWidth,
                  height: 0.3,
                  color: Colors.grey.shade300,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          // height: deviceHeight * 0.35,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 22, top: 12),
                            child: Center(
                              child: Icon(
                                Icons.location_on,
                                color: Colors.lightBlue,
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: Container(
                            height: deviceHeight * 0.11,
                            width: deviceWidth * 0.55,
                            child: Scrollbar(
                              child: SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Text(
                                    selectedAddress,
                                    style: TextStyle(
                                        fontFamily: Fonts().fontRegular,
                                        fontSize: 13,
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    FlatButton(
                      // color: Colors.yellow,
                      onPressed: () {
                        if (addressText == "Add Address") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddAddress()),
                          );
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SelectAddress()),
                          );
                        }
                      },
                      // color: Colors.lightBlue,

                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(7))),
                      child: Text(
                        addressText,
                        style: TextStyle(
                          fontFamily: Fonts().fontRegular,
                          fontSize: 11,
                          // fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: deviceWidth,
                  // color: Colors.yellow,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 0, left: 20, right: 20, bottom: 20),
                    child: RaisedButton(
                      onPressed: () {
                        print("hello");
                      },
                      color: Colors.lightBlue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(7))),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 12, bottom: 12),
                        child: Text(
                          "Pay",
                          style: TextStyle(
                              fontFamily: Fonts().fontRegular,
                              fontSize: 14,
                              // fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }

  @override
  void initState() {
    super.initState();
    alert = DateTime.now().add(Duration(minutes: 5));
    WidgetsBinding.instance.addPostFrameCallback((_) => button999(context));
  }

  @override
  void dispose() {
    myController.dispose();
    myController2.dispose();

    super.dispose();
  }

  String formatDuration(Duration d) {
    String f(int n) {
      return n.toString().padLeft(2, '0');
    }

    // We want to round up the remaining time to the nearest second
    d += Duration(microseconds: 999999);
    return "${f(d.inMinutes)}:${f(d.inSeconds % 60)}";
  }

  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.2,
          title: Text(
            "Buy",
            style:
                TextStyle(fontFamily: Fonts().fontRegular, color: Colors.black),
          ),
          centerTitle: true,
          leading: Icon(Icons.arrow_back, color: Colors.black),
        ),
        body: Stack(
          children: <Widget>[
            TimerBuilder.scheduled([alert], builder: (context) {
              var now = DateTime.now();
              var reached = now.compareTo(alert) >= 0;
              reached ? expired = true : expired = false;

              if (reached ? expired = true : expired = false) {
                // Toast.show("time Up!", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
                // openSearch();
                // _animSearchHeight = 240;
                // height = deviceHeight;
                print("time expired");

                // showDialog(context: context);
                openDialogBox();
                // checker =true;
              }
              return SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    //Choose commodity container starts.
                    Container(
                      width: deviceWidth,
                      height: deviceHeight * 0.06,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 23,
                        ),
                        child: Align(
                          child: Text(
                            "CHOOSE COMMODITY",
                            style: TextStyle(
                                fontFamily: Fonts().fontRegular,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade900),
                          ),
                          alignment: Alignment.centerLeft,
                        ),
                      ),
                    ),
                    //commodity container ends.

                    //The row for three buttons for choosing the given commodities starts.
                    Container(
                      width: deviceWidth,
                      height: deviceHeight * 0.07,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              onPressed: () {
                                button999(context);
                              },
                              elevation: 3,
                              color: button999Colour,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 10, bottom: 10),
                                child: Text(
                                  "999 Gold",
                                  style: TextStyle(
                                    fontFamily: Fonts().fontRegular,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: textColour999,
                                  ),
                                ),
                              ),
                            ),
                            RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              onPressed: () {
                                button916();
                              },
                              elevation: 3,
                              color: button916Colour,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 10, bottom: 10),
                                child: Text(
                                  "916 Gold",
                                  style: TextStyle(
                                      fontFamily: Fonts().fontRegular,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: textColour916),
                                ),
                              ),
                            ),
                            RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              onPressed: () {
                                buttonSilver();
                              },
                              elevation: 3,
                              color: buttonSilverColour,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, top: 10, bottom: 10),
                                child: Text(
                                  "Silver",
                                  style: TextStyle(
                                      fontFamily: Fonts().fontRegular,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: textColourSilver),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // The button container ends.

                    //Container for showing commodity details starts.
                    Container(
                      height: deviceHeight * 0.17,
                      width: deviceWidth,
                      // color: Colors.cyan,
                      child: Center(
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          elevation: 2,
                          color: Colors.lightBlue.shade50,
                          child: Container(
                            height: deviceHeight * 0.13,
                            width: deviceWidth * 0.88,
                            // Column and row for showing selected commodity details.
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(right: 5),
                                            child: Icon(
                                              Icons.account_balance_wallet,
                                              color: Colors.black,
                                              size: 17,
                                            ),
                                          ),
                                          Text(
                                            "Live Price",
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.black,
                                                fontFamily:
                                                    Fonts().fontRegular),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "$currenrLivePrice",
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.black,
                                            fontFamily: Fonts().fontRegular),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 7, bottom: 5),
                                              child: Container(
                                                width: 15,
                                                height: 15,
                                                child: DecoratedBox(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                            'Asset/icons/PriceGstIcon.png'),
                                                        fit: BoxFit.contain,
                                                        alignment: Alignment
                                                            .topCenter),
                                                    // ...
                                                  ),
                                                ),
                                              )),
                                          Text(
                                            "Price GST Incl.",
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.black,
                                                fontFamily:
                                                    Fonts().fontRegular),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "$currentLiveGst",
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.black,
                                            fontFamily: Fonts().fontRegular),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(right: 5),
                                            child: Icon(
                                              Icons.timer,
                                              color: Colors.black,
                                              size: 17,
                                            ),
                                          ),
                                          Text(
                                            "Price expires in",
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.black,
                                                fontFamily:
                                                    Fonts().fontRegular),
                                          ),
                                        ],
                                      ),
                                      !reached
                                          ? TimerBuilder.periodic(
                                              Duration(seconds: 1),
                                              alignment: Duration.zero,
                                              builder: (context) {
                                              // This function will be called every second until the alert time
                                              var now = DateTime.now();
                                              var remaining =
                                                  alert.difference(now);
                                              return Text(
                                                formatDuration(remaining),
                                                style: TextStyle(
                                                    fontFamily:
                                                        Fonts().fontMedium,
                                                    fontSize: 12),
                                              );
                                            })
                                          : Text("Time Out",
                                              style: TextStyle(
                                                  fontFamily:
                                                      Fonts().fontMedium,
                                                  fontSize: 12)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    //Container for showing selected commodity details end.

                    //Container for Calculation boxes.
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Container(
                        width: deviceWidth * 0.95,
                        height: deviceHeight * 0.10,
                        // color: Colors.green,
                        // width: calcBoxWidth,
                        // curve: Curves.bounceOut,
                        // duration: Duration(seconds: 1),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            SizedBox(
                              height: 58,
                              width: 150,
                              child: TextField(
                                enabled: textEnabled,
                                controller: myController,
                                onChanged: (text) {
                                  setState(() {
                                    if (myController.text == "" ||
                                        myController.text == "0" ||
                                        myController.text == "0.0") {
                                      print(
                                          "This is from the myController text = $myController.text");
                                      myController2.text = "";

                                      costText = "0.0";
                                      qtyText = "0.0";
                                      qtyBoxValue = 0;
                                    } else {
                                      qtyBoxValue = double.parse(text);
                                      quantity = qtyBoxValue;
                                      costCalculator();
                                    }

                                    print(
                                        "THIS IS THE LIVE VALUE FROM COST BOX = $myController2.text");
                                  });

                                  print("First text field: $qtyBoxValue");
                                },
                                keyboardAppearance: Brightness.dark,

                                style:
                                    TextStyle(fontFamily: Fonts().fontRegular),
                                decoration: InputDecoration(
                                  // hintStyle: TextStyle(),
                                  border: OutlineInputBorder(
                                    // borderSide: BorderSide(width: 20, color: Colors.black),
                                    borderSide:
                                        BorderSide(color: Colors.yellow),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(7)),
                                  ),
                                  labelText: 'Enter quantity (gms)',
                                  labelStyle: TextStyle(
                                      decorationStyle:
                                          TextDecorationStyle.solid,
                                      fontSize: 12,
                                      color: Colors.black54,
                                      fontFamily: Fonts().fontRegular),
                                ),
                                // inputFormatters: [WhitelistingTextInputFormatter.],
                                keyboardType: TextInputType.numberWithOptions(
                                    decimal: false),
                              ),
                            ),
                            Icon(
                              Icons.compare_arrows,
                              color: Colors.black,
                            ),
                            SizedBox(
                              height: 58,
                              width: 150,
                              child: TextField(
                                enabled: textEnabled,
                                controller: myController2,
                                onChanged: (text) {
                                  myController2.selection =
                                      TextSelection.fromPosition(TextPosition(
                                          offset: myController2.text.length));

                                  setState(() {
                                    checker = true;
                                    if (myController2.text == "0" ||
                                        myController2.text == "" ||
                                        myController2.text == "0.0") {
                                      // print(
                                      //     "This is from the myController2 text = $myController2.text");
                                      myController.text = "";
                                      // cost = 0;
                                      costText = "0.0";
                                      // qtyBoxValue =
                                      //     0; //For not re-printing old value Do not delete.
                                      costBoxValue = 0;
                                    } else {
                                      costBoxValue = double.parse(text);
                                      cost = costBoxValue;
                                      quantityCalculator();
                                      qtyBoxValue =
                                          double.parse(myController.text);
                                    }

                                    // myController2=costText;

                                    print(
                                        "\n\nCOST TEXT Value from onChange of MyCOntroller2 = $costText\n\n");
                                  });
                                  print(
                                      "myController2.text inte value (INSIDE 2ND TEXT FIELD) anu ithu = $myController2.text");
                                },
                                style:
                                    TextStyle(fontFamily: Fonts().fontRegular),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    // borderSide: BorderSide(width: 20, color: Colors.black),
                                    borderSide:
                                        BorderSide(color: Colors.yellow),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(7)),
                                  ),
                                  labelText: 'Enter cost',
                                  labelStyle: TextStyle(
                                      decorationStyle:
                                          TextDecorationStyle.solid,
                                      fontSize: 12,
                                      color: Colors.black54,
                                      fontFamily: Fonts().fontRegular),
                                ),
                                // inputFormatters: [WhitelistingTextInputFormatter.],
                                keyboardType: TextInputType.numberWithOptions(
                                    decimal: false),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    //Container for calculation boxes ends.

                    //Container for coupon section starts
                    Container(
                      // height: deviceHeight * 0.06,
                      width: deviceWidth,
                      // color: Colors.yellow,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 25, top: 10),
                            child: Align(
                              child: Text(
                                "Avail Coupon",
                                style: TextStyle(
                                  fontFamily: Fonts().fontRegular,
                                  fontSize: 15,
                                  color: Colors.grey.shade600,
                                  // fontWeight: FontWeight.bold
                                ),
                              ),
                              alignment: Alignment.centerLeft,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 21, right: 23, top: 10, bottom: 10),
                            child: Card(
                              elevation: 3,
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7)),
                              ),
                              child: InkWell(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7)),
                                onTap: () {
                                  print("object");
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(right: 5),
                                            child: Icon(
                                              Icons.access_time,
                                              size: 17,
                                              color: Colors.orange,
                                            ),
                                          ),
                                          Text(
                                            "Enter Coupon",
                                            style: TextStyle(
                                              fontFamily: Fonts().fontRegular,
                                              fontSize: 13,
                                              color: Colors.grey.shade600,
                                              // fontWeight: FontWeight.bold
                                            ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Text(
                                            "Choose",
                                            style: TextStyle(
                                              fontFamily: Fonts().fontRegular,
                                              fontSize: 13,
                                              color: Colors.grey.shade600,
                                              // fontWeight: FontWeight.bold
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 5),
                                            child: Icon(
                                              Icons.keyboard_arrow_right,
                                              color: Colors.orange,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    // The container for coupon section ends.

                    //bottom payment section starts.
                    Container(
                      width: deviceWidth,
                      height: deviceHeight * 0.361,
                      // color: Colors.yellow,
                      child: Align(
                        child: Container(
                          width: deviceWidth,
                          height: 79,
                          color: Colors.grey.shade100.withOpacity(0.5),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 30, right: 30, top: 10, bottom: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: Text(
                                        "TOTAL PAYMENT",
                                        style: TextStyle(
                                            fontFamily: Fonts().fontRegular,
                                            fontSize: 14,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.attach_money,
                                          size: 17,
                                          color: Colors.blueAccent,
                                        ),
                                        Text(
                                          "$costText",
                                          style: TextStyle(
                                              fontFamily: Fonts().fontRegular,
                                              fontSize: 15,
                                              color: Colors.blueAccent,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: RaisedButton(
                                    onPressed: () {
                                      _settingModalBottomSheet(context);
                                      adressDynamicButton();
                                    },
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(7))),
                                    color: Colors.lightBlue,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20,
                                          right: 20,
                                          top: 12,
                                          bottom: 12),
                                      child: Text(
                                        "PROCEED",
                                        style: TextStyle(
                                            fontFamily: Fonts().fontRegular,
                                            fontSize: 12,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        alignment: Alignment.bottomCenter,
                      ),
                    ),
                  ],
                ),
              );
            }),
            //Custom dialog box starts
            AnimatedContainer(
              color: Colors.black45.withOpacity(0.5),
              height: bgLayerHeight,
              width: deviceWidth,
              curve: Curves.bounceOut,
              duration: Duration(milliseconds: 100),
              child: Align(
                child: Material(
                  elevation: 10,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: AnimatedContainer(
                    // curve: Cubic(0.4, 0.0, 0.2, 1.0),
                    curve: Curves.bounceOut,
                    duration: Duration(seconds: 1),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white),
                    height: dialogBoxHeight,
                    width: 280,
                    child: Align(
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "Time Up!",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  fontFamily: Fonts().fontRegular),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 30, left: 15, right: 15, bottom: 0),
                            child: Text(
                              "Oops,This session is timed out.Please go back to home page and come back again.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: Fonts().fontRegular,
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 54.1),
                            child: Container(
                              height: 0.9,
                              width: MediaQuery.of(context).size.width,
                              color: Colors.grey.shade300,
                            ),
                          ),
                          Material(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10)),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10))),
                              height: 51,
                              width: MediaQuery.of(context).size.width,
                              child: InkWell(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10)),
                                onTap: () {
                                  Navigator.of(context).pop();
                                  // closeDialogBox();
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(top: 14),
                                  child: new Text(
                                    "OK",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      alignment: Alignment.center,
                    ),
                  ),
                ),
                alignment: Alignment.center,
              ),
            ),
          ],
        ));
  }
}
