// class EndPoint {
//   static String baseUrl =
//   // "https://15.207.51.141:9090/";
//   //"https://digitalkarobar.aiovu.com";
//   "http://15.207.51.141";

//   static String registration = baseUrl + "/user/register";
//   static String phoneNumber = baseUrl + "/user/number";
//   static String verification = baseUrl + "/user/verify";
//   static String termCondition = baseUrl + "/user/terms";
//   static String login = baseUrl + "/user/login";
//   static String loginOtpVerify = baseUrl + "/user/login/verify";
//   static String acceptTc = baseUrl + "/user/accept";
//   static String categories = baseUrl + "/products/categories";
//   static String topcategories = baseUrl + "/products/categories/top";
//   static String brand = baseUrl + "/products/brands";
//   static String topbrand = baseUrl + "/products/brands/top";
//   static String userProfile = baseUrl + "/user/profile";
//   static String updateProfile = baseUrl + "/user/profile/update";
//   static String productget = baseUrl + "/products/get";
//   static String updateKyc = baseUrl + "/user/kyc/update";
//   static String getKyc = baseUrl + "/user/kyc";
//   static String profilePic = baseUrl + "/user/profile/pic/update";
//   static String searchProducts = baseUrl + "/products/search?search=";
//   static String productsDetails = baseUrl + "/products/get?id=";
//   static String productsFilter = baseUrl + "/products/filter";
//   static String chatMessaageSend = baseUrl + "/chat/message";
//   static String chatmessaageget = baseUrl + "/chat/message/get";

//   static String filterproduct = baseUrl + "/products/filter?";
//   static String subCategories = baseUrl + "/products/sub";
//   static String topBrandAccordingToSub = baseUrl + "/products/sub/brands/top";
//   static String topProductsToSub = baseUrl + "/products/sub/top";

//   static String getFavorite = baseUrl + "/products/favorites";

//   static String sellSignup = baseUrl + "/user/seller/register";
//   static String sellVerify = baseUrl + "/user/seller/verify";
//   static String sellLogin = baseUrl + "/user/seller/login";
//   static String postFavorite = baseUrl + "/products/favorites";
//   static String removeFavorite = baseUrl + "/products/favorites/remove";

//   static String formDetail = baseUrl + "/form/details";

//   static String allStates = baseUrl + "/location/state";
//   static String getCities = baseUrl + "/location/city?search=";

//   static String uploadDoc = baseUrl + "/form/doc";

//   static String pickupDetails = baseUrl + "/form/pickup";

//   static String formbank = baseUrl + "/form/bank";
//   static String brandRegister = baseUrl + "/products/brand/register";
//   static String sellForgetPass = baseUrl + "/user/seller/forget";
//   static String sellForgetPassVerify = baseUrl + "/user/seller/forget/verify";
//   static String searchPinCodeBy =
//       "https://pincode.saratchandra.in/api/pincode/";
//   static String searchSecondPinCodeBy = "http://postalpincode.in/api/pincode/";

//   static String deliveryAddress = baseUrl + "/order/address";

//   static String order = baseUrl + "/order/";

//   static String payment = baseUrl + "/order/payment";

//   static String sellerDash = baseUrl + "/dashboard/seller";
//   static String sellerShopDash = baseUrl + "/dashboard/?id=";

//   static String premiumSeller = baseUrl + "/user/seller/premium";

//   static String singleSeller = baseUrl + "/user/seller/premium?id=";
//   static String followUser = baseUrl + "/social/follow";
//   static String followingGetUser = baseUrl + "/social/follow";
//   static String followerSellerGet = baseUrl + "/social/follow/get";

//   static String addToCart = baseUrl + "/order/cart";
//   static String getCartItems = baseUrl + "/order/cart";
//   static String removeCartItems = baseUrl + "/order/cart/remove";
//   static String getOrderAdd = baseUrl + "/order/address";
//   static String memberSignUp = baseUrl + "/team/member/register";
//   static String memberOtpVerify = baseUrl + "/team/member/register/verify";
//   static String memberLogin = baseUrl + "/team/member/login";
//   static String forgetMemberPassword = baseUrl + "/team/member/forget";
//   static String frogetMemberPasswordVerify =
//       baseUrl + "/team/member/forget/verify";
//   static String getTeamMemer = baseUrl + "/team/member";
//   static String removeMember = baseUrl + "/team/member/remove";

//   static String productspecs = baseUrl + "/products/?id=";

//   static String teamProduct = baseUrl + "/team/product/get";

