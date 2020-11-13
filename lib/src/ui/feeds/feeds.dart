// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:digitalkarobaar/src/core/widget/common_button.dart';
// import 'package:digitalkarobaar/src/core/widget/no_data_available.dart';
// import 'package:digitalkarobaar/src/models/products.dart';
// import 'package:digitalkarobaar/src/models/seller_dash.dart';
// import 'package:digitalkarobaar/src/models/user_story.dart';
// import 'package:digitalkarobaar/src/repository/home_repository.dart';
// import 'package:digitalkarobaar/src/res/app_colors.dart';
// import 'package:digitalkarobaar/src/route/router_name.dart';
// import 'package:digitalkarobaar/src/ui/feeds/stoty_details.dart';
// import 'package:flutter/material.dart';

// class Feeds extends StatefulWidget {
//   @override
//   _FeedsState createState() => _FeedsState();
// }

// class _FeedsState extends State<Feeds> {
//   UserStory userStory;
//   String ids;
//   List<Stories> newUserStory = <Stories>[];
//   _getUserStory() async {
//     userStory = UserStory(stories: []);

//     final story = await HomeReposiitory.getUserSoty().catchError((e) {
//       setState(() {
//         storyLoading = false;
//       });
//     });

//     userStory = story;

//     Set<int> storyIds = Set<int>();
//     for (int i = 0; i < userStory.stories.length; i++) {
//       if (storyIds.add(userStory.stories[i].sellerId)) {
//         newUserStory.add(userStory.stories[i]);
//       }
//     }
// //add new
//     if (newUserStory != null) {
//       setState(() {
//         storyLoading = false;
//       });
//     }
//     String param = '';

//     newUserStory.forEach((a) {
//       param = param + '${a.sellerId}+';
//     });

//     var pos = param.lastIndexOf('+');
//     ids = (pos != -1) ? param.substring(0, pos) : param;
//     _getSellerForUserProducts();
//   }

//   List<Products> sellerProducts = [];
//   bool isLoading = true;
//   bool storyLoading = true;
//   _getSellerForUserProducts() {
//     if (ids != null) {
//       HomeReposiitory.getSellerSotyProducts(ids).then((prod) {
//         if (prod != null) {
//           setState(() {
//             sellerProducts = prod;
//             isLoading = false;
//           });
//         }
//       }).catchError((e) {
//         setState(() {
//           isLoading = false;
//         });
//       });
//     }
//   }

