class NotificationApp {
  List<ProductNoti> product;
  List<SellerNoti> seller;
  NotificationApp({this.product, this.seller});
  NotificationApp.fromJson(Map<String, dynamic> json) {
    if (json['product'] != null) {
      product = new List<ProductNoti>();
      json['product'].forEach((v) {
        product.add(new ProductNoti.fromJson(v));
      });
    }
    if (json['seller'] != null) { 
      seller = new List<SellerNoti>();
      json['seller'].forEach((v) {
        seller.add(new SellerNoti.fromJson(v));
      });
    }
  }
 
}
class ProductNoti {
  int productId;
  String title;
  String image;
  String description;
  ProductNoti({this.productId, this.title, this.image, this.description});
  ProductNoti.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    title = json['Title'];
    image = json['Image'];
    description = json['Description'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['Title'] = this.title;
    data['Image'] = this.image;
    data['Description'] = this.description;
    return data;
  }
}
class SellerNoti {
  int sellerId;
  String title;
  String image;
  String description;
  SellerNoti({this.sellerId, this.title, this.image, this.description});
  SellerNoti.fromJson(Map<String, dynamic> json) {
    sellerId = json['seller_id'];
    title = json['Title'];
    image = json['Image'];
    description = json['Description'];
  }

}