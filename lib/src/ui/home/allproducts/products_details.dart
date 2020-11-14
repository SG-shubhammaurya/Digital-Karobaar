import 'package:cached_network_image/cached_network_image.dart';
import 'package:digitalkarobaar/src/bloc/cart/cart_cubit.dart';
import 'package:digitalkarobaar/src/bloc/cart/cart_state.dart';
import 'package:digitalkarobaar/src/core/provider/cart_provider.dart';
import 'package:digitalkarobaar/src/core/widget/common_button.dart';
import 'package:digitalkarobaar/src/core/widget/common_icon_button.dart';
import 'package:digitalkarobaar/src/models/product_spec.dart';
import 'package:digitalkarobaar/src/models/products.dart';
import 'package:digitalkarobaar/src/repository/home_repository.dart';
import 'package:digitalkarobaar/src/repository/product_repository.dart';
import 'package:digitalkarobaar/src/res/app_colors.dart';
import 'package:digitalkarobaar/src/route/router_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetails extends StatefulWidget {
  final id;

  const ProductDetails(this.id);
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  var rating = 3.0;
  bool isLoading = true;
  final pageController = PageController(viewportFraction: 1);
  bool favourite = false;
  CartCubit cartCubit;
  @override
  void initState() {
    _getProductsById();
    _getUserProfile();

    cartCubit = BlocProvider.of<CartCubit>(context);
    super.initState();
  }
  _getUserProfile() async {
    await HomeReposiitory.getProfileInfo().then((userProfile) {
      if (userProfile != null) {
        //userProfile = profile;
        _getFavorite(userProfile.id);
      }
    });
  }

  Products productDetails;

  _getFavorite(int userid) async {
    await ProductRepository.getFavorite(userid).then((value) {
      if (value != null) {
        final v = value.any((element) => element.id == widget.id);

        setState(() {
          favourite = v;
        });
      }
    });
  }

  Specification specifications;
  _getProductsById() async {
    specifications = Specification();
    final getProductDetails =
        await HomeReposiitory.getProductsDetails(widget.id);

    if (getProductDetails != null) {
      final specification =
          await HomeReposiitory.getProductsSpecification(widget.id);
      setState(() {
        productDetails = getProductDetails;
        specifications = specification;
        isLoading = false;
      });
    }
  }

  final titleStyle =
      GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500);
  final subtitleStyle = GoogleFonts.openSans(
    fontSize: 12,
  );
  final choices = ["My Favorites", "Search", "Home"];
  @override
  Widget build(BuildContext context) {
    final cartItems = Provider.of<CartDetailProvider>(context);
    return Scaffold(
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : buildbody(cartItems));
  }

  buildbody(CartDetailProvider cartItems) {
    print(  productDetails);
    return SafeArea(
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxScrolled) {
          return <Widget>[
            SliverAppBar(
              actions: [
                InkWell(
                    onTap: () {
                      setState(() {
                        favourite = !favourite;
                      });
                      _handleFavorite(favourite);
                    },
                    child: favourite
                        ? CircleAvatar(
                            backgroundColor: Colors.black12,
                            child: Icon(
                              Icons.favorite,
                              size: 20,
                              color: Colors.red,
                            ),
                          )
                        : CircleAvatar(
                            backgroundColor: Colors.black12,
                            child: Icon(
                              Icons.favorite_border,
                              color: AppColors.primaryColor,
                              size: 20,
                            ))),
                CircleAvatar(
                    backgroundColor: Colors.black12,
                    radius: 18,
                    child: InkWell(
                        onTap: () {
                          _shareProducts();
                        },
                        child: Icon(
                          Icons.share,
                          color: AppColors.primaryColor,
                        ))),
                CommonIconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RouterName.cartScreen);
                  },
                ),
                PopupMenuButton<String>(
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  onSelected: (v) {
                    switch (v) {
                      case 'My Favorites':
                        Navigator.pushNamed(context, RouterName.favourites);
                        break;
                      case 'Search':
                        Navigator.pushNamed(context, RouterName.searchPage);
                        break;
                      case 'Home':
                        Navigator.pushNamed(context, RouterName.mainPage);
                        break;
                      default:
                    }
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
                )
              ],
              backgroundColor: Colors.transparent,
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(fit: StackFit.loose, children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 180,
                      child: PageView(controller: pageController, children: [
                         _buildImageLis(productDetails.image1),
                         _buildImageLis(productDetails.image2),
                        _buildImageLis(productDetails.image3),
                        _buildImageLis(productDetails.image4),
                        _buildImageLis(productDetails.image5),
                      ]),
                    ),
                  ),
                  Positioned(
                    bottom: 30,
                    left: 110,
                    child: SmoothPageIndicator(
                        controller: pageController, // PageController
                        count: 5,
                        effect: ExpandingDotsEffect(
                            activeDotColor: Color(0xffffa726),
                            dotColor: Colors.grey,
                            radius: 10,
                            dotWidth: 10,
                            dotHeight: 10), // your preferred effect
                        onDotClicked: (index) {}),
                  )
                ]),
              ),
            )
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(productDetails.title,
                              style: GoogleFonts.openSans(
                                  color: Color(0xff212121),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800)),

                          // SmoothStarRating(
                          //     allowHalfRating: true,
                          //     onRated: (v) {
                          //       setState(() {
                          //         rating = v;
                          //       });
                          //     },
                          //     starCount: 5,
                          //     rating: rating,
                          //     size: 10.0,
                          //     color: Colors.amber,
                          //     borderColor: Colors.amber,
                          //     spacing: 0.0),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            ' Sold By : ',
                            style: subtitleStyle,
                          ),
                          Text(
                            productDetails.brand,
                            style: GoogleFonts.openSans(fontSize: 12),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Price After Discount :',
                            style: subtitleStyle,
                          ),
                          Text(
                            '\u20B9 ${productDetails.discount}',
                            style: GoogleFonts.openSans(
                                fontSize: 20,
                                color: Color(0xff0039cb),
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Center(
                        child: _getgetGstBenefit(productDetails.discount, productDetails.gst),
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   children: [
                      //     _getgetGstBenefit(
                      //         productDetails.discount, productDetails.gst),
                      //   ],
                      // ),
                      const SizedBox(height: 10),
                      Container(
                        padding: EdgeInsets.all(5),
                        color: Color(0xffffcc80),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const SizedBox(width: 10),
                            Text(
                              "MRP :\u20B9",
                              style: GoogleFonts.openSans(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '${productDetails.prize}',
                              style: GoogleFonts.openSans(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            Text(
                              'Retail Margin: ',
                              style: subtitleStyle,
                            ),
                            Text('% ${productDetails.retail}'),
                            const SizedBox(width: 20)
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Delivery: ',
                            style: subtitleStyle,
                          ),
                          Text('\u20B9 ${productDetails.delivery}'),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Text("Min Order:",
                              style: GoogleFonts.openSans(
                                fontSize: 12,
                              )),
                          SizedBox(width: 10),
                          Text(" ${productDetails.minBuy}", style: GoogleFonts.openSans(fontSize: 12))
                        ],
                      ),
                      const SizedBox(height: 10),
                      Column(
                        children: [
                          Text("Description :",
                              style: GoogleFonts.openSans(
                                fontSize: 12,
                              )),
                          SizedBox(width: 10),
                          Text(productDetails.description,
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                              )),
                        ],
                      ),
                      const SizedBox(height: 5),
                    ],
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Supplier Profile: ',
                            style: GoogleFonts.poppins(
                                color: Color(0xff212121), fontSize: 15),
                          ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, RouterName.sellerShop,
                              arguments: productDetails.sellerId);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              productDetails.shop,
                              style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              height: 25,
                              width: 60,
                              child: Center(
                                  child: Text('View',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: AppColors.primaryColor))),
                              decoration: BoxDecoration(
                                  color: Colors.orange[200],
                                  shape: BoxShape.rectangle,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Card(
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(color: Colors.orange[200]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Digital Karobaar Specials',
                        style: GoogleFonts.poppins(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Container(
                              child: Image.asset(
                            'assets/icons/vaypar.png',
                            width: 20,
                            height: 20,
                          )),
                          Text(
                            "Vypar Suraksha",
                            style: TextStyle(fontSize: 12),
                          ),
                          SizedBox(width: 20),
                          Icon(Icons.group_work, size: 10),
                          Text("Verified Supplier",
                              style: TextStyle(fontSize: 12))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Specification",
                            style: GoogleFonts.poppins(
                                color: Color(0xff212121), fontSize: 15),
                          ),
                        ],
                      ),

                      // Text("highlights:", style: titleStyle),

                      // Text( specifications.highlights[0].toString()),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          columns: const <DataColumn>[
                            DataColumn(
                              label: Text(
                                'Property',
                                style: TextStyle(fontStyle: FontStyle.italic),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                '',
                                style: TextStyle(fontStyle: FontStyle.italic),
                              ),
                            ),
                          ],
                          rows: <DataRow>[
                             specifications.highlights.length != 0
                                ? DataRow(
                                    cells: <DataCell>[
                                      DataCell(Text(
                                          specifications.highlights[0].title)),
                                      DataCell(Text(specifications
                                          .highlights[0].description)),
                                    ],
                                  )
                                : DataRow(
                                    cells: <DataCell>[
                                      DataCell(Text('No Available')),
                                      DataCell(Text('No Available')),
                                    ],
                                  ),
                            specifications.highlights.length != 0
                                ? DataRow(
                                    cells: <DataCell>[
                                      DataCell(Text(
                                          specifications.highlights[1].title)),
                                      DataCell(Text(specifications
                                          .highlights[1].description)),
                                    ],
                                  )
                                : DataRow(
                                    cells: <DataCell>[
                                      DataCell(Text('No Available')),
                                      DataCell(Text('No Available')),
                                    ],
                                  ),
                            specifications.features.length != 0
                                ? DataRow(
                                    cells: <DataCell>[
                                      DataCell(Text(
                                          specifications.features[0].title)),
                                      DataCell(Text(specifications
                                          .features[0].description)),
                                    ],
                                  )
                                : DataRow(
                                    cells: <DataCell>[
                                      DataCell(Text('No Available')),
                                      DataCell(Text('No Available')),
                                    ],
                                  ),
                            specifications.features.length != 0
                                ? DataRow(
                                    cells: <DataCell>[
                                      DataCell(Text(
                                          specifications.features[1].title)),
                                      DataCell(Text(specifications
                                          .features[1].description)),
                                    ],
                                  )
                                : DataRow(
                                    cells: <DataCell>[
                                      DataCell(Text('No Available')),
                                      DataCell(Text('No Available')),
                                    ],
                                  ),
                            specifications.specs.length != 0
                                ? DataRow(
                                    cells: <DataCell>[
                                      DataCell(Text(
                                          specifications.specs[0].title ?? '')),
                                      DataCell(Text(
                                          specifications.specs[0].description ??
                                              '')),
                                    ],
                                  )
                                : DataRow(
                                    cells: <DataCell>[
                                      DataCell(Text('No Available')),
                                      DataCell(Text('No Available')),
                                    ],
                                  )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                child: Container(
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.black12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Recommendation by supplier", style: titleStyle),
                      Text("Abc", style: titleStyle),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: Colors.orange[200],
                        onPressed: () {
                          Navigator.pushNamed(context, RouterName.messanger);
                        },
                        child: Text(
                          'Chat Now',
                          style: TextStyle(color: AppColors.primaryColor),
                        )),
                    BlocBuilder<CartCubit, CartState>(builder: (c, s) {
                      if (s is LoadingCart) {
                        return CircularProgressIndicator();
                      }
                      return CommonButton(
                        buttonColor: AppColors.primaryColor,
                        width: 150,
                        title: 'Buy',
                        onTap: ()  {
                        cartCubit.addToCart(productDetails.id.toString());
                     
  
                      //  cartCubit.getCartItems(context);
  

                          // cartItems.addItems(data);
                          // cartItems.setCardItems(productDetails.id.toString(),productDetails.title,productDetails.prize.toDouble(),productDetails.image1);
                          // _checkKycUpload(cartItems);
                        },
                      );
                    })
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _checkKycUpload(CartDetailProvider cartItems) {
    HomeReposiitory.getKyc().then((value) {
      if (value == "verified") {
        // cartItems.setCardItems(productDetails.id);
      } else {
        Navigator.pushNamed(context, RouterName.shopkyc);
      }
    }).catchError(() {});
  }

  void _shareProducts() async {
    await Share.share('check out my website https://example.com');
  }

  _handleFavorite(bool favourite) {
    print(favourite);

    if (favourite) {
      ProductRepository.postFavorite(widget.id);
    } else {
      ProductRepository.removeFavorite(widget.id);
    }
  }

  _getgetGstBenefit(int discount, gst) {
    var discountGst = discount * gst / 100;
    var price = discount - discountGst;
    if (gst != null && discount != null) {
      return Text('\u20B9 $price + \u20B9 $discountGst ($gst% GST Benefit)');
    } else {
      return Text('\u20B9 $price + \u20B9 (gst% GST Benefit)');
    }
  }
}

_buildImageLis(String path) {
  if (path != null) {
    return Container(
      color: Colors.black12,
      child: CachedNetworkImage(
        imageUrl: path,
        colorBlendMode: BlendMode.darken,
        errorWidget: (context, url, error) => Image.network(
          'https://azadchaiwala.pk/getImage?i=&t=course',
        ),
      ),
    );
  } else {
    return Image.network(
      'https://azadchaiwala.pk/getImage?i=&t=course',
    );
  }
}


// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:digitalkarobaar/src/bloc/cart/cart_cubit.dart';
// import 'package:digitalkarobaar/src/bloc/cart/cart_state.dart';
// import 'package:digitalkarobaar/src/core/provider/cart_provider.dart';
// import 'package:digitalkarobaar/src/core/widget/common_button.dart';
// import 'package:digitalkarobaar/src/core/widget/common_icon_button.dart';
// import 'package:digitalkarobaar/src/models/product_spec.dart';
// import 'package:digitalkarobaar/src/models/products.dart';
// import 'package:digitalkarobaar/src/repository/home_repository.dart';
// import 'package:digitalkarobaar/src/repository/product_repository.dart';
// import 'package:digitalkarobaar/src/res/app_colors.dart';
// import 'package:digitalkarobaar/src/route/router_name.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
// import 'package:share/share.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// class ProductDetails extends StatefulWidget {
//   final id;

//   const ProductDetails(this.id);
//   @override
//   _ProductDetailsState createState() => _ProductDetailsState();
// }

// class _ProductDetailsState extends State<ProductDetails> {
//   var rating = 3.0;
//   bool isLoading = true;
//   final pageController = PageController(viewportFraction: 1);
//   bool favourite = false;
//   CartCubit cartCubit;
//   @override
//   void initState() {
//     _getProductsById();
//     _getUserProfile();

//     cartCubit = BlocProvider.of<CartCubit>(context);
//     super.initState();
//   }

//   _getUserProfile() async {
//     await HomeReposiitory.getProfileInfo().then((userProfile) {
//       if (userProfile != null) {
//         //userProfile = profile;
//         _getFavorite(userProfile.id);
//       }
//     });
//   }

//   Products productDetails;

//   _getFavorite(int userid) async {
//     await ProductRepository.getFavorite(userid).then((value) {
//       if (value != null) {
//         final v = value.any((element) => element.id == widget.id);

//         setState(() {
//           favourite = v;
//         });
//       }
//     });
//   }

//   Specification specifications;
//   _getProductsById() async {
//     specifications = Specification();
//     final getProductDetails =
//         await HomeReposiitory.getProductsDetails(widget.id);

//     if (getProductDetails != null) {
//       final specification =
//           await HomeReposiitory.getProductsSpecification(widget.id);
//       setState(() {
//         productDetails = getProductDetails;
//         specifications = specification;
//         isLoading = false;
//       });
//     }
//   }

//   final titleStyle =
//       GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500);
//   final subtitleStyle = GoogleFonts.openSans(
//     fontSize: 12,
//   );
//   final choices = ["My Favorites", "Search", "Home"];
//   @override
//   Widget build(BuildContext context) {
//     final cartItems = Provider.of<CartDetailProvider>(context);
//     return Scaffold(
//         body: isLoading
//             ? Center(
//                 child: CircularProgressIndicator(),
//               )
//             : buildbody(cartItems));
//   }

//   buildbody(CartDetailProvider cartItems) {
//     print(productDetails);
//     return SafeArea(
//       child: NestedScrollView(
//         headerSliverBuilder: (BuildContext context, bool innerBoxScrolled) {
//           return <Widget>[
//             SliverAppBar(
//               actions: [
//                 InkWell(
//                     onTap: () {
//                       setState(() {
//                         favourite = !favourite;
//                       });
//                       _handleFavorite(favourite);
//                     },
//                     child: favourite
//                         ? CircleAvatar(
//                             backgroundColor: Colors.black12,
//                             child: Icon(
//                               Icons.favorite,
//                               size: 20,
//                               color: Colors.red,
//                             ),
//                           )
//                         : CircleAvatar(
//                             backgroundColor: Colors.black12,
//                             child: Icon(
//                               Icons.favorite_border,
//                               color: AppColors.primaryColor,
//                               size: 20,
//                             ))),
//                 CircleAvatar(
//                     backgroundColor: Colors.black12,
//                     radius: 18,
//                     child: InkWell(
//                         onTap: () {
//                           _shareProducts();
//                         },
//                         child: Icon(
//                           Icons.share,
//                           color: AppColors.primaryColor,
//                         ))),
//                 CommonIconButton(
//                   onPressed: () {
//                     Navigator.pushNamed(context, RouterName.cartScreen);
//                   },
//                 ),
//                 PopupMenuButton<String>(
//                   elevation: 0.0,
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10)),
//                   onSelected: (v) {
//                     switch (v) {
//                       case 'My Favorites':
//                         Navigator.pushNamed(context, RouterName.favourites);
//                         break;
//                       case 'Search':
//                         Navigator.pushNamed(context, RouterName.searchPage);
//                         break;
//                       case 'Home':
//                         Navigator.pushNamed(context, RouterName.mainPage);
//                         break;
//                       default:
//                     }
//                   },
//                   itemBuilder: (BuildContext context) {
//                     return choices.map((String choice) {
//                       return PopupMenuItem<String>(
//                         value: choice,
//                         child: Text(
//                           choice,
//                           style: GoogleFonts.poppins(fontSize: 12),
//                         ),
//                       );
//                     }).toList();
//                   },
//                 )
//               ],
//               backgroundColor: Colors.transparent,
//               expandedHeight: 200.0,
//               floating: false,
//               pinned: true,
//               flexibleSpace: FlexibleSpaceBar(
//                 background: Stack(fit: StackFit.loose, children: <Widget>[
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Container(
//                       height: 180,
//                       child: PageView(controller: pageController, children: [
//                         _buildImageLis(productDetails.image1),
//                         _buildImageLis(productDetails.image2),
//                         _buildImageLis(productDetails.image3),
//                         _buildImageLis(productDetails.image4),
//                         _buildImageLis(productDetails.image5),
//                       ]),
//                     ),
//                   ),
//                   Positioned(
//                     bottom: 30,
//                     left: 110,
//                     child: SmoothPageIndicator(
//                         controller: pageController, // PageController
//                         count: 5,
//                         effect: ExpandingDotsEffect(
//                             activeDotColor: Color(0xffffa726),
//                             dotColor: Colors.grey,
//                             radius: 10,
//                             dotWidth: 10,
//                             dotHeight: 10), // your preferred effect
//                         onDotClicked: (index) {}),
//                   )
//                 ]),
//               ),
//             )
//           ];
//         },
//         body: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(height: 10),
//               Card(
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [
//                           Text(productDetails.title,
//                               style: GoogleFonts.openSans(
//                                   color: Color(0xff212121),
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.w800)),

