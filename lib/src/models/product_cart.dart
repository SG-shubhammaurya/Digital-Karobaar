

class ProductCart {
  List<Cart> data = [];
  int delivery;
  ProductCart({this.data, this.delivery});

  ProductCart.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Cart>();
      json['data'].forEach((v) {
        data.add(Cart.fromJson(v));
      });
    }
    delivery = json['delivery'];
  }
}

class Cart {
  int id;
  String title;
  var discount;
  int retail;
  String image1;
  int price;
  int perItemsPrice = 0;
  int delivery;
 var gst;
  int sellerId;
  int quantity;
  int initQuantity;
  var perItemTotal;

  Cart(
      {this.id,
      this.title,
      this.discount,
      this.price,
      this.retail,
      this.image1,
      this.delivery,
      this.gst,
      this.sellerId,this.quantity});

  Cart.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['Title'];
    discount = json['Discount'];
    price = json['Price'];
    retail = json['Retail'];
    image1 = json['Image1'];
    delivery = json['Delivery'];
    gst = json['GST'];
    sellerId = json['Seller'];
    quantity = json['minBuy'];
    initQuantity = json['minBuy'];
  }
}
