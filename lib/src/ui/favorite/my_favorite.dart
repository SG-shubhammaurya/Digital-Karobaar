import 'package:digitalkarobaar/src/models/products.dart';
import 'package:digitalkarobaar/src/models/user_profile.dart';
import 'package:digitalkarobaar/src/repository/home_repository.dart';
import 'package:digitalkarobaar/src/repository/product_repository.dart';
import 'package:digitalkarobaar/src/route/router_name.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyFavorite extends StatefulWidget {
  @override
  _MyFavoriteState createState() => _MyFavoriteState();
}

class _MyFavoriteState extends State<MyFavorite> {
  @override
  void initState() {
    _getUserProfile();
    super.initState();
  }

  var userId;
  UserProfile userProfile;
  bool isLoading= true;
  _getUserProfile() async {
    await HomeReposiitory.getProfileInfo().then((userProfile) {
      if (userProfile != null) {
        //userProfile = profile;
        _getFavorite(userProfile.id);
      }
    });
  }
  List<Products> products = [];

  _getFavorite(int userId) async {
   await ProductRepository.getFavorite(userId).then((value) {

     if(value != null){
        products = value;
        setState(() {
          isLoading = false;
        });
     }
   }).catchError((e){
     setState(() {
       products.length=0;
          isLoading = false;
        });
   });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: const Text('My Favorite'),
      ),
      body: isLoading ? Center(
        child: CircularProgressIndicator(
         
        )

      ): _buildFavoriteList()
    );
  }

  _buildFavoriteList(){
    if(products.length==0){
     return Center(
      child: Text('No Favorite items',style: GoogleFonts.openSans(
        fontWeight: FontWeight.bold
      ),),
     );
    }else{
      return ListView.separated(
        
        itemBuilder:(context,index){
          return InkWell(
             onTap: (){
                 Navigator.pushNamed(context, RouterName.productDetails,arguments: products[index].id);
             },
            child: ListTile(
              leading: Image.network(products[index].image1),
              title: Text(products[index].title),
              subtitle: Text("Price : "+products[index].prize.toString()),
            ),
          );
        }, 
        separatorBuilder: (_,index)=>Divider(), 
        itemCount:products.length);
    }
  }
}
