class SellerDash {
  Profile profile;
  int followers;
  int products;
  List<Product> product;
  List<Brands> brands;
  int minimum;
  int maximum;
  int customers;

 SellerDash(
      {this.profile,
      this.followers,
      this.products,
      this.product,
      this.brands,
      this.minimum,
      this.maximum,
      this.customers});

  SellerDash.fromJson(Map<String, dynamic> json) {
    profile =
        json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
    followers = json['followers'];
    products = json['products'];
    if (json['product'] != null) {
      product = new List<Product>();
      json['product'].forEach((v) {
        product.add(new Product.fromJson(v));
      });
    }
    if (json['brands'] != null) {
      brands = new List<Brands>();
      json['brands'].forEach((v) {
        brands.add(new Brands.fromJson(v));
      });
    }
    minimum = json['minimum'];
    maximum = json['maximum'];
    customers = json['customers'];
  }
}

class Profile {
  String profile;
  String name;

  Profile({this.profile, this.name});

  Profile.fromJson(Map<String, dynamic> json) {
    profile = json['profile'];
    name = json['name'];
  }
}

class Product {
  int id;
  String title;
  String shop;
  int sellerIdId;
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
  String description;
  int buy;
  String rating;
  bool popular;

  Product(
      {this.id,
      this.title,
      this.shop,
      this.sellerIdId,
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
      this.description,
      this.buy,
      this.rating,
      this.popular});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['Title'];
    shop = json['Shop'];
    sellerIdId = json['SellerId_id'];
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
    description = json['Description'];
    buy = json['Buy'];
    rating = json['rating'];
    popular = json['Popular'];
  }
}

class Brands {
  String title;
  String image;
  String top;
  String status;
  String by;
  String category;

  Brands(
      {this.title, this.image, this.top, this.status, this.by, this.category});

  Brands.fromJson(Map<String, dynamic> json) {
    title = json['Title'];
    image = json['Image'];
    top = json['Top'];
    status = json['status'];
    by = json['By'];
    category = json['Category'];
  }
}
