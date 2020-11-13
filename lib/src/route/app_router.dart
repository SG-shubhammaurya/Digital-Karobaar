// import 'package:digitalkarobaar/src/Team/Manage/Member_Forget_Password.dart';
// import 'package:digitalkarobaar/src/Team/Manage/Member_forget_verify.dart';
// import 'package:digitalkarobaar/src/Team/Manage/Member_upload_Product.dart';
// import 'package:digitalkarobaar/src/Team/Manage/Signup_verify_otp.dart';
// import 'package:digitalkarobaar/src/Team/Manage/meber_login.dart';
// import 'package:digitalkarobaar/src/Team/Your_Team.dart';
// import 'package:digitalkarobaar/src/core/widget/bottom_nav.dart';
// import 'package:digitalkarobaar/src/models/seller_story.dart';
// import 'package:digitalkarobaar/src/payment/products_payment.dart';
// import 'package:digitalkarobaar/src/route/router_name.dart';

// import 'package:digitalkarobaar/src/ui/SellerReturn/Approved_Return.dart';
// import 'package:digitalkarobaar/src/ui/SellerReturn/Pending_Return.dart';
// import 'package:digitalkarobaar/src/ui/SellerReturn/Seller_Return.dart';
// import 'package:digitalkarobaar/src/ui/auth/account_info.dart';
// import 'package:digitalkarobaar/src/ui/auth/main_screen.dart';
// import 'package:digitalkarobaar/src/ui/auth/phone_otp.dart';
// import 'package:digitalkarobaar/src/ui/auth/term_and_condition.dart';
// import 'package:digitalkarobaar/src/ui/favorite/my_favorite.dart';
// import 'package:digitalkarobaar/src/ui/home/allproducts/all_categories.dart';
// import 'package:digitalkarobaar/src/ui/home/allproducts/all_products.dart';
// import 'package:digitalkarobaar/src/ui/home/allproducts/product_page.dart';
// import 'package:digitalkarobaar/src/ui/home/allproducts/products_details.dart';
// import 'package:digitalkarobaar/src/ui/home/allproducts/subProducts.dart';
// import 'package:digitalkarobaar/src/ui/home/allproducts/sub_categories_details.dart';
// import 'package:digitalkarobaar/src/ui/home/cart/Check_out.dart';
// import 'package:digitalkarobaar/src/ui/home/cart/address.dart';
// import 'package:digitalkarobaar/src/ui/home/cart/cart_screen.dart';
// import 'package:digitalkarobaar/src/ui/home/notification/my_notification.dart';
// import 'package:digitalkarobaar/src/ui/home/order/your_Order.dart';
// import 'package:digitalkarobaar/src/ui/home/rat_cart/Rate_Card.dart';
// import 'package:digitalkarobaar/src/ui/home/return/Approved_return.dart';
// import 'package:digitalkarobaar/src/ui/home/return/Rejected_return.dart';
// import 'package:digitalkarobaar/src/ui/home/return/allReturn.dart';
// import 'package:digitalkarobaar/src/ui/home/return/canceller_return.dart';
// import 'package:digitalkarobaar/src/ui/home/return/get_return.dart';
// import 'package:digitalkarobaar/src/ui/home/return/pending_return.dart';
// import 'package:digitalkarobaar/src/ui/home/return/post_return.dart';
// import 'package:digitalkarobaar/src/ui/home/return/your_Returns.dart';
// import 'package:digitalkarobaar/src/ui/home/search/search_page.dart';
// import 'package:digitalkarobaar/src/ui/home/select_lang/select_lang.dart';
// import 'package:digitalkarobaar/src/ui/home/sell_dk/forget_otp.dart';
// import 'package:digitalkarobaar/src/ui/home/sell_dk/forget_password.dart';
// import 'package:digitalkarobaar/src/ui/home/sell_dk/myAccount/bank_details.dart';
// import 'package:digitalkarobaar/src/ui/home/sell_dk/myAccount/brand_mov.dart';
// import 'package:digitalkarobaar/src/ui/home/sell_dk/myAccount/documents.dart';
// import 'package:digitalkarobaar/src/ui/home/sell_dk/myAccount/pickup_details.dart';
// import 'package:digitalkarobaar/src/ui/home/sell_dk/myAccount/seller_details.dart';
// import 'package:digitalkarobaar/src/ui/home/sell_dk/myAccount/submit_form.dart';
// import 'package:digitalkarobaar/src/ui/home/sell_dk/sellDashboard/SellerSupport_Page.dart';
// import 'package:digitalkarobaar/src/ui/home/sell_dk/sellDashboard/Vypaar_Surakhsa.dart';
// import 'package:digitalkarobaar/src/ui/home/sell_dk/sellDashboard/adverties_page.dart';
// import 'package:digitalkarobaar/src/ui/home/sell_dk/sellDashboard/analyticsPage.dart';
// import 'package:digitalkarobaar/src/ui/home/sell_dk/sellDashboard/connection_page.dart';
// import 'package:digitalkarobaar/src/ui/home/sell_dk/sellDashboard/discount_page.dart';
// import 'package:digitalkarobaar/src/ui/home/sell_dk/sellDashboard/disputes_page.dart';
// import 'package:digitalkarobaar/src/ui/home/sell_dk/sellDashboard/get_story.dart';
// import 'package:digitalkarobaar/src/ui/home/sell_dk/sellDashboard/post_story.dart';
// import 'package:digitalkarobaar/src/ui/home/sell_dk/sellDashboard/productUpload/product_upload.dart';
// import 'package:digitalkarobaar/src/ui/home/sell_dk/sellDashboard/seller_dashboard.dart';
// import 'package:digitalkarobaar/src/ui/home/sell_dk/sellDashboard/your_brands.dart';
// import 'package:digitalkarobaar/src/ui/home/sell_dk/sell_login.dart';
// import 'package:digitalkarobaar/src/ui/home/sell_dk/sell_otp.dart';
// import 'package:digitalkarobaar/src/ui/home/sell_dk/seller/recomdede_seller.dart';
// import 'package:digitalkarobaar/src/ui/home/sell_dk/seller/seller_shop.dart';
// import 'package:digitalkarobaar/src/ui/home/sell_dk/sellerprofile/Business_Profile.dart';
// import 'package:digitalkarobaar/src/ui/home/sell_dk/sellerprofile/Seller_Settings.dart';
// import 'package:digitalkarobaar/src/ui/home/sell_dk/sellondigitapKarobaar.dart';
// import 'package:digitalkarobaar/src/ui/home/support/Support.dart';
// import 'package:digitalkarobaar/src/ui/home/term_use/Term_of_use.dart';
// import 'package:digitalkarobaar/src/ui/home/yourOrder/your_seller_order.dart';
// import 'package:digitalkarobaar/src/ui/messenger/chat.dart';
// import 'package:digitalkarobaar/src/ui/messenger/messenger.dart';
// import 'package:digitalkarobaar/src/ui/profile/myAccount/your_profile.dart';
// import 'package:digitalkarobaar/src/ui/profile/my_account.dart';
// import 'package:digitalkarobaar/src/ui/profile/update_profile.dart';
// import 'package:digitalkarobaar/src/ui/shopkyc/shop_kyc.dart';
// import 'package:digitalkarobaar/src/ui/supplier/supplier.dart';
// import 'package:flutter/material.dart';