//   @override
//   void initState() {
//     _getUserStory();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Your Story'),
//         ),
//         body: SingleChildScrollView(
//           primary: true,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               storyLoading
//                   ? Center(
//                       child: CircularProgressIndicator(
//                       valueColor:
//                           AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
//                     ))
//                   : newUserStory.length == 0
//                       ? Center(child: NoDataAvailable(message: ""))
//                       : Container(
//                           height: 60,
//                           child: ListView.builder(
//                               scrollDirection: Axis.horizontal,
//                               shrinkWrap: true,
//                               primary: true,
//                               itemCount: newUserStory.length,
//                               itemBuilder: (c, i) {
//                                 return InkWell(
//                                   onTap: () {
//                                     Navigator.of(context).push(
//                                         MaterialPageRoute(
//                                             builder: (context) => MoreStories(
//                                                 userStory,
//                                                 newUserStory[i]
//                                                     .sellerId
//                                                     .toString())));
//                                   },
//                                   child: Padding(
//                                     padding: const EdgeInsets.all(4.0),
//                                     child: CircleAvatar(
//                                         child: CachedNetworkImage(
//                                             imageUrl: newUserStory[i].file,
//                                             errorWidget:
//                                                 (context, url, error) =>
//                                                     Image.network(
//                                                       'https://azadchaiwala.pk/getImage?i=&t=course',
//                                                     ))),
//                                   ),
//                                 );
//                               }),
//                         ),
//               isLoading
//                   ? Center(
//                       child: CircularProgressIndicator(
//                       valueColor:
//                           AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
//                     ))
//                   : sellerProducts.length == 0
//                       ? Center(child: NoDataAvailable(message: "No Products"))
//                       : ListView.builder(
//                           shrinkWrap: true,
//                           primary: false,
//                           itemCount: sellerProducts.length,
//                           itemBuilder: (c, i) {
//                             return Padding(
//                               padding:
//                                   const EdgeInsets.symmetric(horizontal: 10),
//                               child: Card(
//                                 child: Column(
//                                   //  crossAxisAlignment: CrossAxisAlignment.center,
//                                   children: [
//                                     SizedBox(height: 10),
//                                     Container(
//                                         width: 310,
//                                         height: 180,
//                                         color: Colors.grey[300],
//                                         // child: Icon(
//                                         //   Icons.broken_image,
//                                         //   color: Colors.black12,
//                                         // ),
//                                         child: CachedNetworkImage(
//                                             imageUrl: sellerProducts[i].image1,
//                                             placeholder: (context, url) =>
//                                                 Center(
//                                                     child:
//                                                         CircularProgressIndicator(
//                                                   backgroundColor:
//                                                       AppColors.primaryColor,
//                                                 )),
//                                             errorWidget:
//                                                 (context, url, error) =>
//                                                     Image.network(
//                                                       'https://azadchaiwala.pk/getImage?i=&t=course',
//                                                     ))),
//                                     SizedBox(height: 10),
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceAround,
//                                       children: [
//                                         Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             Padding(
//                                               padding: const EdgeInsets.only(
//                                                   left: 20),
//                                               child: Align(
//                                                 alignment: Alignment.centerLeft,
//                                                 child: ConstrainedBox(
//                                                     constraints: BoxConstraints(
//                                                         maxHeight:
//                                                             MediaQuery.of(
//                                                                     context)
//                                                                 .size
//                                                                 .height),
//                                                     child: Text(
//                                                         sellerProducts[i].title,
//                                                         style: TextStyle(
//                                                           fontFamily: 'Roboto',
//                                                           color:
//                                                               Color(0xff657786),
//                                                           fontSize: 14,
//                                                           fontWeight:
//                                                               FontWeight.w400,
//                                                           fontStyle:
//                                                               FontStyle.normal,
//                                                         ))),
//                                               ),
//                                             ),
//                                             SizedBox(height: 5),
//                                             Padding(
//                                               padding: const EdgeInsets.only(
//                                                   left: 20),
//                                               child: Align(
//                                                 alignment: Alignment.centerLeft,
//                                                 child: ConstrainedBox(
//                                                     constraints: BoxConstraints(
//                                                         maxHeight:
//                                                             MediaQuery.of(
//                                                                     context)
//                                                                 .size
//                                                                 .height),
//                                                     child: Text(
//                                                         sellerProducts[i]
//                                                             .description,
//                                                         style: TextStyle(
//                                                           fontFamily: 'Roboto',
//                                                           color:
//                                                               Color(0xff657786),
//                                                           fontSize: 14,
//                                                           fontWeight:
//                                                               FontWeight.w400,
//                                                           fontStyle:
//                                                               FontStyle.normal,
//                                                         ))),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                         InkWell(
//                                           onTap: () {
//                                             Navigator.pushNamed(context,
//                                                 RouterName.productDetails,
//                                                 arguments:
//                                                     sellerProducts[i].id);
//                                           },
//                                           child: Container(
//                                             height: 25,
//                                             width: 60,
//                                             child: Center(
//                                                 child: Text('Buy Now',
//                                                     style: TextStyle(
//                                                         fontSize: 12,
//                                                         color: AppColors
//                                                             .primaryColor))),
//                                             decoration: BoxDecoration(
//                                                 color: Colors.orange[200],
//                                                 shape: BoxShape.rectangle,
//                                                 borderRadius: BorderRadius.all(
//                                                     Radius.circular(20))),
//                                           ),
//                                         )
//                                       ],
//                                     ),
//                                     SizedBox(height: 10),
//                                   ],
//                                 ),
//                               ),
//                             );
//                           })
//             ],
//           ),
//         ));
//   }
// }


import 'package:cached_network_image/cached_network_image.dart';
import 'package:digitalkarobaar/src/core/widget/common_button.dart';
import 'package:digitalkarobaar/src/core/widget/no_data_available.dart';
import 'package:digitalkarobaar/src/models/products.dart';
import 'package:digitalkarobaar/src/models/seller_dash.dart';
import 'package:digitalkarobaar/src/models/user_story.dart';
import 'package:digitalkarobaar/src/repository/home_repository.dart';
import 'package:digitalkarobaar/src/res/app_colors.dart';
import 'package:digitalkarobaar/src/route/router_name.dart';
import 'package:digitalkarobaar/src/ui/feeds/stoty_details.dart';
import 'package:flutter/material.dart';

class Feeds extends StatefulWidget {
  @override
  _FeedsState createState() => _FeedsState();
}

