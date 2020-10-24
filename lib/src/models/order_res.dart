class OrderResponce {
  List<int> id;
  List<Failed> failed;

  OrderResponce({this.id, this.failed});

  OrderResponce.fromJson(Map<String, dynamic> json) {
    id = json['id'].cast<int>();
    if (json['failed'] != null) {
      failed = new List<Failed>();
      json['failed'].forEach((v) {
        failed.add(new Failed.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.failed != null) {
      data['failed'] = this.failed.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Failed {
  int productId;
  String orderAddress;
  int quantity;
  int amount;
  int paidAmount;
  String method;

  Failed(
      {this.productId,
      this.orderAddress,
      this.quantity,
      this.amount,
      this.paidAmount,
      this.method});

  Failed.fromJson(Map<String, dynamic> json) {
    productId = json['ProductId'];
    orderAddress = json['OrderAddress'];
    quantity = json['Quantity'];
    amount = json['Amount'];
    paidAmount = json['Paid_Amount'];
    method = json['method'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ProductId'] = this.productId;
    data['OrderAddress'] = this.orderAddress;
    data['Quantity'] = this.quantity;
    data['Amount'] = this.amount;
    data['Paid_Amount'] = this.paidAmount;
    data['method'] = this.method;
    return data;
  }
}