// class AppRouter {
//   static Route<dynamic> getGeneratedRouute(RouteSettings settings) {
//     final args = settings.arguments;
//     switch (settings.name) {
//       case RouterName.initialRoute:
//         return MaterialPageRoute(builder: (_) => MainScreen());
//         break;
//       case RouterName.otp:
//         return MaterialPageRoute(builder: (_) => PhoneOtp());

//         break;
//       case RouterName.registration:
//         return MaterialPageRoute(builder: (_) => AccountInfo(id: args));
//         break;
//       case RouterName.termCondition:
//         return MaterialPageRoute(builder: (_) => TermAndCondition());
//         break;
//       case RouterName.shopkyc:
//         return MaterialPageRoute(builder: (_) => ShopKyc());
//         break;
//       case RouterName.mainPage:
//         return MaterialPageRoute(builder: (_) => MainPage());
//         break;
//       case RouterName.searchPage:
//         return MaterialPageRoute(builder: (_) => SearchPage());
//         break;
//       case RouterName.userAccount:
//         return MaterialPageRoute(builder: (_) => UpdateProfile());

//         break;
//       case RouterName.selectLanguage:
//         return MaterialPageRoute(builder: (_) => SettingsPage());
//         break;
//       case RouterName.allProducts:
//         return MaterialPageRoute(builder: (_) => ProductScreen());
//         break;
//       case RouterName.productDetails:
//         return MaterialPageRoute(builder: (_) => ProductDetails(args));
//         break;
//       case RouterName.cartScreen:
//         return MaterialPageRoute(builder: (_) => CartScreen());
//         break;

