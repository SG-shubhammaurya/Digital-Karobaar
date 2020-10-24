class SellerReturnGet {
  int id;
  String message;
  String file;
  String status;
  int order;
  int seller;
  int user;
  SellerReturnGet(
      {this.id,
      this.message,
      this.file,
      this.status,
      this.order,
      this.seller,
      this.user});
  SellerReturnGet.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    message = json['Message'];
    file = json['File'];
    status = json['status'];
    order = json['Order'];
    seller = json['Seller'];
    user = json['User'];
  }

}