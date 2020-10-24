class Member {
  int id;
  String phoneNo;
  String password;
  String status;
  int seller;

  Member(
      {this.id, this.phoneNo, this.password, this.status, this.seller});

  Member.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    phoneNo = json['PhoneNo'];
    password = json['Password'];
    status = json['status'];
    seller = json['Seller'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['PhoneNo'] = this.phoneNo;
    data['Password'] = this.password;
    data['status'] = this.status;
    data['Seller'] = this.seller;
    return data;
  }
}