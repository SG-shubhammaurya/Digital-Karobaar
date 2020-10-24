import 'package:digitalkarobaar/src/core/utils/constants/common.dart';
import 'package:digitalkarobaar/src/core/widget/common_card.dart';
import 'package:digitalkarobaar/src/core/widget/no_data_available.dart';
import 'package:digitalkarobaar/src/models/get_userOrder.dart';
import 'package:digitalkarobaar/src/repository/home_repository.dart';
import 'package:digitalkarobaar/src/res/app_colors.dart';
import 'package:digitalkarobaar/src/route/router_name.dart';
import 'package:flutter/material.dart';
class Shipped extends StatefulWidget {
  @override
  _ShippedState createState() => _ShippedState();
}
class _ShippedState extends State<Shipped> {
   bool isLoading = true;
  List<UserOrderGet> userOrder =[];
  @override
  void initState() {
    _getUserOrder();
    super.initState();
  }
  _getUserOrder() async {
    var userOrderList = await HomeReposiitory.getUserShipedOrder().catchError((e){
      setState(() {
          isLoading = false;
        
      });
    });
    setState(() {
    
    
      if(userOrderList != null){
          userOrder = userOrderList;
        isLoading = false;
      }
    });
  } 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
      ? Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
          )
      ):
      userOrder.length == 0
                ? Center(child: NoDataAvailable(message: "No Shiped Available"))
                : ListView.builder(
        itemCount: userOrder.length,
        itemBuilder: (BuildContext context, int index){
          return _buildOrder(
            userOrder[index].id,
            userOrder[index].quantity,userOrder[index].when,userOrder[index].amount,
          userOrder[index].paidAmount,userOrder[index].method,
          userOrder[index].remaining,userOrder[index].status,userOrder[index].productId,
          );
        }
        )
    );
  }
  _buildOrder( int id,String quantity, String when, String amount,String paidAmount,
               String method, String remaning, String status,String productId,) {
    return  Column(
      children: [
        GestureDetector(
          onTap: (){
             Navigator.pushNamed(context, RouterName.productDetails,
                arguments: id);
          },
        child: CommonCard(
                  child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text("Order",style: TextStyle(fontWeight: FontWeight.bold,),),
                    SizedBox(width: 10),
                      Text(createDateFormate(when).toString()),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  children: [
                    Text("ID",style: TextStyle(fontWeight: FontWeight.bold,),),
                    SizedBox(width: 10),
                    Text(id.toString()),
                    SizedBox(width: 30),
                    Text("Product ID",style: TextStyle(fontWeight: FontWeight.bold),),
                    SizedBox(width: 10),
                    Text(productId),
                  ],
                ),
                SizedBox(height:10),
                Row(
                  children: [
                  Text("Quantity",style: TextStyle(fontWeight: FontWeight.bold,)
                  ),
                    SizedBox(width: 20),
                    Text(quantity),
                  ],
                ),
                SizedBox(height:10),
                Row(
                  children: [
                    Text("Amount",style: TextStyle(fontWeight: FontWeight.bold,),),
                    SizedBox(width: 10),
                    Text('₹ ${amount}' ?? ""),
                    SizedBox(width: 30),
                    Text("Paid amount",style: TextStyle(fontWeight: FontWeight.bold),),
                    SizedBox(width: 10),
                    Text('₹ ${paidAmount}' ?? ""),
                  ],
                ),
                SizedBox(height:20),
                Row(
                  children: [
                    Text("Method",style: TextStyle(fontWeight: FontWeight.bold,),),
                    SizedBox(width: 10),
                    Text(method),
                    SizedBox(width: 30),
                    Text("Remaning",style: TextStyle(fontWeight: FontWeight.bold),),
                    SizedBox(width: 10),
                    Text('₹ ${remaning}' ?? ""),
                  ],
                ),
                SizedBox(height:10),
               Row(children: [
                 Text("Status",style: TextStyle(fontWeight: FontWeight.bold,),),
                 SizedBox(width: 10.0),
                 Text(status),
               ],)
              ]
            ),
          ),
        ),
        ),
      ] 
    );
  }
}