class FilteridProducts {
  int id;
  String title;
  String shop;
  String userid;
  String location;
  String categoryId;
  String subCategoryId;
  String brandId;
  int discount;
  int retail;
  String image1;
  String image2;
  String image3;
  String image4;
  String image5;
  int prize;
  List<String> specs;
  List<String> highlights;
  List<String> features;
  String description;
  int buy;
  String rating;
  bool popular;

  FilteridProducts(
      {this.id,
      this.title,
      this.shop,
      this.userid,
      this.location,
      this.categoryId,
      this.subCategoryId,
      this.brandId,
      this.discount,
      this.retail,
      this.image1,
      this.image2,
      this.image3,
      this.image4,
      this.image5,
      this.prize,
      this.specs,
      this.highlights,
      this.features,
      this.description,
      this.buy,
      this.rating,
      this.popular});

  FilteridProducts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['Title'];
    shop = json['Shop'];
    userid = json['Userid'];
    location = json['Location'];
    categoryId = json['Category_id'];
    subCategoryId = json['SubCategory_id'];
    brandId = json['Brand_id'];
    discount = json['Discount'];
    retail = json['Retail'];
    image1 = json['Image1'];
    image2 = json['Image2'];
    image3 = json['Image3'];
    image4 = json['Image4'];
    image5 = json['Image5'];
    prize = json['Prize'];
    specs = json['Specs'].cast<String>();
    highlights = json['Highlights'].cast<String>();
    features = json['features'].cast<String>();
    description = json['Description'];
    buy = json['Buy'];
    rating = json['rating'];
    popular = json['Popular'];
  }
}
