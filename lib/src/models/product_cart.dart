class ProductCart {
  List<Cart> data;

  ProductCart({this.data});

  ProductCart.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Cart>();
      json['data'].forEach((v) {
        data.add(new Cart.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Cart {
  int id;
  String title;
  int discount;
  int retail;
  String image1;
  int quantity=1;

  Cart({this.id, this.title, this.discount, this.retail, this.image1,this.quantity});

  Cart.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['Title'];
    discount = json['Discount'];
    retail = json['Retail'];
    image1 = json['Image1'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Title'] = this.title;
    data['Discount'] = this.discount;
    data['Retail'] = this.retail;
    data['Image1'] = this.image1;
    return data;
  }
}
