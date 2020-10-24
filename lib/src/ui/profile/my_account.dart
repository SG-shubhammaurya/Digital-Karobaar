import 'package:digitalkarobaar/src/models/home_image.dart';
import 'package:digitalkarobaar/src/repository/home_repository.dart';
import 'package:digitalkarobaar/src/route/router_name.dart';
import 'package:flutter/material.dart';

// class MyAccount extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text(
//             'My Account',
//           ),
//         ),
//         body: ListView(
//           children:[
//             Padding(
//               padding: const EdgeInsets.only(top: 20.0,left: 10.0,right: 10.0),
//               child: Column(children:[
//                     Divider(),
//                     GestureDetector(
//                       onTap: (){
//                         Navigator.pushNamed(context, RouterName.sellerAccount);
//                       },
//                     child: Row(
//                       children: [
//                         CircleAvatar(
//                           radius: 20.0,
//                           backgroundImage: NetworkImage(
//                             "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT9z07tFEFngQrJ5Irkd6lZbqVRfkpcPJ5cfw&usqp=CAU",
//                           ),
//                           backgroundColor: Colors.transparent,
//                         ),
//                         SizedBox(width: 20),
//                         Text("Your Profile",style: TextStyle(fontSize:15),)
//                       ]
//                     )
//                 ),
//                 Divider(color: Colors.black12),
//                     GestureDetector(
//                       onTap: (){
//                          Navigator.pushNamed(context, RouterName.sellerDetails,arguments: true);
//                        // Navigator.pushNamed(context, RouterName.sellerSetting);
//                       },
//                     child: Row(
//                       children: [
//                         CircleAvatar(
//                           radius: 20.0,
//                           backgroundImage: NetworkImage(
//                             "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT9z07tFEFngQrJ5Irkd6lZbqVRfkpcPJ5cfw&usqp=CAU",
//                           ),
//                           backgroundColor: Colors.transparent,
//                         ),
//                         SizedBox(width: 20),
//                         Text("Account Settings",style: TextStyle(fontSize: 15),)
//                       ]
//                     )
//                 ),
//                 Divider(color: Colors.black12),
//                     GestureDetector(
//                       onTap: (){
//                         Navigator.pushNamed(context, RouterName.businessProfile);
//                       },
//                     child: Row(
//                       children: [
//                         CircleAvatar(
//                           radius: 20.0,
//                           backgroundImage: NetworkImage(
//                             "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT9z07tFEFngQrJ5Irkd6lZbqVRfkpcPJ5cfw&usqp=CAU",
//                           ),
//                           backgroundColor: Colors.transparent,
//                         ),
//                         SizedBox(width: 20),
//                         Text("Business Profile",style: TextStyle(fontSize: 15),)
//                       ]
//                     )
//                 ),
//                  Divider(color: Colors.black12),
//                     GestureDetector(
//                       onTap: (){
//                        Navigator.pushNamed(context, RouterName.businessProfileSetting);
//                       },
//                     child: Row(
//                       children: [
//                         CircleAvatar(
//                           radius: 20.0,
//                           backgroundImage: NetworkImage(
//                             "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT9z07tFEFngQrJ5Irkd6lZbqVRfkpcPJ5cfw&usqp=CAU",
//                           ),
//                           backgroundColor: Colors.transparent,
//                         ),
//                         SizedBox(width: 20),
//                         Text("Seller Settings",style: TextStyle(fontSize: 15),)
//                       ]
//                     )
//                 ),
//                  Divider(color: Colors.black12),
//               ],),
//             )
//           ]
//         ),
//         );
//   }
// }
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
            'Account',
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
                          // backgroundImage: NetworkImage(
                          //   "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT9z07tFEFngQrJ5Irkd6lZbqVRfkpcPJ5cfw&usqp=CAU",
                          // ),
                          backgroundColor: Colors.transparent,
                        ),
                        SizedBox(width: 20),
                        Text("Your Profile",style: TextStyle(fontSize: 20),)

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
                              
                              Image.network(images[index].analyticsIcon,fit: BoxFit.cover,);
                            }
                            ),
                          backgroundColor: Colors.transparent,
                        ),
                        SizedBox(width: 20),
                        Text("Account Settings",style: TextStyle(fontSize: 20),)

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
                        Text("Business Profile",style: TextStyle(fontSize: 20),)
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
                              
                              Image.network(images[index].autoPartIcon,fit: BoxFit.cover,);
                            }
                            ),
                          backgroundColor: Colors.transparent,
                        ),
                        SizedBox(width: 20),
                        Text("Seller Settings",style: TextStyle(fontSize: 20),)

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