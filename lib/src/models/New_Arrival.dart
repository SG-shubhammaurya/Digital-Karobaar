class NewArrival {
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
  int delivery;
  int sellerId;
  String category;
  String subCategory;
  String brand;
  NewArrival(
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
      this.delivery,
      this.sellerId,
      this.category,
      this.subCategory,
      this.brand});
  NewArrival.fromJson(Map<String, dynamic> json) {
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
    delivery = json['Delivery'];
    sellerId = json['SellerId'];
    category = json['Category'];
    subCategory = json['SubCategory'];
    brand = json['Brand'];
  }
}