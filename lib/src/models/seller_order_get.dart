class SellerAllOrderGet {
  int id;
  String productId;
  String quantity;
  String when;
  String amount;
  String paidAmount;
  bool paid;
  String method;
  String remaining;
  String status;
  int user;
  int orderAddress;
  SellerAllOrderGet(
      {this.id,
      this.productId,
      this.quantity,
      this.when,
      this.amount,
      this.paidAmount,
      this.paid,
      this.method,
      this.remaining,
      this.status,
      this.user,
      this.orderAddress});
  SellerAllOrderGet.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['ProductId'];
    quantity = json['Quantity'];
    when = json['When'];
    amount = json['Amount'];
    paidAmount = json['Paid_Amount'];
    paid = json['Paid'];
    method = json['Method'];
    remaining = json['Remaining'];
    status = json['status'];
    user = json['User'];
    orderAddress = json['OrderAddress'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ProductId'] = this.productId;
    data['Quantity'] = this.quantity;
    data['When'] = this.when;
    data['Amount'] = this.amount;
    data['Paid_Amount'] = this.paidAmount;
    data['Paid'] = this.paid;
    data['Method'] = this.method;
    data['Remaining'] = this.remaining;
    data['status'] = this.status;
    data['User'] = this.user;
    data['OrderAddress'] = this.orderAddress;
    return data;
  }
}
