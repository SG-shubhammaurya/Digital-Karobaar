import 'dart:async';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:digitalkarobaar/src/bloc/cart/cart_cubit.dart';
import 'package:digitalkarobaar/src/bloc/theme/theme_cubit.dart';
import 'package:digitalkarobaar/src/bloc/theme/theme_state.dart';
import 'package:digitalkarobaar/src/core/utils/constants/language_keys.dart';
import 'package:digitalkarobaar/src/core/widget/common_icon_button.dart';
import 'package:digitalkarobaar/src/models/ads_seller.dart';
import 'package:digitalkarobaar/src/models/categories.dart';
import 'package:digitalkarobaar/src/models/home_adverties.dart';
import 'package:digitalkarobaar/src/models/home_image.dart';
import 'package:digitalkarobaar/src/models/user_profile.dart';
import 'package:digitalkarobaar/src/repository/home_repository.dart';
import 'package:digitalkarobaar/src/res/app_colors.dart';
import 'package:digitalkarobaar/src/route/router_name.dart';
import 'package:digitalkarobaar/src/ui/home/InAppNotification/Product_notification.dart';
import 'package:digitalkarobaar/src/ui/home/InAppNotification/notification.dart';
// import 'package:digitalkarobaar/src/ui/home/notification.dart';
import 'package:flutter/material.dart';
import 'package:digitalkarobaar/src/core/utils/constants/common.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../models/home_image.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPage = 0;
  PageController _pageController = PageController(
    initialPage: 0,
  );
  List<Categories> categories;
  bool isLoading = true;
  bool isUserProfileLoading = true;
  UserProfile userProfile;
  bool selected = false;
  bool doNotDisturb = false;
  @override
  void initState() {
    _getAdvertisment();
    _getAds();
    _getCategories();
    _getUserProfile();
    _getImages();
    _getCartItems();
    super.initState();

    Timer.periodic(Duration(seconds: 2), (Timer timer) {
      if (_currentPage < 6) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  HomeAdvertisment homeAdvertisment;
  bool isLoadingImage = true;
  _getAdvertisment() async {
    try {
      var advertise = await HomeReposiitory.getAdvertisment();
      setState(() {
        homeAdvertisment = advertise;
         if (homeAdvertisment != null){

          isLoadingImage = false;

        }
      });
    } catch (e) {}
  }

  //List<HomeImages> imageHome = [];
  bool isLoadingRecomendedImage = true;
  List<HomeImages> imageHome;
  _getImages() async {
    var imagesList = await HomeReposiitory.getImages();
    setState(() {
      imageHome = imagesList;
      print(imageHome[0].id);
      if(imageHome != null){
        isLoadingRecomendedImage = false;
      }
    });
  }

  List<DataAds> adsList = [];
  _getAds() async {
    var ads = await HomeReposiitory.getAdsSeller();
    adsList = ads;
  }

  CartCubit cartCubit;
  _getCartItems() async {
    cartCubit = await BlocProvider.of<CartCubit>(context).getCartItems(context);
  }

  final controller = PageController(viewportFraction: 0.8);

  _getUserProfile() async {
    var profile = await HomeReposiitory.getProfileInfo();
    setState(() {
      userProfile = profile;
      if (userProfile != null) {
        isUserProfileLoading = false;
      }
    });
  }

  _getCategories() async {
    var categoriesList = await HomeReposiitory.getCategories();
    setState(() {
      categories = categoriesList;

      if (categories != null) {
        isLoading = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          leading: Builder(
            builder: (context) => IconButton(
              color: Colors.white,
              icon: SvgPicture.asset(
                'assets/icons/menu.svg',
                color: Colors.white,
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            ),
          ),
          title: Container(
            height: 32,
            decoration: BoxDecoration(
                color: Colors.black12, borderRadius: BorderRadius.circular(12)),
            child: TextField(
                onTap: () {
                  Navigator.pushNamed(context, RouterName.searchPage);
                },
                readOnly: true,
                decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.search,
                      size: 18,
                      color: Colors.white,
                    ),
                    hintText: " Search",
                    border: InputBorder.none,
                    hintStyle: TextStyle(fontSize: 14, color: Colors.white))),
          ),
          actions: <Widget>[
            CommonIconButton(
              onPressed: () {
                Navigator.pushNamed(context, RouterName.cartScreen);
              },
            )
          ],
        ),
      ),
      drawer: _buildDrawer(),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView(
              shrinkWrap: true,
              children: <Widget>[
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      //borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1.0, color: Colors.blue),
                      //color: Colors.white
                    ),
                    height: 65,
                    width: MediaQuery.of(context).size.width,
                    child: Row(children: [
                      Container(
                          height: 65,
                          width: 70,
                          color: AppColors.primaryColor,
                          child: Icon(Icons.location_on)),
                      SizedBox(width: 10),
                      Container(
                        child: Column(children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 8.0, top: 8.0, right: 60),
                            child: Container(
                                child: Text("Deliver To:",
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold))),
                          ),
                          Row(
                            children: [
                              Padding(
                                  padding: const EdgeInsets.only(
                                    left: 8.0,
                                  ),
                                  child: Container(
                                    child: isUserProfileLoading
                                        ? Center(
                                            child: CircularProgressIndicator(),
                                          )
                                        : Row(
                                            children: [
                                              Text('${userProfile.name}' ?? ''),
                                              Text('${userProfile.pinCode}' ??
                                                  ''),
                                            ],
                                          ),
                                  )),
                            ],
                          ),
                        ]),
                      )
                    ]),
                  ),
                ),
                Stack(
                  fit: StackFit.loose,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 180,
                        child: PageView(
                          controller: _pageController,
                          children: List.generate(
                            adsList.length,
                            (i) => InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, RouterName.sellerShop,
                                    arguments: adsList[i].seller);
                              },
                              child: SizedBox(
                                child: CachedNetworkImage(
                                  imageUrl: adsList[i].pic,
                                  placeholder: (context, url) => Center(
                                      child: CircularProgressIndicator()),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.broken_image),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 30,
                      left: 110,
                      child: SmoothPageIndicator(
                          controller: _pageController, // PageController
                          count: adsList.length ?? 0,
                          effect: ExpandingDotsEffect(
                              activeDotColor: Color(0xffffa726),
                              dotColor: Colors.grey,
                              radius: 10,
                              dotWidth: 10,
                              dotHeight: 10), // your preferred effect
                          onDotClicked: (index) {}),
                    ),
                  ],
                ),
                Divider(color: Colors.grey),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: Text(
                        "Categories",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15.0),
                      ),
                    ),
                    SizedBox(width: 200),
                  ],
                ),

                GridView.count(
                  primary: false,
                  padding: const EdgeInsets.all(10),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  children:
                      List<Widget>.generate(categories.length, (index) {
                    return _buildCategories(
                        categories[index].title, categories[index].image);
                  }).toList(),
                ),
                Divider(color: Colors.grey),


                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RouterName.sellerShop,
                        arguments: homeAdvertisment.data.seller
                      );
                         
                    },
                    child: Container(
                          decoration: BoxDecoration(
                                //color: Colors.blue,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        child: isLoadingImage
                        ?Center(
                          child: CircularProgressIndicator(),
                        ):
                        Image.network(
                          homeAdvertisment.data.pic,fit: BoxFit.fill,
                        )
                      ),
                  ),
                ),




                Divider(),



                Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            "Recommended Sellers",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 10),

                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [

                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, RouterName.recomendedSeller);
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                //color: Colors.blue,
                                borderRadius: BorderRadius.circular(10.0),
                              ),

                                child: ListView.builder(
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemCount: imageHome.length,
                                    itemBuilder: (c, index) {
                                      return CachedNetworkImage(
                                        imageUrl: imageHome[index].image1,
                                        fit: BoxFit.cover,
                                        height: 200,
                                        placeholder: (_, s) {
                                          return Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        },
                                      );
                                    }),
                                
                                height: 200,
                                width: 250,
                                //width: MediaQuery.of(context).size.width / 2,
                              ),
                            ),
                            SizedBox(width: 20),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, RouterName.recomendedSeller);
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                //color: Colors.blue,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                                height: 200,
                                width:  400,
                               // width: MediaQuery.of(context).size.width,

                                child: ListView.builder(
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemCount: imageHome.length,
                                    itemBuilder: (c, index) {
                                      return CachedNetworkImage(
                                        imageUrl: imageHome[index].image0,
                                        fit: BoxFit.cover,
                                        height: 200,
                                        placeholder: (_, s) {
                                          return Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        },
                                      );
                                    }),
                              ),
                            ),
                          ],

                        ),

                      ),
                    ),





                    
                    // Row(
                    //   children: [
                    //     Expanded(
                    //         child: Padding(
                    //       padding: const EdgeInsets.only(left: 10.0),
                    //       child: GestureDetector(
                    //         onTap: () {
                    //           Navigator.pushNamed(
                    //               context, RouterName.recomendedSeller);
                    //         },
                    //         child: Container(
                    //            decoration: BoxDecoration(
                    //             color: Colors.blue,
                    //             borderRadius: BorderRadius.circular(10.0),
                    //           ),

                    //           child: ListView.builder(
                    //               physics: const NeverScrollableScrollPhysics(),
                    //               itemCount: imageHome.length,
                    //               itemBuilder: (c, index) {
                    //                 return CachedNetworkImage(
                    //                   imageUrl: imageHome[index].image1,
                    //                   fit: BoxFit.cover,
                    //                   height: 200,
                    //                   placeholder: (_, s) {
                    //                     return Center(
                    //                       child: CircularProgressIndicator(),
                    //                     );
                    //                   },
                    //                 );
                    //               }),
                              
                    //           height: 200,
                    //           width: MediaQuery.of(context).size.width / 2,
                    //         ),
                    //       ),
                    //     )),
                    //     SizedBox(width: 10.0),
                    //     Expanded(
                    //         child: Padding(
                    //       padding: const EdgeInsets.only(right: 10.0),
                    //       child: GestureDetector(
                    //         onTap: () {
                    //           Navigator.pushNamed(
                    //               context, RouterName.recomendedSeller);
                    //         },
                    //         child: Container(
                    //           decoration: BoxDecoration(
                    //             color: Colors.blue,
                    //             borderRadius: BorderRadius.circular(10.0),
                    //           ),
                    //           height: 200,
                    //           width: MediaQuery.of(context).size.width,

                    //           child: ListView.builder(
                    //               physics: const NeverScrollableScrollPhysics(),
                    //               itemCount: imageHome.length,
                    //               itemBuilder: (c, index) {
                    //                 return CachedNetworkImage(
                    //                   imageUrl: imageHome[index].image0,
                    //                   fit: BoxFit.cover,
                    //                   height: 200,
                    //                   placeholder: (_, s) {
                    //                     return Center(
                    //                       child: CircularProgressIndicator(),
                    //                     );
                    //                   },
                    //                 );
                    //               }),
                    //         ),
                    //       ),
                    //     )),
                    //   ],
                    // ),



                    
                  ],
                ),
                SizedBox(height: 5),



                 Divider(),


                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RouterName.sellerShop,
                        arguments: homeAdvertisment.x.seller
                      );
                         
                    },
                    child: Container(
                        decoration: BoxDecoration(
                           //  color: Colors.blue,
                            borderRadius: BorderRadius.circular(10)),
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        child: isLoadingImage
                        ?Center(
                          child: CircularProgressIndicator(),
                        ):
                        Image.network(
                          homeAdvertisment.x.pic,fit: BoxFit.fill,
                        )
                      ),
                  ),
                ),
                 Divider(),

                Column(
                  children: [
                     Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            "Best Seller",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        )
                      ],
                    ),
                   
                    Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RouterName.sellerShop,
                        arguments: homeAdvertisment.y.seller
                      );
                         
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            // color: Colors.blue,
                            borderRadius: BorderRadius.circular(10)),
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        child: isLoadingImage
                        ?Center(
                          child: CircularProgressIndicator(),
                        ):
                        Image.network(
                          homeAdvertisment.y.pic,fit: BoxFit.fill,
                        )
                      ),
                  ),
                ),



                  ],
                ),


                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      //Add operation
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1.0, color: Colors.blue),
                      ),
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(children: [
                          Icon(Icons.error_outline),
                          SizedBox(width: 10.0),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                      "Buy more products from here and get reduce",
                                      style: TextStyle(fontSize: 10)),
                                ],
                              ),
                              Row(
                                children: [
                                  Text("Product prises and delivery charges",
                                      style: TextStyle(fontSize: 10)),
                                ],
                              )
                            ],
                          )
                        ]),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left:10,right:10),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, RouterName.allProducts);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.primaryColor,
                          ),
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                            child: Text(
                              'Show all Products',
                              style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.w600, fontSize: 14),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height:20)
              ],
            ),
    ));
  }

  _buildCategories(String name, String image) {
    return Card(
      // decoration: BoxDecoration(
      //   border: Border.all(width: 1,color: Colors.black12)
      // ),
      // height: 80,
      // width: 90,

      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, RouterName.subCategories,
                  arguments: name);
            },
            child: Container(
              height: 120,
              width: 100,
              child: Image.network(image),
            ),
          ),
          SizedBox(height: 5),
          name != null                                                                                                       
              ? Text(
                  name,
                  //style: TextStyle(fontWeight: FontWeight.bold),
                  style: GoogleFonts.poppins(fontSize: 15.5),
                )
              : Text('')
        ],
      ),
    );
  }

  _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(height: 5),
          isUserProfileLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListTile(
                  leading: CircleAvatar(),
                  title: Text('${userProfile.name}' ?? ''),
                  subtitle: Text('+91-${userProfile.phoneNo}' ?? ""),
                  trailing: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, RouterName.userAccount);
                      },
                      child: Icon(Icons.keyboard_arrow_right)),
                ),
          Divider(color: Colors.black),
          BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, themeState) => SwitchListTile(
              onChanged: (bool enabled) =>
                  context.bloc<ThemeCubit>().changeTheme(
                        themeState.themeMode != ThemeMode.dark,
                      ),
              value: themeState.themeMode == ThemeMode.dark,
              title: Text(
                "Theme",
              ),
            ),
          ),
          InkWell(
              onTap: () {
                Navigator.pushNamed(context, RouterName.yourOrder);
              },
              child: ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('Your Orders'),
              )),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, RouterName.getUserreturn);
            },
            child: ListTile(
              leading: Icon(Icons.settings),
              title: Text('Your Returns'),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, RouterName.favourites);
            },
            child: ListTile(
              leading: Icon(Icons.favorite),
              title: Text('My favourites'),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, RouterName.notification);
            },
            child: ListTile(
              leading: Icon(Icons.notifications),
              title: Text('My Notifications'),
            ),
          ),
          ListTile(
            leading: Icon(Icons.language),
            title: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RouterName.selectLanguage);
                },
                child: Text(LanguageKeys.language.translate(context))),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, RouterName.rateCard);
            },
            child: ListTile(
              leading: Icon(Icons.credit_card),
              title: Text('Rate Card'),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, RouterName.sellOnKarobaar);
            },
            child: ListTile(
              leading: Icon(Icons.shop),
              title: Text('Sell on Digital Karobaar'),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, RouterName.termOfUse);
            },
            child: ListTile(
              leading: Icon(Icons.text_format),
              title: Text('Terms Of Use'),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, RouterName.support);
            },
            child: ListTile(
              leading: Icon(Icons.call),
              title: Text('Support'),
            ),
          ),
          
           InkWell(
             
            onTap: () {
               Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AppNotification()),
              );
            //  Navigator.pushNamed(context, RouterName.notificationPart);
            },
            child: ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notifications'),
            ),
          ),
          SwitchListTile(
            onChanged: (val) {
              setState(() {
                doNotDisturb = val;
              });
            },
            title: Text('Do Not Disturb'),
            value: doNotDisturb,
          ),
          Container(
            child: ListTile(
              selected: selected,
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              onTap: () {
                _showAlertDialog();
              },
            ),
          ),
          Center(child: Text('App Version'))
        ],
      ),
    );
  }

  _showAlertDialog() async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text("Are you sure do you want to logout now?"),
            actions: <Widget>[
              Row(children: <Widget>[
                GestureDetector(
                  onTap: () {
                    //Add operation
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xffffa726),
                    ),
                    child: Center(child: Text("No")),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () {
                    logout();
                  },
                  child: Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xffffa726),
                    ),
                    child: Center(child: Text("Yes")),
                  ),
                )
              ])
            ],
          );
        });
  }

  logout() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove('accessToken');

    Navigator.pushNamedAndRemoveUntil(
        context, RouterName.otp, ModalRoute.withName("/"));
  }
}
