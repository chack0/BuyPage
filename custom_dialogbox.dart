import 'package:buypage/fonts.dart';
import 'package:flutter/material.dart';

class CustomDialogBox extends StatefulWidget {
  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  double _animSearchHeight = 0.0;

  @override
  void openSearch() {
    // _homeBloc.updateIsSearchEnabled(true);

    setState(() {
      _animSearchHeight = 240;
    });
  }

  void closeSearch() {
    setState(() {
      _animSearchHeight = 0.0;
    });
  }

  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton.extended(
          elevation: 6,
          backgroundColor: Colors.blueAccent,
          onPressed: () {
            openSearch();
          },
          icon: Icon(Icons.account_balance_wallet),
          label: Text(
            "Pay Now",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          )),
      body: Align(
        child: Material(
          elevation: 10,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: AnimatedContainer(
            // curve: Cubic(0.4, 0.0, 0.2, 1.0),
            curve: Curves.easeInCubic,
            duration: Duration(seconds: 1),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.white),
            height: _animSearchHeight,
            width: 280,
            child: Align(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "Pay Ammount",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontFamily: 'GoogleSans-Regular'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 20, left: 15, right: 15, bottom: 20),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Enter Ammount"),
                      keyboardAppearance: Brightness.dark,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Container(
                      height: 0.8,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.grey.shade300,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      InkWell(
                          onTap: () {
                            // Navigator.of(context).pop();
                            closeSearch();
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 0, right: 10, top: 0, bottom: 0),
                            child: new Text(
                              "Cancel",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            ),
                          )),
                      Container(
                        height: 45,
                        width: 0.8,
                        color: Colors.grey.shade300,
                      ),
                      InkWell(
                          onTap: () {
                            closeSearch();
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 15, right: 10, top: 0, bottom: 0),
                            child: new Text(
                              "Pay",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            ),
                          )),
                    ],
                  ),
                ],
              ),
              alignment: Alignment.center,
            ),
          ),
        ),
        alignment: Alignment.center,
      ),
    );
  }
}
