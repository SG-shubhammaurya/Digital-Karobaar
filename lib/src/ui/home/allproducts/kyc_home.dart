import 'package:cached_network_image/cached_network_image.dart';
import 'package:digitalkarobaar/src/core/utils/constants/language_keys.dart';
import 'package:digitalkarobaar/src/core/widget/common_icon_button.dart';
import 'package:digitalkarobaar/src/models/ads_seller.dart';
import 'package:digitalkarobaar/src/models/categories.dart';
import 'package:digitalkarobaar/src/models/kyc_add_page.dart';
import 'package:digitalkarobaar/src/models/new_arrival.dart';
import 'package:digitalkarobaar/src/models/products.dart';
import 'package:digitalkarobaar/src/models/top_brands.dart';

import 'package:digitalkarobaar/src/models/user_profile.dart';
import 'package:digitalkarobaar/src/repository/home_repository.dart';
import 'package:digitalkarobaar/src/repository/product_repository.dart';
import 'package:digitalkarobaar/src/res/app_colors.dart';
import 'package:digitalkarobaar/src/route/router_name.dart';
import 'package:flutter/material.dart';
import 'package:digitalkarobaar/src/core/utils/constants/common.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../repository/home_repository.dart';

class KycHome extends StatefulWidget {
  final id;
  const KycHome(this.id);
  @override
  _KycHomeState createState() => _KycHomeState();
}

class _KycHomeState extends State<KycHome> {
  PageController _pageController = PageController(
    initialPage: 0,
  );
  bool selected = false;
  // TopProducts topProducts;
  List<NewArrival> newArrival = [];
  List<TopBrands> topBrands = [];
  List<Products> topProduts = [];
//  TopProducts topCategories;
  List<Categories> topCategories = [];
  bool isLoading = true;
  bool isUserProfileLoading = true;
  UserProfile userProfile;
  @override
  void initState() {
    _getTopBrands();
    _getCrouselAds();
    _getNewArrival();
    _getAdvertisment();
    _getUserProfile();
    super.initState();
  }

  KycPageAdd kycPageAdd;
  bool isLoadingImage = true;

  _getAdvertisment() async {
    try {
      var advertisement = await HomeReposiitory.getKycAdvertisment();
      setState(() {
        kycPageAdd = advertisement;
        if (kycPageAdd != null) {
          isLoadingImage = false;
        }
      });
    } catch (e) {}
  }

  _getUserProfile() async {
    var profile = await HomeReposiitory.getProfileInfo();
    setState(() {
      userProfile = profile;
      if (userProfile != null) {
        isUserProfileLoading = false;
      }
    });
  }

  _getNewArrival() async {
    await ProductRepository.getNewArrival().then((arrival) {
      if (arrival != null) {
        newArrival = arrival;
      }
      setState(() {});
    });
  }

  _getTopBrands() async {
    await ProductRepository.getTopBrands(widget.id).then((brands) {
      if (brands != null) {
        topBrands = brands;
      }
      //_getTopCategories();
    });
    setState(() {
      isLoading = false;
    });
  }

  List<DataAds> adsList = [];

