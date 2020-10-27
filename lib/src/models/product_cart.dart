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
}

class Cart {
  int id;
  String title;
  int discount;
  int retail;
  String image1;
  int price;
  int quantity=1;
 var perItemsPrice = 0;
 var  remaining;
 var delivery;

  Cart({this.id, this.title, this.discount, this.retail, this.image1,this.quantity});

  Cart.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['Title'];
    discount = json['Discount'];
    retail = json['Retail'];
    image1 = json['Image1'];
    price = json['Price'];
   delivery = json['Delivery'];
  }
}