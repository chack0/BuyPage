import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'select_address.dart';
import 'fonts.dart';

class AddAddress extends StatefulWidget {
  @override
  _AddAddressState createState() => _AddAddressState();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: AddAddress(),
    );
  }
}

class _AddAddressState extends State<AddAddress> {
  final _formKey = GlobalKey<FormState>();
  var adressCount = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.2,
        title: Text(
          "Add Address",
          style:
              TextStyle(fontFamily: Fonts().fontRegular, color: Colors.black),
        ),
        centerTitle: true,
        leading: InkWell(
            onTap: () {
              if (addressText == "Oops! , No address added") {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SelectAddress()),
                );
              } else {
                Navigator.pop(context);
              }
            },
            child: Material(
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
            )),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 30, right: 30, bottom: 10, top: 10),
                      child: TextFormField(
                        style: TextStyle(
                            fontFamily: Fonts().fontRegular, fontSize: 12),

                        decoration: InputDecoration(
                            labelText: "Billing Name",
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1, style: BorderStyle.solid))),
                        // TextField(
                        controller: billingNameCntrl,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter your billing name';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 30, right: 30, bottom: 10, top: 10),
                      child: TextFormField(
                        style: TextStyle(
                            fontFamily: Fonts().fontRegular, fontSize: 12),
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: false),
                        decoration: InputDecoration(
                          labelText: "Door No.",
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, style: BorderStyle.solid),
                          ),
                        ),
                        // TextField(
                        controller: doorNumberCntrl,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter your door no.';
                          }

                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 30, right: 30, bottom: 10, top: 10),
                      child: TextFormField(
                        style: TextStyle(
                            fontFamily: Fonts().fontRegular, fontSize: 12),
                        maxLength: 6,
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: false),
                        decoration: InputDecoration(
                            labelText: "Pincode",
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1, style: BorderStyle.solid))),
                        // TextField(
                        controller: pinCodeCntrl,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter your pincode';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 30, right: 30, bottom: 10, top: 10),
                      child: TextFormField(
                        style: TextStyle(
                            fontFamily: Fonts().fontRegular, fontSize: 12),

                        decoration: InputDecoration(
                            labelText: "Address Line 1",
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1, style: BorderStyle.solid))),
                        // TextField(
                        controller: addressLine1Cntrl,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter your address';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 30, right: 30, bottom: 10, top: 10),
                      child: TextFormField(
                        style: TextStyle(
                            fontFamily: Fonts().fontRegular, fontSize: 12),
                        decoration: InputDecoration(
                            labelText: "Address Line 2 (Optional)",
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1, style: BorderStyle.solid))),
                        // TextField(
                        controller: addressLine2Cntrl,
                        // validator: (value) {
                        //   if (value.isEmpty) {
                        //     return 'Please enter some text';
                        //   }
                        //   return null;
                        // },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 30, right: 30, bottom: 10, top: 10),
                      child: TextFormField(
                        style: TextStyle(
                            fontFamily: Fonts().fontRegular, fontSize: 12),
                        decoration: InputDecoration(
                            labelText: "City",
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1, style: BorderStyle.solid))),
                        // TextField(
                        controller: cityCntrl,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter your city';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 30, right: 30, bottom: 10, top: 10),
                      child: TextFormField(
                        style: TextStyle(
                            fontFamily: Fonts().fontRegular, fontSize: 12),
                        decoration: InputDecoration(
                            labelText: "State",
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1, style: BorderStyle.solid))),
                        // TextField(
                        controller: stateCntrl,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter your sate';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 30, right: 30, bottom: 10, top: 10),
                      child: TextFormField(
                        style: TextStyle(
                            fontFamily: Fonts().fontRegular, fontSize: 12),
                        decoration: InputDecoration(
                            labelText: "Country",
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1, style: BorderStyle.solid))),
                        // TextField(
                        controller: countryCntrl,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter your country';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width * 0.18,
                  ),
                  child: Material(
                    color: Colors.lightBlue,
                    child: Container(
                      color: Colors.transparent,
                      height: 55,
                      width: MediaQuery.of(context).size.width,
                      child: InkWell(
                        onTap: () {
                          // Validate returns true if the form is valid, or false
                          // otherwise.
                          if (_formKey.currentState.validate()) {
                            entries.add(billingNameCntrl.text +
                                ", Door No : " +
                                doorNumberCntrl.text +
                                " , " +
                                pinCodeCntrl.text +
                                " , " +
                                addressLine1Cntrl.text +
                                " , " +
                                addressLine2Cntrl.text +
                                " , " +
                                cityCntrl.text +
                                " , " +
                                stateCntrl.text +
                                "." +
                                countryCntrl.text);
                            billingNameCntrl.clear();
                            doorNumberCntrl.clear();
                            pinCodeCntrl.clear();
                            addressLine1Cntrl.clear();
                            addressLine2Cntrl.clear();
                            cityCntrl.clear();
                            stateCntrl.clear();
                            countryCntrl.clear();

                            setState(() {});

                          
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SelectAddress()),
                              );
                            
                            adressCount++;
                           Toast.show("Address saved.", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Text(
                            "SAVE",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: Fonts().fontRegular,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                letterSpacing: 0.5),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // RaisedButton(
                //   onPressed: () {
                //     // Validate returns true if the form is valid, or false
                //     // otherwise.
                //     if (_formKey.currentState.validate()) {
                //       entries.add(billingNameCntrl.text);
                //       billingNameCntrl.clear();
                //       setState(() {});
                //       Navigator.pop(context);

                //       // // If the form is valid, display a Snackbar.
                //       // Scaffold.of(context).showSnackBar(
                //       //     SnackBar(content: Text('Processing Data')));
                //     }
                //   },
                //   child: Text('Submit'),
                // ),
              ],
            ),
          ),
        ),
      ),

      // TextField(
      //   controller: billingNameCntrl,
      //   onSubmitted: (text) {
      //     entries.add(text);
      //     billingNameCntrl.clear();
      //     setState(() {});
      //   },
      // ),
    );
  }
}
