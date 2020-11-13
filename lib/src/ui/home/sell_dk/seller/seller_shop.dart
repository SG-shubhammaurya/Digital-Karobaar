// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:digitalkarobaar/src/core/utils/constants/language_keys.dart';
// import 'package:digitalkarobaar/src/core/widget/no_data_available.dart';
// import 'package:digitalkarobaar/src/models/seller_dash.dart';
// import 'package:digitalkarobaar/src/repository/sell_respository.dart';
// import 'package:digitalkarobaar/src/route/router_name.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:digitalkarobaar/src/core/utils/constants/common.dart';

// class SellerShop extends StatefulWidget {
//   const SellerShop(this.id);
//   final id;
//   @override
//   _SellerShopState createState() => _SellerShopState();
// }

// class _SellerShopState extends State<SellerShop> {
//   @override
//   void initState() {
//     _getSellerDetails();

//     super.initState();
//   }

//   SellerDash sellerDash;
//   List<Product> sellerProducts = [];
//   bool isLoading = true;
//   _getSellerDetails() async {
    
//  final   shop = await SellRepository.getSellerShop(widget.id);

//     if(shop !=null){
//        sellerDash = shop;
//        setState(() {
//          isLoading = false;
//       });
//     }
//   }

//   bool isFollow = false;
//   TextEditingController controller = new TextEditingController();
//   //bool favorite=false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: isLoading
//             ? Center(child: CircularProgressIndicator())
//             : ListView(shrinkWrap: true, children: [
//                 SizedBox(
//                     height: 270,
//                     child: Stack(children: <Widget>[
//                       Positioned(
//                         child: ClipRect(
//                           child: Container(
//                             height: 250,
//                             color: Colors.orange,
//                             width: double.infinity,
//                             child: Column(
//                               children: [
//                                 Row(
//                                   children: [
//                                     IconButton(
//                                         color: Colors.white,
//                                         icon: Icon(Icons.arrow_back),
//                                         onPressed: () {
//                                           Navigator.pushNamed(
//                                               context, RouterName.mainPage);
//                                         }),
//                                     const SizedBox(width: 10),
//                                     Text(
//                                       LanguageKeys.sellerShop
//                                           .translate(context),
//                                       style: TextStyle(
//                                           color: Colors.white,
//                                           fontWeight: FontWeight.bold,
//                                           fontSize: 15),
//                                     ),
//                                     // SizedBox(width: 40.0),
//                                   ],
//                                 ),
//                                 Row(children: [
//                                   SizedBox(width: 30),
//                                   CircleAvatar(
//                                     radius: 25.0,
//                                     backgroundImage: NetworkImage(
//                                       sellerDash.profile.profile,
//                                     ),
//                                   ),
//                                   SizedBox(width: 20),
//                                   Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.center,
//                                       children: [
//                                         Text("Folllowers",
//                                             style:
//                                                 TextStyle(color: Colors.white)),
//                                         Text(sellerDash.followers.toString(),
//                                             style:
//                                                 TextStyle(color: Colors.white))
//                                       ]),

//                                   // SizedBox(
//                                   //   width: 20,
//                                   // ),

//                                   sellerDash.image != null
//                                       ? Container(
//                                           height: 50,
//                                           width: 150,
//                                           child: Image.network(sellerDash.image,
//                                               fit: BoxFit.cover),
//                                         )
//                                       : InkWell(
//                                           onTap: () {
//                                             Navigator.pushNamed(context,
//                                                 RouterName.vypaarSuraksha);
//                                           },
//                                           child: Text(
//                                             LanguageKeys.getVerified
//                                                 .translate(context),
//                                             style: TextStyle(fontSize: 17),
//                                           ),
//                                         ),
// //
//                                 ]),
//                                 SizedBox(height: 15),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                   sellerDash.profile.name != null ?    Container(
//                                       decoration: BoxDecoration(
//                                           color: Colors.black12,
//                                           borderRadius:
//                                               BorderRadius.circular(10)),
//                                       height: 40,
//                                       width: 180,
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.center,
//                                         children: [
//                                           Text(
//                                               sellerDash.profile.name != null ? sellerDash.profile.name : 'Unknown'
//                                                   .toString(),
//                                               style: TextStyle(
//                                                   fontSize: 12,
//                                                   color: Colors.white)),
//                                         ],
//                                       ),
//                                     ):Text("No Name"),
//                                      //SizedBox(width: 5),
//                                     IconButton(
//                                         iconSize: 30,
//                                         color: Colors.white,
//                                         //alignment: Alignment.,
//                                         icon: Icon(
//                                           Icons.share,
//                                           size: 16,
//                                         ),
//                                         onPressed: () async {
//                                           //String p = await shareProfile(id);
//                                           // share(context, p);
//                                         }),