//                           // SmoothStarRating(
//                           //     allowHalfRating: true,
//                           //     onRated: (v) {
//                           //       setState(() {
//                           //         rating = v;
//                           //       });
//                           //     },
//                           //     starCount: 5,
//                           //     rating: rating,
//                           //     size: 10.0,
//                           //     color: Colors.amber,
//                           //     borderColor: Colors.amber,
//                           //     spacing: 0.0),
//                         ],
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Text(
//                             ' sold By : ',
//                             style: subtitleStyle,
//                           ),
//                           Text(
//                             productDetails.brand,
//                             style: GoogleFonts.openSans(fontSize: 12),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 10),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Price After Discount :',
//                             style: subtitleStyle,
//                           ),
//                           Text(
//                             '\u20B9 ${productDetails.discount}',
//                             style: GoogleFonts.openSans(
//                                 fontSize: 20,
//                                 color: Color(0xff0039cb),
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 10),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           _getgetGstBenefit(
//                               productDetails.discount, productDetails.gst),
//                         ],
//                       ),
//                       const SizedBox(height: 10),
//                       Container(
//                         padding: EdgeInsets.all(5),
//                         color: Color(0xffffcc80),
//                         child: Row(
//                           // mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             const SizedBox(width: 10),
//                             Text(
//                               "MRP :\u20B9",
//                               style: GoogleFonts.openSans(
//                                   fontSize: 16, fontWeight: FontWeight.bold),
//                             ),
//                             Text(
//                               '${productDetails.prize}',
//                               style: GoogleFonts.openSans(
//                                   fontSize: 16, fontWeight: FontWeight.bold),
//                             ),
//                             Spacer(),
//                             Text(
//                               'Retail Margin: ',
//                               style: subtitleStyle,
//                             ),
//                             Text('% ${productDetails.retail}'),
//                             const SizedBox(width: 20)
//                           ],
//                         ),
//                       ),
//                       const SizedBox(height: 10),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Delivery: ',
//                             style: subtitleStyle,
//                           ),
//                           Text('\u20B9 ${productDetails.delivery}'),
//                         ],
//                       ),
//                       const SizedBox(height: 10),
//                       Row(
//                         children: [
//                           Text("Min Order:",
//                               style: GoogleFonts.openSans(
//                                 fontSize: 12,
//                               )),
//                           SizedBox(width: 10),
//                           Text(" ${productDetails.minBuy}",
//                               style: GoogleFonts.openSans(fontSize: 12))
//                         ],
//                       ),
//                       const SizedBox(height: 10),
//                       Column(
//                         children: [
//                           Text("Description :",
//                               style: GoogleFonts.openSans(
//                                 fontSize: 12,
//                               )),
//                           SizedBox(width: 10),
//                           Text(productDetails.description,
//                               style: GoogleFonts.poppins(
//                                 fontSize: 12,
//                               )),
//                         ],
//                       ),
//                       const SizedBox(height: 5),
//                     ],
//                   ),
//                 ),
//               ),
//               Card(
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Supplier Profile: ',
//                             style: GoogleFonts.poppins(
//                                 color: Color(0xff212121), fontSize: 15),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 2),
//                       InkWell(
//                         onTap: () {
//                           Navigator.pushNamed(context, RouterName.sellerShop,
//                               arguments: productDetails.sellerId);
//                         },
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               productDetails.shop,
//                               style: GoogleFonts.openSans(
//                                   fontWeight: FontWeight.bold),
//                             ),
//                             Container(
//                               height: 25,
//                               width: 60,
//                               child: Center(
//                                   child: Text('View',
//                                       style: TextStyle(
//                                           fontSize: 12,
//                                           color: AppColors.primaryColor))),
//                               decoration: BoxDecoration(
//                                   color: Colors.orange[200],
//                                   shape: BoxShape.rectangle,
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(20))),
//                             )
//                           ],
//                         ),
//                       ),
//                       const SizedBox(height: 5),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(height: 10),
//               Card(
//                 child: Container(
//                   padding: EdgeInsets.all(12),
//                   decoration: BoxDecoration(color: Colors.orange[200]),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Digital Karobaar Specials',
//                         style: GoogleFonts.poppins(
//                             fontSize: 14, fontWeight: FontWeight.w500),
//                       ),
//                       SizedBox(height: 5),
//                       Row(
//                         children: [
//                           Container(
//                               child: Image.asset(
//                             'assets/icons/vaypar.png',
//                             width: 20,
//                             height: 20,
//                           )),
//                           Text(
//                             "Vypar Suraksha",
//                             style: TextStyle(fontSize: 12),
//                           ),
//                           SizedBox(width: 20),
//                           Icon(Icons.group_work, size: 10),
//                           Text("Verified Supplier",
//                               style: TextStyle(fontSize: 12))
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(height: 10),
//               Card(
//                 child: Padding(
//                   padding: const EdgeInsets.all(4.0),
//                   child: Column(
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Text(
//                             "Specification",
//                             style: GoogleFonts.poppins(
//                                 color: Color(0xff212121), fontSize: 15),
//                           ),
//                         ],
//                       ),

//                       // Text("highlights:", style: titleStyle),

//                       // Text( specifications.highlights[0].toString()),
//                       SingleChildScrollView(
//                         scrollDirection: Axis.horizontal,
//                         child: DataTable(
//                           columns: const <DataColumn>[
//                             DataColumn(
//                               label: Text(
//                                 'Property',
//                                 style: TextStyle(fontStyle: FontStyle.italic),
//                               ),
//                             ),
//                             DataColumn(
//                               label: Text(
//                                 '',
//                                 style: TextStyle(fontStyle: FontStyle.italic),
//                               ),
//                             ),
//                           ],
//                           rows: <DataRow>[
//                             specifications.highlights.length != 0
//                                 ? DataRow(
//                                     cells: <DataCell>[
//                                       DataCell(Text(
//                                           specifications.highlights[0].title)),
//                                       DataCell(Text(specifications
//                                           .highlights[0].description)),
//                                     ],
//                                   )
//                                 : DataRow(
//                                     cells: <DataCell>[
//                                       DataCell(Text('No Available')),
//                                       DataCell(Text('No Available')),
//                                     ],
//                                   ),
//                             specifications.highlights.length != 0
//                                 ? DataRow(
//                                     cells: <DataCell>[
//                                       DataCell(Text(
//                                           specifications.highlights[1].title)),
//                                       DataCell(Text(specifications
//                                           .highlights[1].description)),
//                                     ],
//                                   )
//                                 : DataRow(
//                                     cells: <DataCell>[
//                                       DataCell(Text('No Available')),
//                                       DataCell(Text('No Available')),
//                                     ],
//                                   ),
//                             specifications.features.length != 0
//                                 ? DataRow(
//                                     cells: <DataCell>[
//                                       DataCell(Text(
//                                           specifications.features[0].title)),
//                                       DataCell(Text(specifications
//                                           .features[0].description)),
//                                     ],
//                                   )
//                                 : DataRow(
//                                     cells: <DataCell>[
//                                       DataCell(Text('No Available')),
//                                       DataCell(Text('No Available')),
//                                     ],
//                                   ),
//                             specifications.features.length != 0
//                                 ? DataRow(
//                                     cells: <DataCell>[
//                                       DataCell(Text(
//                                           specifications.features[1].title)),
//                                       DataCell(Text(specifications
//                                           .features[1].description)),
//                                     ],
//                                   )
//                                 : DataRow(
//                                     cells: <DataCell>[
//                                       DataCell(Text('No Available')),
//                                       DataCell(Text('No Available')),
//                                     ],
//                                   ),
//                             specifications.specs.length != 0
//                                 ? DataRow(
//                                     cells: <DataCell>[
//                                       DataCell(Text(
//                                           specifications.specs[0].title ?? '')),
//                                       DataCell(Text(
//                                           specifications.specs[0].description ??
//                                               '')),
//                                     ],
//                                   )
//                                 : DataRow(
//                                     cells: <DataCell>[
//                                       DataCell(Text('No Available')),
//                                       DataCell(Text('No Available')),
//                                     ],
//                                   )
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Card(
//                 child: Container(
//                   padding: EdgeInsets.all(10),
//                   width: double.infinity,
//                   decoration: BoxDecoration(color: Colors.black12),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text("Recommendation by supplier", style: titleStyle),
//                       Text("Abc", style: titleStyle),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(height: 30),
//               Card(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     FlatButton(
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10)),
//                         color: Colors.orange[200],
//                         onPressed: () {
//                           Navigator.pushNamed(context, RouterName.messanger);
//                         },
//                         child: Text(
//                           'Chat Now',
//                           style: TextStyle(color: AppColors.primaryColor),
//                         )),
//                     BlocBuilder<CartCubit, CartState>(builder: (c, s) {
//                       if (s is LoadingCart) {
//                         return CircularProgressIndicator();
//                       }
//                       return CommonButton(
//                         buttonColor: AppColors.primaryColor,
//                         width: 150,
//                         title: 'Buy',
//                         onTap: () async {
//                           await cartCubit
//                               .addToCart(productDetails.id.toString());

