class UserOrderGet {
  int id;
  String productId;
  String quantity;
  String when;
  String amount;
  String paidAmount;
  String method;
  String remaining;
  String status;
  UserOrderGet(
      {this.id,
      this.productId,
      this.quantity,
      this.when,
      this.amount,
      this.paidAmount,
      this.method,
      this.remaining,
      this.status});
  UserOrderGet.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['ProductId'];
    quantity = json['Quantity'];
    when = json['When'];
    amount = json['Amount'];
    paidAmount = json['Paid_Amount'];
    method = json['Method'];
    remaining = json['Remaining'];
    status = json['status'];
  }
}