class _FeedsState extends State<Feeds> {
  UserStory userStory;
  String ids;
  List<Stories> newUserStory = <Stories>[];
  _getUserStory() async {
    userStory = UserStory(stories: []);

    final story = await HomeReposiitory.getUserSoty().catchError((e) {
      setState(() {
        storyLoading = false;
      });
    });

    userStory = story;

    Set<int> storyIds = Set<int>();
    for (int i = 0; i < userStory.stories.length; i++) {
      if (storyIds.add(userStory.stories[i].sellerId)) {
        newUserStory.add(userStory.stories[i]);
      }
    }
//add new
    if (newUserStory != null) {
      setState(() {
        storyLoading = false;
           isLoading = false;
      });
    }
    String param = '';

    newUserStory.forEach((a) {
      param = param + '${a.sellerId}+';
    });

    var pos = param.lastIndexOf('+');
    ids = (pos != -1) ? param.substring(0, pos) : param;
    _getSellerForUserProducts();
  }

  List<Products> sellerProducts = [];
  bool isLoading = true;
  bool storyLoading = true;
  _getSellerForUserProducts() {
    if (ids != null) {
      HomeReposiitory.getSellerSotyProducts(ids).then((prod) {
        if (prod != null) {
          setState(() {
            sellerProducts = prod;
            isLoading = false;
          });
        }
      }).catchError((e) {
        setState(() {
          isLoading = false;
        });
      });
    }
  }

  @override
  void initState() {
    _getUserStory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Story'),
        ),
        body: SingleChildScrollView(
          primary: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              storyLoading
                  ? Center(
                      child: CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
                    ))
                  : newUserStory.length == 0
                      ? Center(child: NoDataAvailable(message: "No story available"))
                      : Container(
                          height: 60,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              primary: true,
                              itemCount: newUserStory.length,
                              itemBuilder: (c, i) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => MoreStories(
                                                userStory,
                                                newUserStory[i]
                                                    .sellerId
                                                    .toString())));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: CircleAvatar(
                                        child: CachedNetworkImage(
                                            imageUrl: newUserStory[i].file,
                                            errorWidget:
                                                (context, url, error) =>
                                                    Image.network(
                                                      'https://azadchaiwala.pk/getImage?i=&t=course',
                                                    ))),
                                  ),
                                );
                              }),
                        ),
              isLoading
                  ? Center(
                      child: CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
                    ))
                  : sellerProducts.length == 0
                      ? Center(child: NoDataAvailable(message: ""))
                      : ListView.builder(
                          shrinkWrap: true,
                          primary: false,
                          itemCount: sellerProducts.length,
                          itemBuilder: (c, i) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Card(
                                child: Column(
                                  //  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(height: 10),
                                    Container(
                                        width: 310,
                                        height: 180,
                                        color: Colors.grey[300],
                                        // child: Icon(
                                        //   Icons.broken_image,
                                        //   color: Colors.black12,
                                        // ),
                                        child: CachedNetworkImage(
                                            imageUrl: sellerProducts[i].image1,
                                            placeholder: (context, url) =>
                                                Center(
                                                    child:
                                                        CircularProgressIndicator(
                                                  backgroundColor:
                                                      AppColors.primaryColor,
                                                )),
                                            errorWidget:
                                                (context, url, error) =>
                                                    Image.network(
                                                      'https://azadchaiwala.pk/getImage?i=&t=course',
                                                    ))),
                                    SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20),
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: ConstrainedBox(
                                                    constraints: BoxConstraints(
                                                        maxHeight:
                                                            MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height),
                                                    child: Text(
                                                        sellerProducts[i].title,
                                                        style: TextStyle(
                                                          fontFamily: 'Roboto',
                                                          color:
                                                              Color(0xff657786),
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontStyle:
                                                              FontStyle.normal,
                                                        ))),
                                              ),
                                            ),
                                            SizedBox(height: 5),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20),
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: ConstrainedBox(
                                                    constraints: BoxConstraints(
                                                        maxHeight:
                                                            MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height),
                                                    child: Text(
                                                        sellerProducts[i]
                                                            .description,
                                                        style: TextStyle(
                                                          fontFamily: 'Roboto',
                                                          color:
                                                              Color(0xff657786),
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontStyle:
                                                              FontStyle.normal,
                                                        ))),
                                              ),
                                            ),
                                          ],
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Navigator.pushNamed(context,
                                                RouterName.productDetails,
                                                arguments:
                                                    sellerProducts[i].id);
                                          },
                                          child: Container(
                                            height: 25,
                                            width: 60,
                                            child: Center(
                                                child: Text('Buy Now',
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: AppColors
                                                            .primaryColor))),
                                            decoration: BoxDecoration(
                                                color: Colors.orange[200],
                                                shape: BoxShape.rectangle,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20))),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                  ],
                                ),
                              ),
                            );
                          })
            ],
          ),
        ));
  }
}
