import 'package:digitalkarobaar/src/core/utils/constants/common.dart';
import 'package:digitalkarobaar/src/core/widget/common_card.dart';
import 'package:digitalkarobaar/src/core/widget/no_data_available.dart';
import 'package:digitalkarobaar/src/models/seller_order_get.dart';
import 'package:digitalkarobaar/src/repository/dashboard_repository.dart';
import 'package:digitalkarobaar/src/res/app_colors.dart';
import 'package:digitalkarobaar/src/route/router_name.dart';
import 'package:flutter/material.dart';
class OrderPending extends StatefulWidget {
  @override
  _OrderPendingState createState() => _OrderPendingState();
}

class _OrderPendingState extends State<OrderPending> {
    bool isLoading = true;
  List<SellerAllOrderGet> sellerOrder = [];
   
   @override
  void initState() {
    _getSellerOrder();
    super.initState();
  }
  _getSellerOrder() async {
    var sellerAllOrderList = await DashRepository.getAllSellerOrderPending()
    .catchError((e){
      setState(() {
         isLoading = false;
      });
    });
    if(sellerAllOrderList != null){
      setState(() {
        sellerOrder = sellerAllOrderList;
          isLoading = false;
      });
    }
   
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
      sellerOrder.length == 0
                ? Center(child: NoDataAvailable(message: "No Pending Available"))
          :
        ListView.builder(
          itemCount: sellerOrder.length,
        itemBuilder: (BuildContext context, int index){
          return _buildOrder(

          sellerOrder[index].quantity,sellerOrder[index].when,sellerOrder[index].amount,
          sellerOrder[index].paid,sellerOrder[index].paidAmount,sellerOrder[index].method,
          sellerOrder[index].remaining,sellerOrder[index].status,sellerOrder[index].productId,
          sellerOrder[index].id,
          );
        }
        )
      
    );
  }

  _buildOrder(String quantity, String when, String amount, bool paid, String paidAmount,
  String method, String remaning,String status, String productId,int id ){
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