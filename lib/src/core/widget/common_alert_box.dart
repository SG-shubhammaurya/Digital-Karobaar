// import 'package:flutter/material.dart';

// commonAlertBox(BuildContext context, {Function(bool fromCamera) onPressed}) {
//   return showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: Text('Choose Action'),
//         content: ListView(
//           shrinkWrap: true,
//           children: [
//             InkWell(
//               onTap: ()=>onPressed(false),
//               child: Text("Gallery",
//                   style: TextStyle(fontSize: 15)),
//             ),
//             SizedBox(height: 10),
//             InkWell(
//                 onTap: ()=>onPressed(true),
//                 child: Text("Camera",
//                     style: TextStyle(fontSize: 15)))
//           ],
//         ),
//         actions: [
    

//           FlatButton(
//             child: Text("Cancel"),
//             onPressed: () {
//               Navigator.pop(context);
//             },
//           )
//         ],
//       );
//     },
//   );
// }

import 'package:flutter/material.dart';

commonAlertBox(BuildContext context, {Function(bool fromCamera) onPressed}) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Choose Action'),
        content: ListView(
          shrinkWrap: true,
          children: [
            InkWell(
              onTap: ()=>onPressed(false),
              child: Text("Gallery",
                  style: TextStyle(fontSize: 15)),
            ),
            SizedBox(height: 10),
            InkWell(
                onTap: ()=>onPressed(true),
                child: Text("Camera",
                    style: TextStyle(fontSize: 15)))
          ],
        ),
        actions: [
    

          FlatButton(
            child: Text("Cancel"),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      );
    },
  );
}