//       case RouterName.chat:
//         return MaterialPageRoute(builder: (_) => ChatScreen(userId: args));
//         break;
//       case RouterName.allCategories:
//         return MaterialPageRoute(builder: (_) => AllCategories());
//         break;
//       case RouterName.subCategories:
//         return MaterialPageRoute(builder: (_) => SubCategories(args));
//         break;
//       case RouterName.rateCard:
//         return MaterialPageRoute(builder: (_) => RateCard());
//         break;
//       case RouterName.sellOnKarobaar:
//         return MaterialPageRoute(builder: (_) => SellOnDigitalKarobaar());
//         break;
//       case RouterName.support:
//         return MaterialPageRoute(builder: (_) => Support());
//         break;
//       case RouterName.termOfUse:
//         return MaterialPageRoute(builder: (_) => TermOfUse());
//         break;
//       case RouterName.yourOrder:
//         return MaterialPageRoute(builder: (_) => YourOrder());
//         break;
//       case RouterName.yourReturns:
//         return MaterialPageRoute(builder: (_) => YourReturns());
//         break;
//      // case RouterName.orderForms:
//        // return MaterialPageRoute(builder: (_) => OrderForm());
//        // break;
//       case RouterName.allReturn:
//         return MaterialPageRoute(builder: (_) => AllReturn());
//         break;
//       case RouterName.approvedReturn:
//         return MaterialPageRoute(builder: (_) => ApprovedReturn());
//         break;
//       case RouterName.pendingReturn:
//         return MaterialPageRoute(builder: (_) => PendingReturn());
//         break;
//       case RouterName.rejectedReturn:
//         return MaterialPageRoute(builder: (_) => RejectedReturn());
//         break;
//       case RouterName.cancelledReturn:
//         return MaterialPageRoute(builder: (_) => CancelledReturn());
//         break;
//       case RouterName.productPage:
//         return MaterialPageRoute(builder: (_) => ProductPage(args));
//         break;
//       case RouterName.subCategoriesDetails:
//         return MaterialPageRoute(builder: (_) => SubCategoriesDetails(args));
//         break;
//       // case RouterName.splashScreen:
//       //   return MaterialPageRoute(builder: (_) => SplashScreen());
//       //   break;
//       case RouterName.messanger:
//         return MaterialPageRoute(builder: (_) => Messenger());
//         break;
//       case RouterName.favourites:
//         return MaterialPageRoute(builder: (_) => MyFavorite());
//         break;
//       case RouterName.notification:
//         return MaterialPageRoute(builder: (_) => MyNotification());
//         break;
//       case RouterName.sellLogin:
//         return MaterialPageRoute(builder: (_) => SellLogin());
//         break;
//       case RouterName.sellOtp:
//         return MaterialPageRoute(builder: (_) => SellOtp());
//         break;
//       case RouterName.sellForgotPassword:
//         return MaterialPageRoute(builder: (_) => ForgetPassword());
//         break;
//       case RouterName.sellerDetails:
//         return MaterialPageRoute(
//             builder: (_) => SellerDetails(
//                   isFormUpdate: args,
//                 ));
//         break;
//       case RouterName.documents:
//         return MaterialPageRoute(builder: (_) => Documents(args));
//         break;
//       case RouterName.pickupAddress:
//         return MaterialPageRoute(builder: (_) => PickupDetails(args));
//         break;
//       case RouterName.bankDetails:
//         return MaterialPageRoute(builder: (_) => BankDetails(args));
//         break;
//       case RouterName.brandsMov:
//         return MaterialPageRoute(
//             builder: (_) => BrandsMov(args));
//         break;
//       case RouterName.submitForm:
//         return MaterialPageRoute(builder: (_) => SubmitForm());
//         break;
//       case RouterName.supplier:
//         return MaterialPageRoute(builder: (_) => SupplierPage());
//         break;
//       case RouterName.checkOutConfm:
//         return MaterialPageRoute(builder: (_) => CheckOut(args));
//         break;
//       case RouterName.addressDeliver:
//         return MaterialPageRoute(builder: (_) => AddressDelivery());
//         break;
//       case RouterName.sellerDash:
//         return MaterialPageRoute(builder: (_) => SellerDashBoard());
//         break;
//       case RouterName.myAccount:
//         return MaterialPageRoute(builder: (_) => MyAccount());
//         break;
//       case RouterName.yourBrands:
//         return MaterialPageRoute(builder: (_) => YourBrands());
//         break;
//       //
//  case RouterName.poststoty:
//         return MaterialPageRoute(builder: (_) => PostStory());
//         break;
//       case RouterName.sellerstoty:
//         return MaterialPageRoute(builder: (_) => SellerStoty());
//         break;
//       case RouterName.disputes:
//         return MaterialPageRoute(builder: (_) => DisputesPage());
//         break;
//       case RouterName.adverties:
//         return MaterialPageRoute(builder: (_) => Advertiespage());
//         break;
//       case RouterName.analytics:
//         return MaterialPageRoute(builder: (_) => AnalyticsPage());
//         break;
//       case RouterName.connections:
//         return MaterialPageRoute(builder: (_) => ConnectionPage());
//         break;
//       case RouterName.discouunt:
//         return MaterialPageRoute(builder: (_) => DiscountPage());
//         break;
//       case RouterName.forgetOtp:
//         return MaterialPageRoute(builder: (_) => ForgetOtp());
//         break;
//       case RouterName.paymentPage:
//         return MaterialPageRoute(builder: (_) => ProductPayment(args));
//         break;
//       case RouterName.recomendedSeller:
//         return MaterialPageRoute(builder: (_) => RecomendedSeller());
//         break;
//       case RouterName.sellerShop:
//         return MaterialPageRoute(builder: (_) => SellerShop(args));
//         break;
//       case RouterName.sellerSupport:
//         return MaterialPageRoute(builder: (_) => SellerSupport());
//         break;
//       case RouterName.yourTeam:
//         return MaterialPageRoute(builder: (_) => YourTeam());
//         break;
//       case RouterName.vypaarSuraksha:
//         return MaterialPageRoute(builder: (_) => VypaarSuraksha());
//         break;
//       case RouterName.memberVerifyOtp:
//         return MaterialPageRoute(builder: (_) => MemberOtpVerify());
//         break;
//       case RouterName.memberLogin:
//         return MaterialPageRoute(builder: (_) => MemberLogin());
//         break;
//       case RouterName.memberForgetPassword:
//         return MaterialPageRoute(builder: (_) => MemberForgetPassword());
//         break;
//       case RouterName.memberForgetVerify:
//         return MaterialPageRoute(builder: (_) => MemberForgetVerify());
//         break;
//       case RouterName.memberUploadProducts:
//         return MaterialPageRoute(builder: (_) => MemberUploadProduct());
//         break;
//       case RouterName.sellerAccount:
//         return MaterialPageRoute(builder: (_) => YourProfile());
//         break;
//       //  case RouterName.sellerSetting:
//       // return MaterialPageRoute(builder: (_) => SellerAccount());
//       //   break;
//       case RouterName.sellerSetting:
//      return MaterialPageRoute(builder: (_) => SellerDetails(isFormUpdate: true,));
//         break;
//       case RouterName.businessProfile:
//         return MaterialPageRoute(builder: (_) => BusinessProfile());
//         break;
//       case RouterName.productUpload:
//         return MaterialPageRoute(builder: (_) => ProductUpload());
//         break;
//       case RouterName.businessProfileSetting:
//         return MaterialPageRoute(builder: (_) => SellerSetting());
//         break;
//       case RouterName.sellerOrder:
//         return MaterialPageRoute(builder: (_) => SellerOrder());
//        break;
//         case RouterName.postReturn:
//         return MaterialPageRoute(builder: (_) => PostReturn());
//          break;
//          case RouterName.getUserreturn:
//         return MaterialPageRoute(builder: (_) => GetUserReturn());
//          break;
        