//                                     !isFollow
//                                         ? RaisedButton(
//                                             elevation: 0.0,
//                                             color: Colors.black12,
//                                             shape: RoundedRectangleBorder(
//                                                 borderRadius:
//                                                     BorderRadius.circular(20)),
//                                             onPressed: () {
//                                               setState(() {
//                                                 isFollow = !isFollow;
//                                               });
//                                               SellRepository.follow(widget.id);
//                                             },
//                                             child: Text('Follow',
//                                                 style: GoogleFonts.poppins(
//                                                     fontSize: 12,
//                                                     color: Colors.white)))
//                                         : RaisedButton(
//                                             elevation: 0.0,
//                                             color: Colors.black12,
//                                             shape: RoundedRectangleBorder(
//                                                 borderRadius:
//                                                     BorderRadius.circular(20)),
//                                             onPressed: () {
//                                               setState(() {
//                                                 isFollow = !isFollow;
//                                               });
//                                               SellRepository.follow(widget.id);
//                                             },
//                                             child: Text('UnFollow',
//                                                 style: GoogleFonts.poppins(
//                                                     fontSize: 12,
//                                                     color: Colors.white))),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                       Positioned(
//                         top: 220,
//                         left: 0,
//                         right: 0,
//                         child: Container(
//                           width: double.infinity,
//                           height: 400,
//                         ),
//                       ),
//                       Positioned(
//                           top: 200,
//                           child: Padding(
//                               padding:
//                                   const EdgeInsets.symmetric(horizontal: 25),
//                               child: Container(
//                                   width:
//                                       MediaQuery.of(context).size.width * 0.8,
//                                   height: 80,
//                                   child: Card(
//                                     shape: RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(5)),
//                                     child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceAround,
//                                         children: <Widget>[
//                                           Column(
//                                             children: [
//                                               SizedBox(height: 20),
//                                               Text('Min Order Value',
//                                                   style: TextStyle(
//                                                       color: Colors.grey,
//                                                       fontSize: 10,
//                                                       fontWeight:
//                                                           FontWeight.bold)),
//                                               SizedBox(height: 10),
//                                               Text("₹${sellerDash.minimum}")
//                                             ],
//                                           ),
//                                           Column(children: [
//                                             SizedBox(height: 20),
//                                             Text(
//                                               'Price Range',
//                                               style: TextStyle(
//                                                   color: Colors.grey,
//                                                   fontSize: 10,
//                                                   fontWeight: FontWeight.bold),
//                                             ),
//                                             SizedBox(height: 10),
//                                             Text("₹ ${sellerDash.minimum}"),
//                                           ])
//                                         ]),
//                                   ))))
//                     ])),
//                 SizedBox(height: 10),
//                 Padding(
//                   padding: const EdgeInsets.all(0),
//                   child: Row(
//                     children: [
//                       SizedBox(width: 5),
//                       Container(
//                         decoration: BoxDecoration(
//                           color: Colors.black12,
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         height: 40,
//                         width: 115,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Row(
//                               children: [
//                                 Text(
//                                   sellerDash.customers.toString(),
//                                   style: TextStyle(fontSize: 11),
//                                 ),
//                                 SizedBox(width: 5),
//                                 Text("Customers"),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(width: 5),
//                       Container(
//                         decoration: BoxDecoration(
//                             color: Colors.black12,
//                             borderRadius: BorderRadius.circular(10)),
//                         height: 40,
//                         width: 110,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Row(
//                               children: [
//                                 Text(
//                                   sellerDash.products.toString(),
//                                   style: TextStyle(fontSize: 11),
//                                 ),
//                                 SizedBox(width: 5),
//                                 Text("Products"),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(width: 5),
//                       Container(
//                         decoration: BoxDecoration(
//                             color: Colors.black12,
//                             borderRadius: BorderRadius.circular(10)),
//                         height: 40,
//                         width: 110,
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Row(
//                             children: [
//                               Text(sellerDash.dispatch,
//                                   style: TextStyle(fontSize: 11)),
//                               Text(
//                                 " Days Dispatch",
//                                 style: TextStyle(fontSize: 11),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 10.0),
//                 Container(
//                   height: 100,
//                   child: ListView(
//                     scrollDirection: Axis.horizontal,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(left: 10.0),
//                         child: Row(
//                           children: [
//                             Text(
//                               LanguageKeys.brand.translate(context),
//                               style: TextStyle(fontWeight: FontWeight.bold),
//                             ),
//                             Divider(),
//                             SizedBox(width: 30),
//                             sellerDash.brands != null
//                                 ? ListView.builder(
//                                     scrollDirection: Axis.horizontal,
//                                     shrinkWrap: true,
//                                     itemCount: sellerDash.brands.length,
//                                     itemBuilder:
//                                         (BuildContext context, int index) {
//                                       return _buildBrand(
//                                         sellerDash.brands[index].title,
//                                         sellerDash.brands[index].image,
//                                       );
//                                     })
//                                 : Center(child: Text("No Brand available")),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),

//                 Container(
//                   height: 30,
//                   color: Colors.black12,
//                   child: Row(
//                     children: [
//                       SizedBox(width: 10.0),
//                       Text(LanguageKeys.product.translate(context),
//                           style: TextStyle(fontWeight: FontWeight.bold)),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 Container(
//                   color: Theme.of(context).primaryColor,
//                   child: new Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: new Card(
//                       child: new ListTile(
//                         leading: new Icon(Icons.search),
//                         title: new TextField(
//                           controller: controller,
//                           decoration: new InputDecoration(
//                               hintText: LanguageKeys.search.translate(context),
//                               border: InputBorder.none),
//                           onChanged: onSearchTextChanged,
//                         ),
//                         trailing: new IconButton(
//                           icon: new Icon(Icons.cancel),
//                           onPressed: () {
//                             controller.clear();
//                             onSearchTextChanged('');
//                           },
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 //search..
//                 //         Column(
//                 //   children: <Widget>[
//                 //     TextField(onChanged: _filter),
//                 //     StreamBuilder<SellerDash>(
//                 //       initialData: _dataFromQuerySnapShot,

//                 //       builder:
//                 //           (BuildContext context, AsyncSnapshot<SellerDash> snapshot) {
//                 //         return StreamBuilder<SellerDash>(
//                 //           key: ValueKey(snapshot.data),
//                 //           initialData: snapshot.data,
//                 //           stream: _stream,
//                 //           builder:
//                 //               (BuildContext context, AsyncSnapshot<SellerDash> snapshot) {
//                 //                 print(snapshot.data);
//                 //             return  GridView.count(
//                 //                   primary: false,
//                 //                   padding: const EdgeInsets.all(20),
//                 //                   crossAxisSpacing: 12,
//                 //                   mainAxisSpacing: 12,
//                 //                   crossAxisCount: 2,
//                 //                   shrinkWrap: true,
//                 //                   children:
//                 //                       List.generate(sellerDash.product.length, (index) {
//                 //                     return _buildCategories(
//                 //                         sellerDash.product[index], Icons.tv);
//                 //                   }).toList(),
//                 //                 );
//                 //           },
//                 //         );
//                 //       },
//                 //     )
//                 //   ],
//                 // ),
//                 sellerProducts.length != 0 || controller.text.isNotEmpty
//                     ? GridView.count(
//                         primary: false,
//                         padding: const EdgeInsets.all(20),
//                         crossAxisSpacing: 12,
//                         mainAxisSpacing: 12,
//                         crossAxisCount: 2,
//                         shrinkWrap: true,
//                         children: List.generate(sellerProducts.length, (index) {
//                           return _buildCategories(
//                               sellerProducts[index], Icons.tv);
//                         }).toList(),
//                       )
//                     : sellerDash?.product?.length != 0
//                         ? GridView.count(
//                             primary: false,
//                             padding: const EdgeInsets.all(20),
//                             crossAxisSpacing: 12,
//                             mainAxisSpacing: 12,
//                             crossAxisCount: 2,
//                             shrinkWrap: true,
//                             children: List.generate(sellerDash.product.length,
//                                 (index) {
//                               return _buildCategories(
//                                   sellerDash.product[index], Icons.tv);
//                             }).toList(),
//                           )
//                         : Center(
//                             child: NoDataAvailable(
//                             message: "No Brands Available",
//                           )),
//               ]));
//   }

//   Widget _buildCategories(
//     Product product,
//     IconData iconData,
//   ) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.pushNamed(context, RouterName.productDetails,
//             arguments: product.id);
//       },
//       child: Container(
//         decoration: BoxDecoration(
//           border: Border.all(width: 1),
//         ),
//         child: Column(
  
//           children: [
//             SizedBox(
//                                   height:90,
//                                 width: 120,
//                                   child: CachedNetworkImage(
//                                     imageUrl: product.image1,
//                                     fit: BoxFit.cover,
                                    
//                                     placeholder: (context, url) => Center(
//                                         child: CircularProgressIndicator()),
//                                     errorWidget: (context, url, error) =>
//                                         Icon(Icons.broken_image),
//                                   ),
//                                 ),
//             SizedBox(height: 5),
//             product.title != null
//                 ? Text(
//                     product.title,
//                     style: GoogleFonts.poppins(fontSize: 12),
//                   )
//                 : Text('')
//           ],
//         ),
//       ),
//     );
//   }

//   _buildBrand(String title, String image) {
//     return Container(
//         child: Column(children: [
//       SizedBox(width: 40),
//       SizedBox(height: 20),
//       CircleAvatar(radius: 25, child: Image.network(image)),
//       SizedBox(height: 5.0),
//       Text(title),
//       SizedBox(width: 100),
//     ]));
//   }

//   onSearchTextChanged(String text) async {
//     sellerProducts.clear();
//     if (text.isEmpty) {
//       setState(() {});
//       return;
//     }

//     sellerDash.product.forEach((products) {
//       if (products.title.contains(text) || products.shop.contains(text))
//         sellerProducts.add(products);
//     });

//     setState(() {});
//   }
// }


import 'package:cached_network_image/cached_network_image.dart';
import 'package:digitalkarobaar/src/core/utils/constants/language_keys.dart';
import 'package:digitalkarobaar/src/core/widget/no_data_available.dart';
import 'package:digitalkarobaar/src/models/seller_dash.dart';
import 'package:digitalkarobaar/src/repository/sell_respository.dart';
import 'package:digitalkarobaar/src/route/router_name.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:digitalkarobaar/src/core/utils/constants/common.dart';

class SellerShop extends StatefulWidget {
  const SellerShop(this.id);
  final id;
  @override
  _SellerShopState createState() => _SellerShopState();
}

class _SellerShopState extends State<SellerShop> {
  @override
  void initState() {
    _getSellerDetails();

    super.initState();
  }

  SellerDash sellerDash;
  List<Product> sellerProducts = [];
  bool isLoading = true;
  _getSellerDetails() async {
    
 final   shop = await SellRepository.getSellerShop(widget.id);

    if(shop !=null){
       sellerDash = shop;
       setState(() {
         isLoading = false;
      });
    }
  }

  bool isFollow = false;
  TextEditingController controller = new TextEditingController();
  //bool favorite=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView(shrinkWrap: true, children: [
                SizedBox(
                    height: 270,
                    child: Stack(children: <Widget>[
                      Positioned(
                        child: ClipRect(
                          child: Container(
                            height: 250,
                            color: Colors.orange,
                            width: double.infinity,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                        color: Colors.white,
                                        icon: Icon(Icons.arrow_back),
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, RouterName.mainPage);
                                        }),
                                    const SizedBox(width: 10),
                                    Text(
                                      LanguageKeys.sellerShop
                                          .translate(context),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                    // SizedBox(width: 40.0),
                                  ],
                                ),
                                Row(children: [
                                  SizedBox(width: 30),
                                  CircleAvatar(
                                    radius: 25.0,
                                    backgroundImage: NetworkImage(
                                      sellerDash.profile.profile,
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text("Folllowers",
                                            style:
                                                TextStyle(color: Colors.white)),
                                        Text(sellerDash.followers.toString(),
                                            style:
                                                TextStyle(color: Colors.white))
                                      ]),

                                  // SizedBox(
                                  //   width: 20,
                                  // ),

                                  sellerDash.image != null
                                      ? Container(
                                          height: 50,
                                          width: 150,
                                          child: Image.network(sellerDash.image,
                                              fit: BoxFit.cover),
                                        )
                                      : InkWell(
                                          onTap: () {
                                            Navigator.pushNamed(context,
                                                RouterName.vypaarSuraksha);
                                          },
                                          child: Text(
                                            LanguageKeys.getVerified
                                                .translate(context),
                                            style: TextStyle(fontSize: 17),
                                          ),
                                        ),
//
                                ]),
                                SizedBox(height: 15),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                Container(
                                      decoration: BoxDecoration(
                                          color: Colors.black12,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      height: 40,
                                      width: 80,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                              sellerDash.profile.name != null ?   sellerDash.profile.name : 'unknown'
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.white)),
                                        ],
                                      ),
                                    ),
                                    // SizedBox(width: 5),
                                    IconButton(
                                        iconSize: 30,
                                        color: Colors.white,
                                        //alignment: Alignment.,
                                        icon: Icon(
                                          Icons.share,
                                          size: 16,
                                        ),
                                        onPressed: () async {
                                          //String p = await shareProfile(id);
                                          // share(context, p);
                                        }),

                                    !isFollow
                                        ? RaisedButton(
                                            elevation: 0.0,
                                            color: Colors.black12,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            onPressed: () {
                                              setState(() {
                                                isFollow = !isFollow;
                                              });
                                              SellRepository.follow(widget.id);
                                            },
                                            child: Text('Follow',
                                                style: GoogleFonts.poppins(
                                                    fontSize: 12,
                                                    color: Colors.white)))
                                        : RaisedButton(
                                            elevation: 0.0,
                                            color: Colors.black12,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            onPressed: () {
                                              setState(() {
                                                isFollow = !isFollow;
                                              });
                                              SellRepository.follow(widget.id);
                                            },
                                            child: Text('UnFollow',
                                                style: GoogleFonts.poppins(
                                                    fontSize: 12,
                                                    color: Colors.white))),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 220,
                        left: 0,
                        right: 0,
                        child: Container(
                          width: double.infinity,
                          height: 400,
                        ),
                      ),
                      Positioned(
                          top: 200,
                          child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25),
                              child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  height: 80,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: <Widget>[
                                          Column(
                                            children: [
                                              SizedBox(height: 20),
                                              Text('Min Order Value',
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              SizedBox(height: 10),
                                              Text("₹${sellerDash.minimum}")
                                            ],
                                          ),
                                          Column(children: [
                                            SizedBox(height: 20),
                                            Text(
                                              'Price Range',
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(height: 10),
                                            Text("₹ ${sellerDash.minimum}"),
                                          ])
                                        ]),
                                  ))))
                    ])),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 40,
                        width: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              sellerDash.customers.toString(),
                              style: TextStyle(fontSize: 11),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(10)),
                        height: 40,
                        width: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              sellerDash.products.toString(),
                              style: TextStyle(fontSize: 11),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(10)),
                        height: 40,
                        width: 110,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(sellerDash.dispatch,
                                  style: TextStyle(fontSize: 11)),
                              Text(
                                " Days Dispatch",
                                style: TextStyle(fontSize: 11),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.0),
                Container(
                  height: 100,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Row(
                          children: [
                            Text(
                              LanguageKeys.brand.translate(context),
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Divider(),
                            SizedBox(width: 30),
                            sellerDash.brands != null
                                ? ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemCount: sellerDash.brands.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return _buildBrand(
                                        sellerDash.brands[index].title,
                                        sellerDash.brands[index].image,
                                      );
                                    })
                                : Center(child: Text("No Brand available")),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  height: 30,
                  color: Colors.black12,
                  child: Row(
                    children: [
                      SizedBox(width: 10.0),
                      Text(LanguageKeys.product.translate(context),
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  color: Theme.of(context).primaryColor,
                  child: new Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new Card(
                      child: new ListTile(
                        leading: new Icon(Icons.search),
                        title: new TextField(
                          controller: controller,
                          decoration: new InputDecoration(
                              hintText: LanguageKeys.search.translate(context),
                              border: InputBorder.none),
                          onChanged: onSearchTextChanged,
                        ),
                        trailing: new IconButton(
                          icon: new Icon(Icons.cancel),
                          onPressed: () {
                            controller.clear();
                            onSearchTextChanged('');
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                //search..
                //         Column(
                //   children: <Widget>[
                //     TextField(onChanged: _filter),
                //     StreamBuilder<SellerDash>(
                //       initialData: _dataFromQuerySnapShot,

                //       builder:
                //           (BuildContext context, AsyncSnapshot<SellerDash> snapshot) {
                //         return StreamBuilder<SellerDash>(
                //           key: ValueKey(snapshot.data),
                //           initialData: snapshot.data,
                //           stream: _stream,
                //           builder:
                //               (BuildContext context, AsyncSnapshot<SellerDash> snapshot) {
                //                 print(snapshot.data);
                //             return  GridView.count(
                //                   primary: false,
                //                   padding: const EdgeInsets.all(20),
                //                   crossAxisSpacing: 12,
                //                   mainAxisSpacing: 12,
                //                   crossAxisCount: 2,
                //                   shrinkWrap: true,
                //                   children:
                //                       List.generate(sellerDash.product.length, (index) {
                //                     return _buildCategories(
                //                         sellerDash.product[index], Icons.tv);
                //                   }).toList(),
                //                 );
                //           },
                //         );
                //       },
                //     )
                //   ],
                // ),
                sellerProducts.length != 0 || controller.text.isNotEmpty
                    ? GridView.count(
                        primary: false,
                        padding: const EdgeInsets.all(20),
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        children: List.generate(sellerProducts.length, (index) {
                          return _buildCategories(
                              sellerProducts[index], Icons.tv);
                        }).toList(),
                      )
                    : sellerDash?.product?.length != 0
                        ? GridView.count(
                            primary: false,
                            padding: const EdgeInsets.all(20),
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                            crossAxisCount: 2,
                            shrinkWrap: true,
                            children: List.generate(sellerDash.product.length,
                                (index) {
                              return _buildCategories(
                                  sellerDash.product[index], Icons.tv);
                            }).toList(),
                          )
                        : Center(
                            child: NoDataAvailable(
                            message: "No Brands Available",
                          )),
              ]));
  }

  Widget _buildCategories(
    Product product,
    IconData iconData,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RouterName.productDetails,
            arguments: product.id);
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1),
        ),
        child: Column(
  
          children: [
            SizedBox(
                                  height:90,
                                width: 120,
                                  child: CachedNetworkImage(
                                    imageUrl: product.image1,
                                    fit: BoxFit.cover,
                                    
                                    placeholder: (context, url) => Center(
                                        child: CircularProgressIndicator()),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.broken_image),
                                  ),
                                ),
            SizedBox(height: 5),
            product.title != null
                ? Text(
                    product.title,
                    style: GoogleFonts.poppins(fontSize: 12),
                  )
                : Text('')
          ],
        ),
      ),
    );
  }

  _buildBrand(String title, String image) {
    return Container(
        child: Column(children: [
      SizedBox(width: 40),
      SizedBox(height: 20),
      CircleAvatar(radius: 25, child: Image.network(image)),
      SizedBox(height: 5.0),
      Text(title),
      SizedBox(width: 100),
    ]));
  }

  onSearchTextChanged(String text) async {
    sellerProducts.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    sellerDash.product.forEach((products) {
      if (products.title.contains(text) || products.shop.contains(text))
        sellerProducts.add(products);
    });

    setState(() {});
  }
}