//   static String orderSeller = baseUrl + "/order/seller";
//   static String sellerProfileGet = baseUrl + "/user/seller/profile";
//   static String sellerProfileUpdate = baseUrl + "/form/seller/update";
//   static String sellerDocumentGet = baseUrl + "/form/document";
//   static String sellerProfilePicUpdate =
//       baseUrl + "/user/seller/profile/update";

//   static String memberProductPost = baseUrl + "/products/member/post";
//   static String productPost = baseUrl + "/products/post";

//   static String sellerOrderPlaced = baseUrl + "/order/seller?status=placed";
//   static String sellerOrder = baseUrl + "/order/seller";
//   static String sellerOrderPending = baseUrl + "/order/seller?status=pending";
//   static String sellerOrderDelevered =
//       baseUrl + "/order/seller?status=delivered";
//   static String sellerOrderShiped = baseUrl + "/order/seller?status=shipped";
//   static String postUserReturn = baseUrl + "/order/return";
//   static String getUserReturn = baseUrl + "/order/return";
//   static String singleOrderSeller = baseUrl + "/order/seller?id=";

//   static String userAllOrder = baseUrl + "/order/";
//   static String userPendingOrder = baseUrl + "/order/?status=pending";
//   static String userPlacedOrder = baseUrl + "/order/?status=placed";
//   static String userDeliveredOrder = baseUrl + "/order/?status=delivered";
//   static String userShipedOrder = baseUrl + "/order/?status=shipped";

//   static String sellerReturnGet = baseUrl + "/order/return/seller";
//   static String storyUpdatebySeller = baseUrl + "/social/story";
//   static String getSellerStory = baseUrl + "/social/story";
//   static String getUserStory = baseUrl + "/social/user/story";
//   static String getSellerProducts = baseUrl + "/dashboard/?id=";
//   static String getSellerStoryProducts = baseUrl + "/products/shop/search?id=";
//   static String getSellerAds = baseUrl + "/adv";
//   static String getSellerHomeAds = baseUrl + "/adv/get";
//   static String addImages = baseUrl + "/img";
//   static String advertismentHome = baseUrl + "/adv/home";
//   static String sellerPendingReturnGet =
//       baseUrl + "/order/return/search?search=pending";
//   static String sellerApprovedReturnGet =
//       baseUrl + "/order/return/search?search=approved";
//   static String getNotification = baseUrl + "/notify/";

//   static String kycAdvertisment = baseUrl + "/adv/kyc/get";
//   static String productImageUpload = baseUrl + "/products/images";

//   static String getNewArrival = baseUrl + "/products/search?search=";
// }


class EndPoint {
  static String baseUrl =
   "http://15.207.51.141";
 // "https://digitalkarobar.aiovu.com";

  static String registration = baseUrl + "/user/register";
  static String phoneNumber = baseUrl + "/user/number";
  static String verification = baseUrl + "/user/verify";
  static String termCondition = baseUrl + "/user/terms";
  static String login = baseUrl + "/user/login";
  static String loginOtpVerify = baseUrl + "/user/login/verify";
  static String acceptTc = baseUrl + "/user/accept";
  static String categories = baseUrl + "/products/categories";
  static String topcategories = baseUrl + "/products/categories/top";
  static String brand = baseUrl + "/products/brands";
  static String topbrand = baseUrl + "/products/brands/top";
  static String userProfile = baseUrl + "/user/profile";
  static String updateProfile = baseUrl + "/user/profile/pic/update";
  static String productget = baseUrl + "/products/get";
  static String updateKyc = baseUrl + "/user/kyc/update";
  static String getKyc = baseUrl + "/user/kyc";
  static String profilePic = baseUrl + "/user/profile/pic/update";
  static String searchProducts = baseUrl + "/products/search?search=";
  static String productsDetails = baseUrl + "/products/get?id=";
  static String productsFilter = baseUrl + "/products/filter";
  static String chatMessaageSend = baseUrl + "/chat/message";
  static String chatmessaageget = baseUrl + "/chat/message/get";

  static String filterproduct = baseUrl + "/products/filter?";
  static String subCategories = baseUrl + "/products/sub";
  static String topBrandAccordingToSub = baseUrl + "/products/sub/brands/top";
  static String topProductsToSub = baseUrl + "/products/sub/top";

  static String getFavorite = baseUrl + "/products/favorites";

  static String sellSignup = baseUrl + "/user/seller/register";
  static String sellVerify = baseUrl + "/user/seller/verify";
  static String sellLogin = baseUrl + "/user/seller/login";
  static String postFavorite = baseUrl + "/products/favorites";
  static String removeFavorite = baseUrl + "/products/favorites/remove";

  static String formDetail = baseUrl + "/form/details";

