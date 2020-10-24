import 'package:digitalkarobaar/src/core/widget/common_button.dart';
import 'package:digitalkarobaar/src/models/seller_profile.dart';
import 'package:digitalkarobaar/src/repository/sell_respository.dart';
import 'package:digitalkarobaar/src/res/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
class Admin extends StatefulWidget {
  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  Seller sellerProfile;
  bool isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    _getSeller();
    super.initState();
  }
  _getSeller() async {
    var sellerProfile = await SellRepository.getSellerProfileInfo();
    if (sellerProfile != null){
      setState(() {
        isLoading = false;
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: ListView(
        children: [
         Padding(
           padding: const EdgeInsets.only(left:10.0,top: 20.0),
           child: Column(children: [
             Row(
               children: [
                 Text("Add Member to make a team and ",style: TextStyle(fontSize: 20),),
               ],
             ),
            SizedBox(height: 10.0),
             Row(
               children: [
                 Text("and boost.Your business growth ",style: TextStyle(fontSize: 20),),
                 SizedBox(height: 10.0),
                 
               ],
             ),
             SizedBox(height: 10.0),
             Row(
               children: [
                 Text("in Digital Karobaar platform ",style: TextStyle(fontSize: 20),),
                 SizedBox(height: 10.0),
                 
               ],
             ),
             SizedBox(height: 30.0),
             
           ],
            ),
         ),
         Padding(
           padding: const EdgeInsets.only(left: 10.0, right: 10.0),
           child: Center(
             child: Text("Digital Karobaar is allow you to add the Seller as a member and make your own team for better growth of your business")
             
           ),
         ),
         //SizedBox(height: 15.0),

         Container(
                height: 400,
                width: 400,
                //color: Colors.blue
                child: Image.asset("assets/icons/invite.png",fit: BoxFit.fill,),
              ),




         SizedBox(height: 15.0),







         GestureDetector(
           onTap: ()async {
             int p = await shareNumber(sellerProfile.phoneNo


              //  ListView.builder(
              //    itemCount: sellerProfile.seller.length,
              //    itemBuilder: (c, index){
              //      return Text()

              //    }
              //    )




             );
                              share(context, sellerProfile.phoneNo.toString());
                                 
                            },
          






           
           child: Padding(
             padding: const EdgeInsets.only(left: 20.0,right: 20.0),
             child: Container(
               decoration: BoxDecoration(
                 color: AppColors.primaryColor,
                 borderRadius: BorderRadius.circular(30)
               ),
               height: 50,
               width: 10.0,
               child: Center(child: Text("Add Members",style: TextStyle(fontSize: 20),)),
               
             ),
           ),
         ),
        SizedBox(height: 50),

         

        ],
      ),
      
    );
  }

  void share(BuildContext context, t) {
    Share.share(t);
  }

  shareNumber(context) async {
    // return Column(children: [
    //   Text(sellerProfile.seller[index].phoneNo)

    // ],);
    
    return "join my tean in Digital Karobaar to speed up your Business..9935020063".toString();
    //Text('9935020063').toString();
    // Container(
    //   child: Text("9935020063".toString())
    // );
  }
  
}