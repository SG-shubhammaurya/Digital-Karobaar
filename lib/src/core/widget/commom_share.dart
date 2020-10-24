class CommonShare{
  // void share(BuildContext context, String t) {
  //   Share.share(t);
  // }
  // //? The DynamicLink handled here====================================
  // Future handleDynamicLinks() async {
  //   // start from directly dynamic link.
  //   // when app opens from the link
  //   final PendingDynamicLinkData data =
  //       await FirebaseDynamicLinks.instance.getInitialLink();
  //   _handleDynamicLink(data);
  //   // Into foreground
  //   FirebaseDynamicLinks.instance.onLink(
  //       onSuccess: (PendingDynamicLinkData dynamicLinkData) async {
  //     _handleDynamicLink(dynamicLinkData);
  //   }, onError: (OnLinkErrorException error) async {
  //     print('Dynamic link failed: ${error.message}');
  //   });
  // }
  // Future<String> shareProfile(String id) async {
  //   final DynamicLinkParameters parameters = DynamicLinkParameters(
  //     uriPrefix: "https://digitalkarobaar.page.link",
  //     link: Uri.parse("https://digitalkarobaar.com/SellerShop?$id"),
  //     androidParameters: AndroidParameters(packageName: 'com.example.digitalkarobaar'),
  //   );
  //   final Uri dynamicUrl = await parameters.buildUrl();
  //   return dynamicUrl.toString();
  // }
  // void _handleDynamicLink(PendingDynamicLinkData data) {
  //   final Uri deepLink = data?.link;
  //   if (deepLink != null) {
  //     print('_handleDeepLink | deeplink: $deepLink');
  //   }
  // }
}