// import 'package:digitalkarobaar/src/route/router_name.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class SellerDashBoard extends StatelessWidget {
//   var choices = ['logout Dashboard'];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("Seller Dashboard"),
//           actions: [
//             PopupMenuButton<String>(
//               elevation: 0.0,
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10)),
//               onSelected: (v) {
//                 _logout(v);
//               },
//               itemBuilder: (BuildContext context) {
//                 return choices.map((String choice) {
//                   return PopupMenuItem<String>(
//                     value: choice,
//                     child: Text(
//                       choice,
//                       style: GoogleFonts.poppins(fontSize: 12),
//                     ),
//                   );
//                 }).toList();
//               },
//             )
//           ],
//         ),
//         body: Center(
//           child: Card(
//             margin: EdgeInsets.all(10),
//             shadowColor: Colors.black12,
//             shape: RoundedRectangleBorder(
//                 side: BorderSide(color: Colors.black12),
//                 borderRadius: BorderRadius.circular(10)),
//             child: GridView.count(
//                 primary: false,
//                 padding: const EdgeInsets.all(20),
//                 crossAxisSpacing: 12,
//                 mainAxisSpacing: 12,
//                 crossAxisCount: 3,
//                 shrinkWrap: true,
//                 children: [
//                   _buildCategories('Orders', Icons.record_voice_over,
//                       onAction: () {
//                     Navigator.pushNamed(context, RouterName.sellerOrder);
//                   }),
//                   _buildCategories('Account', Icons.person_pin, onAction: () {
//                     Navigator.pushNamed(context, RouterName.myAccount);
//                   }),
//                   _buildCategories('Returns', Icons.texture, onAction: () {
//                     Navigator.pushNamed(context, RouterName.sellerReturn);
//                   }),
//                   _buildCategories('Brand', Icons.record_voice_over,
//                       onAction: () {
//                     Navigator.pushNamed(context, RouterName.yourBrands);
//                   }),
//                   _buildCategories('Story', Icons.inbox, onAction: () {
//                     Navigator.pushNamed(context, RouterName.poststoty);
//                   }),
//                   _buildCategories('Products', Icons.pie_chart_outlined,
//                       onAction: () {
//                     Navigator.pushNamed(context, RouterName.productUpload);
//                   }),
//                   _buildCategories('Vypaar', Icons.business_center,
//                       onAction: () {
//                     Navigator.pushNamed(context, RouterName.vypaarSuraksha);
//                   }),
//                   _buildCategories('Team', Icons.person_pin, onAction: () {
//                     Navigator.pushNamed(context, RouterName.yourTeam);
//                   }),
//                   _buildCategories('Suport', Icons.speaker_group, onAction: () {
//                     Navigator.pushNamed(context, RouterName.sellerSupport);
//                   }),
//                 ]),
//           ),
//         ));
//   }

//   _buildCategories(String name, IconData iconData, {Function onAction}) {
//     return Column(
//       children: [
//         InkWell(
//           onTap: onAction,
//           child: Container(
//             height: 60,
//             width: 80,
//             decoration:
//                 BoxDecoration(color: Colors.black12, shape: BoxShape.circle),
//             child: Icon(iconData),
//           ),
//         ),
//         SizedBox(height: 5),
//         name != null
//             ? Text(
//                 name,
//                 style: GoogleFonts.poppins(fontSize: 12),
//               )
//             : Text('')
//       ],
//     );
//   }

//   void _logout(String v) {
    
//   }

// }






//import 'package:digitalkarobaar/src/models/Images.dart';
import 'package:digitalkarobaar/src/models/home_image.dart';
import 'package:digitalkarobaar/src/repository/home_repository.dart';
import 'package:digitalkarobaar/src/route/router_name.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class SellerDashBoard extends StatefulWidget {
  @override
  _SellerDashBoardState createState() => _SellerDashBoardState();
}

class _SellerDashBoardState extends State<SellerDashBoard> {


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
  var choices = ['logout Dashboard'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
         actions: [

          





            GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RouterName.mainPage);
                },
                child: Padding(
                  padding:
                      const EdgeInsets.only(right: 10.0, top: 10, bottom: 10),
                  child: Container(
                    width: 70,
                    decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        "Home",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                )),


