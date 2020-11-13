// import 'dart:async';
// import 'package:digitalkarobaar/src/route/router_name.dart';
// import 'package:flutter/material.dart';

// class AppSplaceScreen extends StatefulWidget {
//   @override
//   _AppSplaceScreenState createState() => _AppSplaceScreenState();
// }

// class _AppSplaceScreenState extends State<AppSplaceScreen> {
//   @override
//   void initState() {
//     super.initState();

//     Timer(Duration(seconds: 2),
//         () => Navigator.pushReplacementNamed(context, RouterName.mainPage));
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Container(
//           child: Image.asset(
//             'assets/icons/launcher.png',
//             height: MediaQuery.of(context).size.height,
//             width: MediaQuery.of(context).size.width,
//             fit: BoxFit.cover,
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:async';
import 'package:digitalkarobaar/src/route/router_name.dart';
import 'package:flutter/material.dart';

class AppSplaceScreen extends StatefulWidget {
  @override
  _AppSplaceScreenState createState() => _AppSplaceScreenState();
}

class _AppSplaceScreenState extends State<AppSplaceScreen> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 2),
        () => Navigator.pushReplacementNamed(context, RouterName.mainPage));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Image.asset(
            'assets/icons/launcher.png',
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
