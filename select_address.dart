import 'package:buypage/main.dart';
import 'package:flutter/material.dart';
import 'add_address.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:toast/toast.dart';
import 'fonts.dart';

class SelectAddress extends StatefulWidget {
  @override
  _SelectAddressState createState() => _SelectAddressState();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: SelectAddress(),
    );
  }
}

var selectedAddress = "Oops! , No address added";
var addressText;

List<String> entries = [];
final TextEditingController billingNameCntrl = new TextEditingController();
final TextEditingController doorNumberCntrl = new TextEditingController();
final TextEditingController pinCodeCntrl = new TextEditingController();
final TextEditingController addressLine1Cntrl = new TextEditingController();
final TextEditingController addressLine2Cntrl = new TextEditingController();
final TextEditingController cityCntrl = new TextEditingController();
final TextEditingController stateCntrl = new TextEditingController();
final TextEditingController countryCntrl = new TextEditingController();

final List<int> colorCodes = <int>[
  200,
  100,
  200,
  100,
  200,
  100,
];

void adressDynamicButton() {
  if (selectedAddress == "Oops! , No address added") {
    addressText = "Add Address";
  } else {
    addressText = "Change Address";
  }
}

class _SelectAddressState extends State<SelectAddress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.2,
        title: Text(
          "Select Address",
          style:
              TextStyle(fontFamily: Fonts().fontRegular, color: Colors.black),
        ),
        centerTitle: true,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
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
        actions: <Widget>[
          InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddAddress()),
                );
              },
              child: Material(
                color: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Icon(
                    Icons.add,
                    color: Colors.black,
                  ),
                ),
              )),
        ],
      ),
      body: Container(
        child: Scrollbar(
          child: ListView.separated(
            padding: const EdgeInsets.all(8),
            itemCount: entries.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Material(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: Colors.grey.shade50,
                  elevation: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      // color: Colors.grey[colorCodes[index]],
                      // border: Border.all(width: 1, color: Colors.grey.shade300),
                      color: Colors.transparent,
                    ),
                    // height: 130,
                    child: InkWell(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      onTap: () {
                        print("The addrss is = $index");
                        selectedAddress = entries[index];
                        //  if (adressCount < 1) {
                        //       Navigator.pop(context);
                        //     } else {
                        //       Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //             builder: (context) => MyHomePage()),
                        //       );
                        //     }
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyHomePage()),
                        );
                        Toast.show("Address $index is selected", context,
                            duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
                        // Fluttertoast.showToast(
                        //     msg: "Address $index is selected",
                        //     toastLength: Toast.LENGTH_SHORT,
                        //     gravity: ToastGravity.BOTTOM,
                        //     timeInSecForIos: 1,
                        //     backgroundColor: Colors.black87,
                        //     textColor: Colors.white,
                        //     fontSize: 16.0);
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 12, top: 12, bottom: 12),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.785,
                              // color: Colors.yellow,
                              child: Text(
                                'Address $index\n\n' + '${entries[index]}',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontFamily: Fonts().fontRegular,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 0, top: 0, right: 0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                // color: Colors.blueAccent,
                              ),
                              child: InkWell(
                                onTap: () {
                                  print("hello this is EDIT button");
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Tooltip(
                                    message: "Edit",
                                    textStyle: TextStyle(
                                        fontFamily: Fonts().fontRegular,
                                        color: Colors.white),
                                    child: Icon(
                                      Icons.edit,
                                      color: Colors.grey.shade700,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
          ),
        ),
      ),
    );
  }
}
