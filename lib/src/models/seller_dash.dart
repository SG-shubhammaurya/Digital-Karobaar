class SellerDash {
  Profile profile;
  int followers;
  int products;
  List<Product> product;
  List<Brands> brands;
  int minimum;
  int maximum;
  String dispatch;
  int customers;
  String image;

  SellerDash(
      {this.profile,
      this.followers,
      this.products,
      this.product,
      this.brands,
      this.minimum,
      this.maximum,
      this.dispatch,
      this.customers,
      this.image});

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
    dispatch = json['Dispatch'];
    customers = json['customers'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.profile != null) {
      data['profile'] = this.profile.toJson();
    }
    data['followers'] = this.followers;
    data['products'] = this.products;
    if (this.product != null) {
      data['product'] = this.product.map((v) => v.toJson()).toList();
    }
    if (this.brands != null) {
      data['brands'] = this.brands.map((v) => v.toJson()).toList();
    }
    data['minimum'] = this.minimum;
    data['maximum'] = this.maximum;
    data['Dispatch'] = this.dispatch;
    data['customers'] = this.customers;
    data['image'] = this.image;
    return data;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['profile'] = this.profile;
    data['name'] = this.name;
    return data;
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
  var gST;
  var discount;
  var retail;
  String image1;
  String image2;
  String image3;
  String image4;
  String image5;
  var prize;
  String description;
  var buy;
  String rating;
  bool popular;
  var delivery;

  Product(
      {this.id,
      this.title,
      this.shop,
      this.sellerIdId,
      this.location,
      this.categoryId,
      this.subCategoryId,
      this.brandId,
      this.gST,
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
      this.delivery});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['Title'];
    shop = json['Shop'];
    sellerIdId = json['SellerId_id'];
    location = json['Location'];
    categoryId = json['Category_id'];
    subCategoryId = json['SubCategory_id'];
    brandId = json['Brand_id'];
    gST = json['GST'];
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Title'] = this.title;
    data['Shop'] = this.shop;
    data['SellerId_id'] = this.sellerIdId;
    data['Location'] = this.location;
    data['Category_id'] = this.categoryId;
    data['SubCategory_id'] = this.subCategoryId;
    data['Brand_id'] = this.brandId;
    data['GST'] = this.gST;
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
    data['Delivery'] = this.delivery;
    return data;
  }
}

class Brands {
  String title;
  String image;
  String top;
  String categoryId;
  String status;
  int byId;

  Brands(
      {this.title,
      this.image,
      this.top,
      this.categoryId,
      this.status,
      this.byId});

  Brands.fromJson(Map<String, dynamic> json) {
    title = json['Title'];
    image = json['Image'];
    top = json['Top'];
    categoryId = json['Category_id'];
    status = json['status'];
    byId = json['By_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Title'] = this.title;
    data['Image'] = this.image;
    data['Top'] = this.top;
    data['Category_id'] = this.categoryId;
    data['status'] = this.status;
    data['By_id'] = this.byId;
    return data;
  }
}
