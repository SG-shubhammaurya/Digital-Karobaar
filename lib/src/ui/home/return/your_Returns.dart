import 'package:digitalkarobaar/src/core/utils/constants/language_keys.dart';
import 'package:digitalkarobaar/src/route/router_name.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:digitalkarobaar/src/core/utils/constants/common.dart';

class YourReturns extends StatefulWidget {
  @override
  _YourReturnsState createState() => _YourReturnsState();
}

class _YourReturnsState extends State<YourReturns> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            LanguageKeys.yourReturns.translate(context),
            style: TextStyle(color: Colors.white),
          ),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                tooltip: "Back",
              );
            },
          ),
        ),
        body: ListView(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Container(
                    height: 50,
                    width: 250,
                    color: Colors.white,
                    child: TextFormField(
                      decoration: InputDecoration(
                          icon: Icon(Icons.search),
                          hintText: 'Search your returns'),
                    ),
                  ),
                ),
                Text("|"),
                GestureDetector(
                    onTap: () {
                      showDefaultSnackBar(context);
                    },
                    child: Container(
                      child: Text(
                        "All Returns",
                      ),
                    ))
              ],
            ),
            Divider(height: 10.0),
            SizedBox(
              height: 50.0,
            ),
            Container(
              child: Center(
                child: Column(
                  children: <Widget>[
                    Text(
                      "No Result Found",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 12.0),
                    ),
                    Text("You don'y have anu Return Record"),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50.0, right: 50.0),
              child: Container(
                height: 50.0,
                width: 10.0,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RouterName.getUserreturn);
                    //Navigator.pushNamed(context, RouterName.yourOrder);
                  },
                  child: Text(
                    "Create Return",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.blue,
                ),
              ),
            )
          ],
        ));
  }

  void showDefaultSnackBar(BuildContext context) {
    Flushbar(
      isDismissible: true,
      titleText: Container(
        height: 50,
        width: (MediaQuery.of(context).size.width),
        child: Center(
            child: Text("Your All Return",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold))),
      ),
      backgroundColor: Colors.white,
      messageText: Column(children: <Widget>[
        Row(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, RouterName.allReturn);
              },
              child: Container(
                  child: Text(
                "all Return",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
            ),
          ],
        ),
        Divider(),
        Row(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, RouterName.pendingReturn);
              },
              child: Container(
                  child: Text(
                "Pending",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
            ),
          ],
        ),
        Divider(),
        Row(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, RouterName.approvedReturn);
              },
              child: Container(
                  child: Text(
                "Approved",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
            ),
          ],
        ),
        Divider(),
        Row(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, RouterName.rejectedReturn);
              },
              child: Container(
                  child: Text(
                "Rejected",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
            ),
          ],
        ),
        Divider(),
        Row(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, RouterName.cancelledReturn);
              },
              child: Container(
                  child: Text(
                "Cancelled",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
            ),
          ],
        ),
      ]),
      duration: Duration(seconds: 1000),
    )..show(context);
  }

  _allReturn(BuildContext context) async {
    return ListView(
      children: <Widget>[
        Container(
          child: Center(
            child: Column(
              children: <Widget>[
                Text("Sorry You Dont Have"),
                Text("any return record"),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
