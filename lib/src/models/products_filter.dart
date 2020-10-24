class ProductsFilter {
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
  List<Specs> specs;
  List<Highlights> highlights;
  List<Features> features;
  String description;
  int buy;
  String rating;
  bool popular;

  ProductsFilter(
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

  ProductsFilter.fromJson(Map<String, dynamic> json) {
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
    if (json['Specs'] != null) {
      specs = new List<Specs>();
      json['Specs'].forEach((v) {
        specs.add(new Specs.fromJson(v));
      });
    }
    if (json['Highlights'] != null) {
      highlights = new List<Highlights>();
      json['Highlights'].forEach((v) {
        highlights.add(new Highlights.fromJson(v));
      });
    }
    if (json['features'] != null) {
      features = new List<Features>();
      json['features'].forEach((v) {
        features.add(new Features.fromJson(v));
      });
    }
    description = json['Description'];
    buy = json['Buy'];
    rating = json['rating'];
    popular = json['Popular'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Title'] = this.title;
    data['Shop'] = this.shop;
    data['Userid'] = this.userid;
    data['Location'] = this.location;
    data['Category_id'] = this.categoryId;
    data['SubCategory_id'] = this.subCategoryId;
    data['Brand_id'] = this.brandId;
    data['Discount'] = this.discount;
    data['Retail'] = this.retail;
    data['Image1'] = this.image1;
    data['Image2'] = this.image2;
    data['Image3'] = this.image3;
    data['Image4'] = this.image4;
    data['Image5'] = this.image5;
    data['Prize'] = this.prize;
    if (this.specs != null) {
      data['Specs'] = this.specs.map((v) => v.toJson()).toList();
    }
    if (this.highlights != null) {
      data['Highlights'] = this.highlights.map((v) => v.toJson()).toList();
    }
    if (this.features != null) {
      data['features'] = this.features.map((v) => v.toJson()).toList();
    }
    data['Description'] = this.description;
    data['Buy'] = this.buy;
    data['rating'] = this.rating;
    data['Popular'] = this.popular;
    return data;
  }
}

class Specs {
  String color;
  String model;
  String processor;

  Specs({this.color, this.model, this.processor});

  Specs.fromJson(Map<String, dynamic> json) {
    color = json['color'];
    model = json['model'];
    processor = json['processor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['color'] = this.color;
    data['model'] = this.model;
    data['processor'] = this.processor;
    return data;
  }
}

class Features {
  String color;
  String model;
  String processor;

  Features({this.color, this.model, this.processor});

  Features.fromJson(Map<String, dynamic> json) {
    color = json['color'];
    model = json['model'];
    processor = json['processor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['color'] = this.color;
    data['model'] = this.model;
    data['processor'] = this.processor;
    return data;
  }
}

class Highlights {
  String color;
  String model;
  String processor;

  Highlights({this.color, this.model, this.processor});

  Highlights.fromJson(Map<String, dynamic> json) {
    color = json['color'];
    model = json['model'];
    processor = json['processor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['color'] = this.color;
    data['model'] = this.model;
    data['processor'] = this.processor;
    return data;
  }
}
