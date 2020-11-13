// import 'package:digitalkarobaar/src/bloc/cart/cart_cubit.dart';
// import 'package:digitalkarobaar/src/bloc/cart/cart_state.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class CommonIconButton extends StatelessWidget {
//   final color;
//   final Function onPressed;
//   CommonIconButton({Key key, this.onPressed, this.color}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Container(
//           margin: EdgeInsets.all(6),
//           decoration: BoxDecoration(
//               color: color ?? Colors.grey[200], shape: BoxShape.circle),
//           child: IconButton(
//             icon: Icon(
//               Icons.shopping_cart,
//               color: Colors.black54,
//               size: 20,
//             ),
//             onPressed: onPressed,
//           ),
//         ),
//         Positioned(
//           right: 5,
//           child: BlocConsumer<CartCubit, CartState>(
//               builder: (_, s) {
//                 if (s is CartItems) {
//                   return Visibility(
//                       visible: s.items.data.length > 0,
//                       child: Container(
//                           height: 12,
//                           width: 12,
//                           margin: EdgeInsets.all(10),
//                           decoration: BoxDecoration(
//                               color: Colors.red, shape: BoxShape.circle),
//                           child: Center(
//                               child: Text(
//                             '${s.items.data.length}',
//                             style: TextStyle(color: Colors.white, fontSize: 8),
//                           ))));
//                 }
//                 return Container(
//                           height: 12,
//                           width: 12,
//                           margin: EdgeInsets.all(10),
//                           decoration: BoxDecoration(
//                               color: Colors.red, shape: BoxShape.circle),
//                           child: Center(
//                               child: Text(
//                             '0',
//                             style: TextStyle(color: Colors.white, fontSize: 8),
//                           )));
//               },
//               listener: (_, s) {}),
//         )
//       ],
//     );
//   }
// }


import 'package:digitalkarobaar/src/bloc/cart/cart_cubit.dart';
import 'package:digitalkarobaar/src/bloc/cart/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommonIconButton extends StatelessWidget {
  final color;
  final Function onPressed;
  CommonIconButton({Key key, this.onPressed, this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.all(6),
          decoration: BoxDecoration(
              color: color ?? Colors.grey[200], shape: BoxShape.circle),
          child: IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.black54,
              size: 20,
            ),
            onPressed: onPressed,
          ),
        ),
        Positioned(
          right: 5,
          child: BlocConsumer<CartCubit, CartState>(
              builder: (_, s) {
                 
                if (s is CartItems) {
                 
                  return Visibility(
                      visible: s.items.data.length > 0,
                      child: Container(
                          height: 12,
                          width: 12,
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.red, shape: BoxShape.circle),
                          child: Center(
                              child: Text(
                            '${s.items.data.length}',
                            style: TextStyle(color: Colors.white, fontSize: 8),
                          ))));
                }
                return   s is LoadingCart ?
                           Center(child: 
                   SizedBox(
                     height: 12,
                     width: 12,
                      
                      child: CircularProgressIndicator())): Container(
                          height: 12,
                          width: 12,
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.red, shape: BoxShape.circle),
                          child: 
                        
                           Center(
                              child: Text(
                            '0',
                            style: TextStyle(color: Colors.white, fontSize: 8),
                          )));
              },
              listener: (_, s) {}),
        )
      ],
    );
  }
}
