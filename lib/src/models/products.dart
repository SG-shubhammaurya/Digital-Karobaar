class Products {
  int id;
  String title;
  String shop;
  String location;
  int discount;
  int retail;
  String image1;
  String image2;
  String image3;
  String image4;
  String image5;
  int prize;
  String description;
  int buy;
  String rating;
  bool popular;
  int sellerId;
  String category;
  String subCategory;
  String brand;
  num numOfItems;

  Products(
      {this.id,
      this.title,
      this.shop,
      this.location,
      this.discount,
      this.retail,
      this.image1,
      this.image2,
      this.image3,
      this.image4,
      this.image5,
      this.prize,
      this.description,
      this.buy,
      this.rating,
      this.popular,
      this.sellerId,
      this.category,
      this.subCategory,
      this.brand});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['Title'];
    shop = json['Shop'];
    location = json['Location'];
    discount = json['Discount'];
    retail = json['Retail'];
    image1 = json['Image1'];
    image2 = json['Image2'];
    image3 = json['Image3'];
    image4 = json['Image4'];
    image5 = json['Image5'];
    prize = json['Prize'];
    description = json['Description'];
    buy = json['Buy'];
    rating = json['rating'];
    popular = json['Popular'];
    sellerId = json['SellerId'];
    category = json['Category'];
    subCategory = json['SubCategory'];
    brand = json['Brand'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Title'] = this.title;
    data['Shop'] = this.shop;
    data['Location'] = this.location;
    data['Discount'] = this.discount;
    data['Retail'] = this.retail;
    data['Image1'] = this.image1;
    data['Image2'] = this.image2;
    data['Image3'] = this.image3;
    data['Image4'] = this.image4;
    data['Image5'] = this.image5;
    data['Prize'] = this.prize;
    data['Description'] = this.description;
    data['Buy'] = this.buy;
    data['rating'] = this.rating;
    data['Popular'] = this.popular;
    data['SellerId'] = this.sellerId;
    data['Category'] = this.category;
    data['SubCategory'] = this.subCategory;
    data['Brand'] = this.brand;
    return data;
  }
}