                PopupMenuButton<String>(
              elevation: 0.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              onSelected: (v) {
                _logout(v);
              },
              itemBuilder: (BuildContext context) {
                return choices.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(
                      choice,
                      style: GoogleFonts.poppins(fontSize: 12),
                    ),
                  );
                }).toList();
              },
            ),
          ],
      ),
        body: Center(
      child: isLoading
          ? Center(child: CircularProgressIndicator())
          :
      
       Center(
         child: Card(
          margin: EdgeInsets.all(10),
          shadowColor: Colors.black12,
          shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.black12),
              borderRadius: BorderRadius.circular(10)),
          child: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              crossAxisCount: 3,
              shrinkWrap: true,
              children: [

                       Column(
                          children: [
                           InkWell(
                            onTap: (){


                               Navigator.pushNamed(context, RouterName.sellerOrder);
                            },

                           child: Container(
                             height: 60,
                             width: 80,
                             decoration:
                                 BoxDecoration(color: Colors.black12, shape: BoxShape.circle),
                                 child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: images.length,
                            itemBuilder: (c, index){
                              return 
                              Image.network(images[index].orderIcon,fit: BoxFit.cover,);
                            }
                            ),
                              ),
                            ),
                            SizedBox(height: 5),
                            Text("Order"),
                         
                         
                           ],
                         ),


                         Column(
                          children: [
                           InkWell(
                            onTap: (){

                              Navigator.pushNamed(context, RouterName.myAccount);
                            },

                           child: Container(
                             height: 60,
                             width: 80,
                             decoration:
                                 BoxDecoration(color: Colors.black12, shape: BoxShape.circle),
                                 child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: images.length,
                            itemBuilder: (c, index){
                              return 
                              Image.network(images[index].accountIcon,fit: BoxFit.cover,);
                            }
                            ),
                              ),
                            ),
                            SizedBox(height: 5),
                            Text("Account"),
                         
                         
                           ],
                         ),

                         Column(
                          children: [
                           InkWell(
                            onTap: (){
                               Navigator.pushNamed(context, RouterName.sellerReturn);
                            },

                           child: Container(
                             height: 60,
                             width: 80,
                             decoration:
                                 BoxDecoration(color: Colors.black12, shape: BoxShape.circle),
                                 child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: images.length,
                            itemBuilder: (c, index){
                              return 
                              Image.network(images[index].returnIcon,fit: BoxFit.cover,);
                            }
                            ),
                              ),
                            ),
                            SizedBox(height: 5),
                            Text("Return"),
                         
                         
                           ],
                         ),
                         Column(
                          children: [
                           InkWell(
                            onTap: (){

                              Navigator.pushNamed(context, RouterName.yourBrands);
                            },

                           child: Container(
                             height: 60,
                             width: 80,
                             decoration:
                                 BoxDecoration(color: Colors.black12, shape: BoxShape.circle),
                                 child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: images.length,
                            itemBuilder: (c, index){
                              return 
                              Image.network(images[index].brandIcon,fit: BoxFit.cover,);
                            }
                            ),
                              ),
                            ),
                            SizedBox(height: 5),
                            Text("Brand"),
                         
                         
                           ],
                         ),
                         Column(
                          children: [
                           InkWell(
                            onTap: (){
                             Navigator.pushNamed(context, RouterName.poststoty);
                            },

                           child: Container(
                             height: 60,
                             width: 80,
                             decoration:
                                 BoxDecoration(color: Colors.black12, shape: BoxShape.circle),
                                 child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: images.length,
                            itemBuilder: (c, index){
                              return 
                              Image.network(images[index].storyIcon,fit: BoxFit.cover,);
                            }
                            ),
                              ),
                            ),
                            SizedBox(height: 5),
                            Text("Story"),
                         
                         
                           ],
                         ),


                          Column(
                          children: [
                           InkWell(
                            onTap: (){

                               Navigator.pushNamed(context, RouterName.productUpload);
                            },

                           child: Container(
                             height: 60,
                             width: 80,
                             decoration:
                                 BoxDecoration(color: Colors.black12, shape: BoxShape.circle),
                                 child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: images.length,
                            itemBuilder: (c, index){
                              return 
                              Image.network(images[index].productIcon,fit: BoxFit.cover,);
                            }
                            ),
                              ),
                            ),
                            SizedBox(height: 5),
                            Text("Product"),
                         
                         
                           ],
                         ),

                         Column(
                          children: [
                           InkWell(
                            onTap: (){
                              Navigator.pushNamed(context, RouterName.vypaarSuraksha);
                            },

                           child: Container(
                             height: 60,
                             width: 80,
                             decoration:
                                 BoxDecoration(color: Colors.black12, shape: BoxShape.circle),
                                 child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: images.length,
                            itemBuilder: (c, index){
                              return 
                              Image.network(images[index].vayaparSuraksha,fit: BoxFit.cover,);
                            }
                            ),
                              ),
                            ),
                            SizedBox(height: 5),
                            Text("Vyapaar"),
                           ],
                         ),

                         Column(
                          children: [
                           InkWell(
                            onTap: (){

                               Navigator.pushNamed(context, RouterName.yourTeam);
                            },

                           child: Container(
                             height: 60,
                             width: 80,
                             decoration:
                                 BoxDecoration(color: Colors.black12, shape: BoxShape.circle),
                                 child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: images.length,
                            itemBuilder: (c, index){
                              return 
                              Image.network(images[index].connectionIcon,fit: BoxFit.cover,);
                            }
                            ),
                              ),
                            ),
                            SizedBox(height: 5),
                            Text("Team"),
                         
                         
                           ],
                         ),


                         Column(
                          children: [
                           InkWell(
                            onTap: (){
                              Navigator.pushNamed(context, RouterName.sellerSupport);
                            },

                           child: Container(
                             height: 60,
                             width: 80,
                             decoration:
                                 BoxDecoration(color: Colors.black12, shape: BoxShape.circle),
                                 child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: images.length,
                            itemBuilder: (c, index){
                              return 
                              Image.network(images[index].footwearIcon,fit: BoxFit.cover,);
                            }
                            ),
                              ),
                            ),
                            SizedBox(height: 5),
                            Text("Support"),
                         
                         
                           ],
                         ),

                         Column(
                          children: [
                           InkWell(
                            onTap: (){

                               Navigator.pushNamed(context, RouterName.adverties);
                            },

                           child: Container(
                             height: 60,
                             width: 80,
                             decoration:
                                 BoxDecoration(color: Colors.black12, shape: BoxShape.circle),
                                 child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: images.length,
                            itemBuilder: (c, index){
                              return 
                              Image.network(images[index].advIcon,fit: BoxFit.cover,);
                            }
                            ),
                              ),
                            ),
                            SizedBox(height: 5),
                            Text("Advertise"),
                         
                         
                           ],
                         ),
                  
                  ]
              
              ),
      ),
       ),
    ));
  }

  void _logout(String v) {
    
   }

  
  
}

