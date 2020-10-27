class HomeImages {
  int id;
  String image0;
  String image1;
  String image2;
  String image3;
  String orderIcon;
  String accountIcon;
  String autoPartIcon;
  String analyticsIcon;
  String advIcon;
  String brandIcon;
  String connectionIcon;
  String returnIcon;
  String footwearIcon;
  String stationaryIcon;
  String userProfileIcon;
  String businessProfileIcon;
  String productProfileIcon;
  String vayaparSuraksha;
  String placePoster;
  String businessSetting;
  String accountSetting;
  String vyaparSurakshaImage;
  String storyIcon;
  String productIcon;
  HomeImages(
      {this.id,
      this.image0,
      this.image1,
      this.image2,
      this.image3,
      this.orderIcon,
      this.accountIcon,
      this.autoPartIcon,
      this.analyticsIcon,
      this.advIcon,
      this.brandIcon,
      this.connectionIcon,
      this.returnIcon,
      this.footwearIcon,
      this.stationaryIcon,
      this.userProfileIcon,
      this.businessProfileIcon,
      this.productProfileIcon,
      this.vayaparSuraksha,
      this.placePoster,
      this.businessSetting,
      this.accountSetting,
      this.vyaparSurakshaImage,
      this.storyIcon,
      this.productIcon});
  HomeImages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image0 = json['image0'];
    image1 = json['image1'];
    image2 = json['image2'];
    image3 = json['image3'];
    orderIcon = json['order_icon'];
    accountIcon = json['account_icon'];
    autoPartIcon = json['auto_part_icon'];
    analyticsIcon = json['analytics_icon'];
    advIcon = json['adv_icon'];
    brandIcon = json['brand_icon'];
    connectionIcon = json['connection_icon'];
    returnIcon = json['return_icon'];
    footwearIcon = json['footwear_icon'];
    stationaryIcon = json['stationary_icon'];
    userProfileIcon = json['user_profile_icon'];
    businessProfileIcon = json['business_profile_icon'];
    productProfileIcon = json['product_profile_icon'];
    vayaparSuraksha = json['vayapar_suraksha'];
    placePoster = json['place_poster'];
    businessSetting = json['Business_setting'];
    accountSetting = json['account_setting'];
    vyaparSurakshaImage = json['vyapar_suraksha_image'];
    storyIcon = json['story_icon'];
    productIcon = json['product_icon'];
  }
  
}