  static String allStates = baseUrl + "/location/state";
  static String getCities = baseUrl + "/location/city?search=";

  static String uploadDoc = baseUrl + "/form/doc";

  static String pickupDetails = baseUrl + "/form/pickup";

  static String formbank = baseUrl + "/form/bank";
  static String brandRegister = baseUrl + "/products/brand/register";
  static String sellForgetPass = baseUrl + "/user/seller/forget";
  static String sellForgetPassVerify = baseUrl + "/user/seller/forget/verify";
  static String searchPinCodeBy =
      "https://pincode.saratchandra.in/api/pincode/";
  static String searchSecondPinCodeBy = "http://postalpincode.in/api/pincode/";

  static String deliveryAddress = baseUrl + "/order/address";

  static String order = baseUrl + "/order/";

  static String payment = baseUrl + "/order/payment";

  static String sellerDash = baseUrl + "/dashboard/seller";
  static String sellerShopDash = baseUrl + "/dashboard/?id=";

  static String premiumSeller = baseUrl + "/user/seller/premium";

  static String singleSeller = baseUrl + "/user/seller/premium?id=";
  static String followUser = baseUrl + "/social/follow";
  static String followingGetUser = baseUrl + "/social/follow";
  static String followerSellerGet = baseUrl + "/social/follow/get";

  static String addToCart = baseUrl + "/order/cart";
  static String getCartItems = baseUrl + "/order/cart";
  static String removeCartItems = baseUrl + "/order/cart/remove";
  static String getOrderAdd = baseUrl + "/order/address";
  static String memberSignUp = baseUrl + "/team/member/register";
  static String memberOtpVerify = baseUrl + "/team/member/register/verify";
  static String memberLogin = baseUrl + "/team/member/login";
  static String forgetMemberPassword = baseUrl + "/team/member/forget";
  static String frogetMemberPasswordVerify =
      baseUrl + "/team/member/forget/verify";
  static String getTeamMemer = baseUrl + "/team/member";
  static String removeMember = baseUrl + "/team/member/remove";

  static String productspecs = baseUrl + "/products/?id=";

  static String teamProduct = baseUrl + "/team/product/get";

  static String orderSeller = baseUrl + "/order/seller";
  static String sellerProfileGet = baseUrl + "/user/seller/profile";
  static String sellerProfileUpdate = baseUrl + "/form/seller/update";
  static String sellerDocumentGet = baseUrl + "/form/document";
  static String sellerProfilePicUpdate =
      baseUrl + "/user/seller/profile/update";

  static String memberProductPost = baseUrl + "/products/member/post";
  static String productPost = baseUrl + "/products/post";

  static String sellerOrderPlaced = baseUrl + "/order/seller?status=placed";
  static String sellerOrder = baseUrl + "/order/seller";
  static String sellerOrderPending = baseUrl + "/order/seller?status=pending";
  static String sellerOrderDelevered =
      baseUrl + "/order/seller?status=delivered";
  static String sellerOrderShiped = baseUrl + "/order/seller?status=shipped";
  static String postUserReturn = baseUrl + "/order/return";
  static String getUserReturn = baseUrl + "/order/return";
  static String singleOrderSeller = baseUrl + "/order/seller?id=";

  static String userAllOrder = baseUrl + "/order/";
  static String userPendingOrder = baseUrl + "/order/?status=pending";
  static String userPlacedOrder = baseUrl + "/order/?status=placed";
  static String userDeliveredOrder = baseUrl + "/order/?status=delivered";
  static String userShipedOrder = baseUrl + "/order/?status=shipped";

  static String sellerReturnGet = baseUrl + "/order/return/seller";
  static String storyUpdatebySeller = baseUrl + "/social/story";
  static String getSellerStory = baseUrl + "/social/story";
  static String getUserStory = baseUrl + "/social/user/story";
  static String getSellerProducts = baseUrl + "/dashboard/?id=";
  static String getSellerStoryProducts = baseUrl + "/products/shop/search?id=";
  static String getSellerAds = baseUrl + "/adv";
  static String getSellerHomeAds = baseUrl + "/adv/get";
  static String addImages = baseUrl + "/img";
  static String advertismentHome = baseUrl + "/adv/home";
  static String sellerPendingReturnGet =
      baseUrl + "/order/return/search?search=pending";
  static String sellerApprovedReturnGet =
      baseUrl + "/order/return/search?search=approved";
  static String getNotification = baseUrl + "/notify/";

  static String kycAdvertisment = baseUrl + "/adv/kyc/get";
  static String productImageUpload = baseUrl + "/products/images";

  static String getNewArrival = baseUrl + "/products/search?search=";
}