//          case RouterName.sellerReturn:
//          return MaterialPageRoute(builder: (_) => SellerReturns());
//          break;
//          case RouterName.sellerPendingReturn:
//          return MaterialPageRoute(builder: (_) => SellerPendingReturn());
//           break;
//          case RouterName.sellerApprovedReturn:
//          return MaterialPageRoute(builder: (_) => SellerApprovedReturn());
//       default:
//         return MaterialPageRoute(
//             builder: (context) => UndefinedView(
//                   name: settings.name,
//                 ));
//     }
//   }
// }

// class UndefinedView extends StatelessWidget {
//   final String name;
//   const UndefinedView({Key key, this.name}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Text('Route for $name is not defined'),
//       ),
//     );
//   }
// }



import 'package:digitalkarobaar/src/Team/Manage/Member_Forget_Password.dart';
import 'package:digitalkarobaar/src/Team/Manage/Member_forget_verify.dart';
import 'package:digitalkarobaar/src/Team/Manage/Signup_verify_otp.dart';
import 'package:digitalkarobaar/src/Team/Manage/meber_login.dart';
import 'package:digitalkarobaar/src/Team/Your_Team.dart';
import 'package:digitalkarobaar/src/core/widget/bottom_nav.dart';
import 'package:digitalkarobaar/src/payment/products_payment.dart';
import 'package:digitalkarobaar/src/route/router_name.dart';

