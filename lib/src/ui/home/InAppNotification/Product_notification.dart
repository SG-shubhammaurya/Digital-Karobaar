import 'package:digitalkarobaar/src/models/notification_in_app.dart';
import 'package:digitalkarobaar/src/repository/home_repository.dart';
import 'package:digitalkarobaar/src/res/app_colors.dart';
import 'package:digitalkarobaar/src/route/router_name.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class InApplicationNotification extends StatefulWidget {
  @override
  _InApplicationNotificationState createState() => _InApplicationNotificationState();
}

class _InApplicationNotificationState extends State<InApplicationNotification> {
  bool isLoading = true;

  //final scrollController = ScrollController(initialScrollOffset: 0);

  
 
  List<ProductNoti> notificationProduct = [];

  @override
  void initState() {
    _getProductNotification();
  
    super.initState();
  }


  _getProductNotification() async {
    var productNotifyList =
     await HomeReposiitory.getProductNotification();
     setState(() {
       if (productNotifyList != null){
         notificationProduct = productNotifyList;
         isLoading = false;
       }
     });
  }
  





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Notification"),
      // ),
      body: ListView(children: [
        isLoading
        ? Center(child: CircularProgressIndicator(),):

            ListView.builder(
              shrinkWrap: true,
              //controller: scrollController,
              itemCount: notificationProduct.length,
              itemBuilder: (BuildContext context, int index) {
                return _buildProductNotification(
                  notificationProduct[index].image,
                  notificationProduct[index].title,
                  notificationProduct[index].description,
                  notificationProduct[index].productId,
                );
              }
            ),
            SizedBox(height: 10),
           

        
      ],
     ),
    );
  }

  _buildProductNotification(
    String image,
    String title,
    String description,
    int productId,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RouterName.productDetails,
          arguments: productId,
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
              //color: Colors.blue,
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

  
_buildSellerNotification(
    String image,
    String title,
    String description,
    int productId,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RouterName.productDetails,
          arguments: productId,
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