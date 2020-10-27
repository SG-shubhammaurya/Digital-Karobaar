import 'package:digitalkarobaar/src/models/notification_in_app.dart';
import 'package:digitalkarobaar/src/repository/home_repository.dart';
import 'package:digitalkarobaar/src/res/app_colors.dart';
import 'package:digitalkarobaar/src/route/router_name.dart';
import 'package:flutter/material.dart';

class SellerNotification extends StatefulWidget {
  @override
  _SellerNotificationState createState() => _SellerNotificationState();
}

class _SellerNotificationState extends State<SellerNotification> {
  bool isLoading = true;
   List<SellerNoti> notificationSeller = [];


   @override
  void initState() {
    //_getProductNotification();
    _getSellerNotification();
    super.initState();
  }

   _getSellerNotification() async {
    var sellerNotifyList =
     await HomeReposiitory.getSellerNotification();
     setState(() {
       if (sellerNotifyList != null){
         notificationSeller = sellerNotifyList;
         isLoading = false;
       }
     });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: ListView(children: [
        isLoading
        ? Center(child: CircularProgressIndicator(),):

           
            SizedBox(height: 10),
             ListView.builder(
               shrinkWrap: true,
              itemCount: notificationSeller.length,
              itemBuilder: (BuildContext context, int index) {
                return _buildSellerNotification(
                  notificationSeller[index].sellerId,
                  notificationSeller[index].title,
                  notificationSeller[index].image,
                  notificationSeller[index].description,
                );
              }
            ),


        
      ],
     ),
    );
  }

  _buildSellerNotification(
    int sellerId,
    String title,
    String image,
    String description,

    
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RouterName.sellerShop,
          arguments: sellerId,
        );
      },
      
      child: 
      Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1,color: AppColors.primaryColor ),
          color: Colors.black12,
        ),
        child: Column(
          children: [
          SizedBox(height: 10),
          Row(
            children: [
              SizedBox(width: 10),
              Text(title),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left:10.0, right:10.0,top: 10.0),
            child: Center(
              child: Text(description)
            ),
          ),
          SizedBox(height: 5.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Colors.blue,
              height: 150,
              width: MediaQuery.of(context).size.width,
              child: Image.network(image, fit: BoxFit.fill),
            ),
          ),
          



        ],)
      ),
    )
    );
  }




}