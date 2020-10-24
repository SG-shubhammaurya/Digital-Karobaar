class SellerOrder {
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

  SellerOrder(
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

  SellerOrder.fromJson(Map<String, dynamic> json) {
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
}