//                           await cartCubit.getCartItems(context);
//                         },
//                       );
//                     })
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   _checkKycUpload(CartDetailProvider cartItems) {
//     HomeReposiitory.getKyc().then((value) {
//       if (value == "verified") {
//         // cartItems.setCardItems(productDetails.id);
//       } else {
//         Navigator.pushNamed(context, RouterName.shopkyc);
//       }
//     }).catchError(() {});
//   }

//   void _shareProducts() async {
//     await Share.share('check out my website https://example.com');
//   }

//   _handleFavorite(bool favourite) {
//     print(favourite);

//     if (favourite) {
//       ProductRepository.postFavorite(widget.id);
//     } else {
//       ProductRepository.removeFavorite(widget.id);
//     }
//   }

//   _getgetGstBenefit(int discount, gst) {
//     var discountGst = discount * gst / 100;
//     var price = discount - discountGst;
//     if (gst != null && discount != null) {
//       return Text('\u20B9 $price + \u20B9 $discountGst ($gst% GST Benefit)');
//     } else {
//       return Text('\u20B9 $price + \u20B9 (gst% Benefit)');
//     }
//   }
// }

// _buildImageLis(String path) {
//   if (path != null) {
//     return Container(
//       color: Colors.black12,
//       child: CachedNetworkImage(
//         imageUrl: path,
//         colorBlendMode: BlendMode.darken,
//         errorWidget: (context, url, error) => Image.network(
//           'https://azadchaiwala.pk/getImage?i=&t=course',
//         ),
//       ),
//     );
//   } else {
//     return Image.network(
//       'https://azadchaiwala.pk/getImage?i=&t=course',
//     );
//   }
// }