  _getCrouselAds() async {
    var ads = await HomeReposiitory.getAdsSeller();
    adsList = ads;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    hintText: LanguageKeys.search.translate(context),
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          shrinkWrap: true,
          children: [
            adsList.length == 0
                ? Center(
                    child: CircularProgressIndicator(
                    backgroundColor: AppColors.primaryColor,
                  ))
                : Stack(
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
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context, RouterName.sellerShop,
                    arguments: kycPageAdd.data.seller,
                    //arguments: homeAdvertisment.data.seller
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
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : Image.network(
                            kycPageAdd.data.pic,
                            fit: BoxFit.fill,
                          )),
              ),
            ),
            !isLoading
                ? SizedBox() //_buildProductsList()
                : Center(child: CircularProgressIndicator()),
            Divider(),
            SizedBox(height: 10),
            // LanguageKeys.topBrand.translate(context)
            Text(
              LanguageKeys.topBrand.translate(context),
              style: GoogleFonts.openSans(
                  fontWeight: FontWeight.w600, fontSize: 14),
            ),
            !isLoading
                ? Container(
                    height: 150,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: topBrands.length,
                        scrollDirection: Axis.horizontal,
                        primary: false,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                // Navigator.pushNamed(context, RouterName.productDetails,arguments: topBrands[index].title);
                                Navigator.pushNamed(
                                    context, RouterName.productPage,
                                    arguments: topBrands[index].title);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          offset: Offset(5, 5),
                                          blurRadius: 10,
                                          color: Color(0xFFE9E9E9))
                                    ],
                                    borderRadius: BorderRadius.circular(15)),
                                child: Column(
                                  children: [
                                    SizedBox(height: 10),
                                    SizedBox(
                                      height: 80,
                                      width: 100,
                                      child: CachedNetworkImage(
                                        imageUrl: topBrands[index].image,
                                        fit: BoxFit.cover,
                                        
                                        placeholder: (context, url) => Center(
                                            child: CircularProgressIndicator()),
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.broken_image),
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(topBrands[index].title,
                                        style:
                                            GoogleFonts.poppins(fontSize: 12)),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  )
                : Center(child: CircularProgressIndicator()),
            Divider(),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context, RouterName.sellerShop,
                    arguments: kycPageAdd.x.seller,
                    //arguments: homeAdvertisment.data.seller
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
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : Image.network(
                            kycPageAdd.x.pic,
                            fit: BoxFit.fill,
                          )),
              ),
            ),
            Divider(), Text(LanguageKeys.newArrival.translate(context)),
            !isLoading
                ? Container(
                    height: 140,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: newArrival.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, RouterName.productPage,
                                      arguments: newArrival[index].title);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          offset: Offset(5, 5),
                                          blurRadius: 10,
                                          color: Color(0xFFE9E9E9)
                                              .withOpacity(0.56),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Column(children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      height: 80,
                                      width: 100,
                                      child: CachedNetworkImage(
                                        imageUrl: newArrival[index].image1,
                                        fit: BoxFit.cover,
                                        placeholder: (context, url) => Center(
                                            child: CircularProgressIndicator()),
                                        errorWidget: (context, url, error) =>
                                            Icon(
                                          Icons.broken_image,
                                          color: Colors.black26,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(newArrival[index].title,
                                        style:
                                            GoogleFonts.poppins(fontSize: 12)),
                                    SizedBox(height: 2),
                                  ]),
                                )),
                          );
                        }))
                : Center(child: CircularProgressIndicator()),
            Divider(color: Colors.grey[300], thickness: 5),

            Divider(),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context, RouterName.sellerShop,
                    arguments: kycPageAdd.y.seller,
                    //arguments: homeAdvertisment.data.seller
                  );
                },
                child: Container(
                    decoration: BoxDecoration(
                      //color: Colors.blue,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    height: 150,
                    width: 80,
                    child: isLoadingImage
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : Image.network(
                            kycPageAdd.y.pic,
                            fit: BoxFit.fill,
                          )),
              ),
            ),
            Divider(),
            //Divider(),

            isLoadingImage
                ? Center(
                    child: SizedBox(),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context, RouterName.sellerShop,
                          arguments: kycPageAdd.z.seller,
                          //arguments: homeAdvertisment.data.seller
                        );
                      },
                      child: Container(
                          decoration: BoxDecoration(
                            //color: Colors.blue,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          height: 150,
                          width: 120,
                          child: Image.network(
                            kycPageAdd.z.pic,
                            fit: BoxFit.fill,
                          )),
                    ),
                  ),
            Divider(),

            SizedBox(height: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RouterName.allProducts);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.primaryColor,
                      ),
                      height: 30,
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: Text(
                          LanguageKeys.showAllProducts.translate(context),
                          style: GoogleFonts.openSans(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(height: 30),
          isUserProfileLoading
          ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListTile(
                  leading: userProfile.profilePic != null
                      ? CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(userProfile.profilePic),
                        )
                      : Text("upload pic"),
                  title: Text('${userProfile.name}' ?? ''),
                  subtitle: Text('+91-${userProfile.phoneNo}' ?? ""),
                  trailing: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, RouterName.userAccount);
                      },
                      child: Icon(Icons.keyboard_arrow_right)),
                ),
              // ? Center(
              //     child: CircularProgressIndicator(),
              //   )
              // : ListTile(
              //     leading: CircleAvatar(),
              //     title: Text('${userProfile.name}' ?? ''),
              //     subtitle: Text('+91-${userProfile.phoneNo}' ?? ""),
              //     trailing: InkWell(
              //         onTap: () {
              //             Navigator.pushNamed(context, RouterName.userAccount);
              //         },
              //         child: Icon(Icons.keyboard_arrow_right)),
              //   ),
          Divider(color: Colors.black),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, RouterName.mainPage);
            },
            child: ListTile(
              leading: Icon(Icons.home),
              title: Text(LanguageKeys.home.translate(context)),
            ),
          ),
          InkWell(
              onTap: () {
                Navigator.pushNamed(context, RouterName.yourOrder);
              },
              child: ListTile(
                leading: Icon(Icons.account_circle),
                title: Text(LanguageKeys.yourOrders.translate(context)),
              )),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, RouterName.getUserreturn);
            },
            child: ListTile(
              leading: Icon(Icons.settings),
              title: Text(LanguageKeys.yourReturns.translate(context)),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, RouterName.favourites);
            },
            child: ListTile(
              leading: Icon(Icons.favorite),
              title: Text(LanguageKeys.myFavourites.translate(context)),
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
          // InkWell(
          //   onTap: () {
          //     Navigator.pushNamed(context, RouterName.rateCard);
          //   },
          //   child: ListTile(
          //     leading: Icon(Icons.credit_card),
          //     title: Text('Rate Card'),
          //   ),
          // ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, RouterName.sellOnKarobaar);
            },
            child: ListTile(
              leading: Icon(Icons.shop),
              title: Text(LanguageKeys.sellOnDigialKarobaar.translate(context)),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, RouterName.termOfUse);
            },
            child: ListTile(
              leading: Icon(Icons.text_format),
              title: Text(LanguageKeys.termOfUse.translate(context)),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, RouterName.support);
            },
            child: ListTile(
                leading: Icon(Icons.call),
                title: Text(LanguageKeys.support.translate(context))),
          ),
          Container(
            child: ListTile(
              selected: selected,
              leading: Icon(Icons.exit_to_app),
              title: Text(LanguageKeys.logOut.translate(context)),
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
