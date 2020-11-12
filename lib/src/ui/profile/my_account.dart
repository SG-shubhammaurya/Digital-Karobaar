

import 'package:digitalkarobaar/src/core/utils/constants/language_keys.dart';
import 'package:digitalkarobaar/src/models/home_image.dart';
import 'package:digitalkarobaar/src/repository/home_repository.dart';
import 'package:digitalkarobaar/src/route/router_name.dart';
import 'package:flutter/material.dart';
import 'package:digitalkarobaar/src/core/utils/constants/common.dart';

class MyAccount extends StatefulWidget {
  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  bool isLoading = true;

    List<HomeImages> images;
    @override
  void initState() {
   
    _getImages();
    super.initState();
  }




  _getImages()async{
    var imagesList = await HomeReposiitory.getImages();
    setState(() {
      images = imagesList;
      print(images[0]);
      if(images != null){
        isLoading = false;
      }

    });

  }



  @override
  Widget build(BuildContext context) {
  return Scaffold(
        appBar: AppBar(
          title: Text(
            LanguageKeys.account.translate(context),
          ),
        ),
        
        body: isLoading
        ? Center(child: CircularProgressIndicator(),):
        
        
        
        ListView(
          children:[
            Padding(
              padding: const EdgeInsets.only(top: 20.0,left: 10.0,right: 10.0),
              child: Column(children:[
                    Divider(),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, RouterName.sellerAccount);
                      },
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 30.0,
                           child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: images.length,
                            itemBuilder: (c, index){
                              return 
                              
                              Image.network(images[index].userProfileIcon,fit: BoxFit.cover,);
                            }
                            ),
                         
                          backgroundColor: Colors.transparent,
                        ),
                        SizedBox(width: 20),
                        Text(
                          LanguageKeys.yourProfile.translate(context),
                          style: TextStyle(fontSize: 20),)

                      ]
                    )
                ),
                Divider(),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, RouterName.sellerSetting);
                      },
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 30.0,
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: images.length,
                            itemBuilder: (c, index){
                              return 
                              
                              Image.network(images[index].accountSetting,fit: BoxFit.cover,);
                            }
                            ),
                          backgroundColor: Colors.transparent,
                        ),
                        SizedBox(width: 20),
                        Text( LanguageKeys.accountSetting.translate(context),style: TextStyle(fontSize: 20),)

                      ]
                    )
                ),
                Divider(),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, RouterName.businessProfile);
                      },
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 30.0,
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: images.length,
                            itemBuilder: (c, index){
                              return 
                              
                              Image.network(images[index].businessProfileIcon,fit: BoxFit.cover,);
                            }
                            ),
                          backgroundColor: Colors.transparent,
                        ),
                        SizedBox(width: 20),
                        Text( LanguageKeys.businessProfile.translate(context),style: TextStyle(fontSize: 20),)
                      ]
                    )
                ),
                Divider(),
                    GestureDetector(
                      onTap: (){
                       Navigator.pushNamed(context, RouterName.businessProfileSetting);
                      },
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 30.0,
                         child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: images.length,
                            itemBuilder: (c, index){
                              return 
                              
                              Image.network(images[index].businessSetting ,fit: BoxFit.cover,);
                            }
                            ),
                          backgroundColor: Colors.transparent,
                        ),
                        SizedBox(width: 20),
                        Text( LanguageKeys.sellerSetting.translate(context),style: TextStyle(fontSize: 20),)

                      ]
                    )
                ),
                Divider(),

                  
                
                
              ],),
            )
          ]
        ),
        );
  }
}