import 'package:digitalkarobaar/src/ui/SellerReturn/Approved_Return.dart';
import 'package:digitalkarobaar/src/ui/SellerReturn/Pending_Return.dart';
import 'package:digitalkarobaar/src/ui/SellerReturn/Seller_Return.dart';
import 'package:digitalkarobaar/src/ui/auth/account_info.dart';
import 'package:digitalkarobaar/src/ui/auth/main_screen.dart';
import 'package:digitalkarobaar/src/ui/auth/phone_otp.dart';
import 'package:digitalkarobaar/src/ui/auth/term_and_condition.dart';
import 'package:digitalkarobaar/src/ui/favorite/my_favorite.dart';
import 'package:digitalkarobaar/src/ui/home/allproducts/all_categories.dart';
import 'package:digitalkarobaar/src/ui/home/allproducts/all_products.dart';
import 'package:digitalkarobaar/src/ui/home/allproducts/product_page.dart';
import 'package:digitalkarobaar/src/ui/home/allproducts/products_details.dart';
import 'package:digitalkarobaar/src/ui/home/allproducts/subProducts.dart';
import 'package:digitalkarobaar/src/ui/home/allproducts/sub_categories_details.dart';
import 'package:digitalkarobaar/src/ui/home/cart/Check_out.dart';
import 'package:digitalkarobaar/src/ui/home/cart/address.dart';
import 'package:digitalkarobaar/src/ui/home/cart/cart_screen.dart';
import 'package:digitalkarobaar/src/ui/home/notification/my_notification.dart';
import 'package:digitalkarobaar/src/ui/home/order/your_Order.dart';
import 'package:digitalkarobaar/src/ui/home/rat_cart/Rate_Card.dart';
import 'package:digitalkarobaar/src/ui/home/return/Approved_return.dart';
import 'package:digitalkarobaar/src/ui/home/return/Rejected_return.dart';
import 'package:digitalkarobaar/src/ui/home/return/allReturn.dart';
import 'package:digitalkarobaar/src/ui/home/return/canceller_return.dart';
import 'package:digitalkarobaar/src/ui/home/return/get_return.dart';
import 'package:digitalkarobaar/src/ui/home/return/pending_return.dart';
import 'package:digitalkarobaar/src/ui/home/return/post_return.dart';
import 'package:digitalkarobaar/src/ui/home/return/your_Returns.dart';
import 'package:digitalkarobaar/src/ui/home/search/search_page.dart';
import 'package:digitalkarobaar/src/ui/home/select_lang/select_lang.dart';
import 'package:digitalkarobaar/src/ui/home/sell_dk/forget_otp.dart';
import 'package:digitalkarobaar/src/ui/home/sell_dk/forget_password.dart';
import 'package:digitalkarobaar/src/ui/home/sell_dk/myAccount/bank_details.dart';
import 'package:digitalkarobaar/src/ui/home/sell_dk/myAccount/brand_mov.dart';
import 'package:digitalkarobaar/src/ui/home/sell_dk/myAccount/documents.dart';
import 'package:digitalkarobaar/src/ui/home/sell_dk/myAccount/pickup_details.dart';
import 'package:digitalkarobaar/src/ui/home/sell_dk/myAccount/seller_details.dart';
import 'package:digitalkarobaar/src/ui/home/sell_dk/myAccount/submit_form.dart';
import 'package:digitalkarobaar/src/ui/home/sell_dk/sellDashboard/SellerSupport_Page.dart';
import 'package:digitalkarobaar/src/ui/home/sell_dk/sellDashboard/Vypaar_Surakhsa.dart';
import 'package:digitalkarobaar/src/ui/home/sell_dk/sellDashboard/adverties_page.dart';
import 'package:digitalkarobaar/src/ui/home/sell_dk/sellDashboard/connection_page.dart';
import 'package:digitalkarobaar/src/ui/home/sell_dk/sellDashboard/get_story.dart';
import 'package:digitalkarobaar/src/ui/home/sell_dk/sellDashboard/post_story.dart';
import 'package:digitalkarobaar/src/ui/home/sell_dk/sellDashboard/productUpload/product_upload.dart';
import 'package:digitalkarobaar/src/ui/home/sell_dk/sellDashboard/seller_dashboard.dart';
import 'package:digitalkarobaar/src/ui/home/sell_dk/sellDashboard/your_brands.dart';
import 'package:digitalkarobaar/src/ui/home/sell_dk/sell_login.dart';
import 'package:digitalkarobaar/src/ui/home/sell_dk/sell_otp.dart';
import 'package:digitalkarobaar/src/ui/home/sell_dk/seller/recomdede_seller.dart';
import 'package:digitalkarobaar/src/ui/home/sell_dk/seller/seller_shop.dart';
import 'package:digitalkarobaar/src/ui/home/sell_dk/sellerprofile/Business_Profile.dart';
import 'package:digitalkarobaar/src/ui/home/sell_dk/sellerprofile/Seller_Settings.dart';
import 'package:digitalkarobaar/src/ui/home/sell_dk/sellondigitapKarobaar.dart';
import 'package:digitalkarobaar/src/ui/home/support/Support.dart';
import 'package:digitalkarobaar/src/ui/home/term_use/Term_of_use.dart';
import 'package:digitalkarobaar/src/ui/home/yourOrder/your_seller_order.dart';
import 'package:digitalkarobaar/src/ui/messenger/chat.dart';
import 'package:digitalkarobaar/src/ui/messenger/messenger.dart';
import 'package:digitalkarobaar/src/ui/profile/myAccount/your_profile.dart';
import 'package:digitalkarobaar/src/ui/profile/my_account.dart';
import 'package:digitalkarobaar/src/ui/profile/update_profile.dart';
import 'package:digitalkarobaar/src/ui/shopkyc/shop_kyc.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic> getGeneratedRouute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case RouterName.initialRoute:
        return MaterialPageRoute(builder: (_) => MainScreen());
        break;
      case RouterName.otp:
        return MaterialPageRoute(builder: (_) => PhoneOtp());

        break;
      case RouterName.registration:
        return MaterialPageRoute(builder: (_) => AccountInfo(id: args));
        break;
      case RouterName.termCondition:
        return MaterialPageRoute(builder: (_) => TermAndCondition());
        break;
      case RouterName.shopkyc:
        return MaterialPageRoute(builder: (_) => ShopKyc());
        break;
      case RouterName.mainPage:
        return MaterialPageRoute(builder: (_) => MainPage());
        break;
      case RouterName.searchPage:
        return MaterialPageRoute(builder: (_) => SearchPage());
        break;
      case RouterName.userAccount:
        return MaterialPageRoute(builder: (_) => UpdateProfile());

        break;
      case RouterName.selectLanguage:
        return MaterialPageRoute(builder: (_) => SettingsPage());
        break;
      case RouterName.allProducts:
        return MaterialPageRoute(builder: (_) => ProductScreen());
        break;
      case RouterName.productDetails:
        return MaterialPageRoute(builder: (_) => ProductDetails(args));
        break;
      case RouterName.cartScreen:
        return MaterialPageRoute(builder: (_) => CartScreen());
        break;

      case RouterName.chat:
        return MaterialPageRoute(builder: (_) => ChatScreen(userId: args));
        break;
      case RouterName.allCategories:
        return MaterialPageRoute(builder: (_) => AllCategories());
        break;
      case RouterName.subCategories:
        return MaterialPageRoute(builder: (_) => SubCategories(args));
        break;
      case RouterName.rateCard:
        return MaterialPageRoute(builder: (_) => RateCard());
        break;
      case RouterName.sellOnKarobaar:
        return MaterialPageRoute(builder: (_) => SellOnDigitalKarobaar());
        break;
      case RouterName.support:
        return MaterialPageRoute(builder: (_) => Support());
        break;
      case RouterName.termOfUse:
        return MaterialPageRoute(builder: (_) => TermOfUse());
        break;
      case RouterName.yourOrder:
        return MaterialPageRoute(builder: (_) => YourOrder());
        break;
      case RouterName.yourReturns:
        return MaterialPageRoute(builder: (_) => YourReturns());
        break;
     // case RouterName.orderForms:
       // return MaterialPageRoute(builder: (_) => OrderForm());
       // break;
      case RouterName.allReturn:
        return MaterialPageRoute(builder: (_) => AllReturn());
        break;
      case RouterName.approvedReturn:
        return MaterialPageRoute(builder: (_) => ApprovedReturn());
        break;
      case RouterName.pendingReturn:
        return MaterialPageRoute(builder: (_) => PendingReturn());
        break;
      case RouterName.rejectedReturn:
        return MaterialPageRoute(builder: (_) => RejectedReturn());
        break;
      case RouterName.cancelledReturn:
        return MaterialPageRoute(builder: (_) => CancelledReturn());
        break;
      case RouterName.productPage:
        return MaterialPageRoute(builder: (_) => ProductPage(args));
        break;
      case RouterName.subCategoriesDetails:
        return MaterialPageRoute(builder: (_) => SubCategoriesDetails(args));
        break;
      // case RouterName.splashScreen:
      //   return MaterialPageRoute(builder: (_) => SplashScreen());
      //   break;
      case RouterName.messanger:
        return MaterialPageRoute(builder: (_) => Messenger());
        break;
      case RouterName.favourites:
        return MaterialPageRoute(builder: (_) => MyFavorite());
        break;
      case RouterName.notification:
        return MaterialPageRoute(builder: (_) => MyNotification());
        break;
      case RouterName.sellLogin:
        return MaterialPageRoute(builder: (_) => SellLogin());
        break;
      case RouterName.sellOtp:
        return MaterialPageRoute(builder: (_) => SellOtp());
        break;
      case RouterName.sellForgotPassword:
        return MaterialPageRoute(builder: (_) => ForgetPassword());
        break;
      case RouterName.sellerDetails:
        return MaterialPageRoute(
            builder: (_) => SellerDetails(
                  isFormUpdate: args,
                ));
        break;
      case RouterName.documents:
        return MaterialPageRoute(builder: (_) => Documents(args));
        break;
      case RouterName.pickupAddress:
        return MaterialPageRoute(builder: (_) => PickupDetails(args));
        break;
      case RouterName.bankDetails:
        return MaterialPageRoute(builder: (_) => BankDetails(args));
        break;
      case RouterName.brandsMov:
        return MaterialPageRoute(
            builder: (_) => BrandsMov(args));
        break;
      case RouterName.submitForm:
        return MaterialPageRoute(builder: (_) => SubmitForm());
        break;
     
      case RouterName.checkOutConfm:
        return MaterialPageRoute(builder: (_) => CheckOut(args));
        break;
      case RouterName.addressDeliver:
        return MaterialPageRoute(builder: (_) => AddressDelivery());
        break;
      case RouterName.sellerDash:
        return MaterialPageRoute(builder: (_) => SellerDashBoard());
        break;
      case RouterName.myAccount:
        return MaterialPageRoute(builder: (_) => MyAccount());
        break;
      case RouterName.yourBrands:
        return MaterialPageRoute(builder: (_) => YourBrands());
        break;
      //
 case RouterName.poststoty:
        return MaterialPageRoute(builder: (_) => PostStory());
        break;
      case RouterName.sellerstoty:
        return MaterialPageRoute(builder: (_) => SellerStoty());
        break;
    
      case RouterName.adverties:
        return MaterialPageRoute(builder: (_) => Advertiespage());
        break;
     
      case RouterName.connections:
        return MaterialPageRoute(builder: (_) => ConnectionPage());
     
 
        break;
      case RouterName.forgetOtp:
        return MaterialPageRoute(builder: (_) => ForgetOtp());
        break;
      case RouterName.paymentPage:
        return MaterialPageRoute(builder: (_) => ProductPayment(args));
        break;
      case RouterName.recomendedSeller:
        return MaterialPageRoute(builder: (_) => RecomendedSeller());
        break;
      case RouterName.sellerShop:
        return MaterialPageRoute(builder: (_) => SellerShop(args));
        break;
      case RouterName.sellerSupport:
        return MaterialPageRoute(builder: (_) => SellerSupport());
        break;
      case RouterName.yourTeam:
        return MaterialPageRoute(builder: (_) => YourTeam());
        break;
      case RouterName.vypaarSuraksha:
        return MaterialPageRoute(builder: (_) => VypaarSuraksha());
        break;
      case RouterName.memberVerifyOtp:
        return MaterialPageRoute(builder: (_) => MemberOtpVerify());
        break;
      case RouterName.memberLogin:
        return MaterialPageRoute(builder: (_) => MemberLogin());
        break;
      case RouterName.memberForgetPassword:
        return MaterialPageRoute(builder: (_) => MemberForgetPassword());
        break;
      case RouterName.memberForgetVerify:
        return MaterialPageRoute(builder: (_) => MemberForgetVerify());
        break;
    
      case RouterName.sellerAccount:
        return MaterialPageRoute(builder: (_) => YourProfile());
        break;
   
      case RouterName.sellerSetting:
     return MaterialPageRoute(builder: (_) => SellerDetails(isFormUpdate: true,));
        break;
      case RouterName.businessProfile:
        return MaterialPageRoute(builder: (_) => BusinessProfile());
        break;
      case RouterName.productUpload:
        return MaterialPageRoute(builder: (_) => ProductUpload());
        break;
      case RouterName.businessProfileSetting:
        return MaterialPageRoute(builder: (_) => SellerSetting());
        break;
      case RouterName.sellerOrder:
        return MaterialPageRoute(builder: (_) => SellerOrder());
       break;
        case RouterName.postReturn:
        return MaterialPageRoute(builder: (_) => PostReturn());
         break;
         case RouterName.getUserreturn:
        return MaterialPageRoute(builder: (_) => GetUserReturn());
         break;
        
         case RouterName.sellerReturn:
         return MaterialPageRoute(builder: (_) => SellerReturns());
         break;
         case RouterName.sellerPendingReturn:
         return MaterialPageRoute(builder: (_) => SellerPendingReturn());
          break;
         case RouterName.sellerApprovedReturn:
         return MaterialPageRoute(builder: (_) => SellerApprovedReturn());
      default:
        return MaterialPageRoute(
            builder: (context) => UndefinedView(
                  name: settings.name,
                ));
    }
  }
}

class UndefinedView extends StatelessWidget {
  final String name;
  const UndefinedView({Key key, this.name}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Route for $name is not defined'),
      ),
    );
  }
}
