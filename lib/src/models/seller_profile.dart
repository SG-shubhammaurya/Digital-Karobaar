class SellerProfile {
  List<Seller> seller;
  List<Detail> detail;
  SellerProfile({this.seller, this.detail});
  SellerProfile.fromJson(Map<String, dynamic> json) {
    if (json['seller'] != null) {
      seller = new List<Seller>();
      json['seller'].forEach((v) {
        seller.add(new Seller.fromJson(v));
      });
    }
    if (json['detail'] != null) {
      detail = new List<Detail>();
      json['detail'].forEach((v) {
        detail.add(new Detail.fromJson(v));
      });
    }
  }
}
class Seller {
  int id;
  String profile;
  int phoneNo;
  String password;
  String status;
  bool premium;
  Seller(
      {this.id,
      this.profile,
      this.phoneNo,
      this.password,
      this.status,
      this.premium});
  Seller.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    profile = json['Profile'];
    phoneNo = json['PhoneNo'];
    password = json['Password'];
    status = json['status'];
    premium = json['premium'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Profile'] = this.profile;
    data['PhoneNo'] = this.phoneNo;
    data['Password'] = this.password;
    data['status'] = this.status;
    data['premium'] = this.premium;
    return data;
  }
}
class Detail {
  int id;
  int sellerId;
  String companyName;
  String name;
  String email;
  int phone;
  String profile;
  String address1;
  String address2;
  int pinCode;
  String state;
  String city;
  Detail(
      {this.id,
      this.sellerId,
      this.companyName,
      this.name,
      this.email,
      this.phone,
      this.profile,
      this.address1,
      this.address2,
      this.pinCode,
      this.state,
      this.city});
  Detail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sellerId = json['Seller_id'];
    companyName = json['Company_Name'];
    name = json['Name'];
    email = json['Email'];
    phone = json['Phone'];
    profile = json['Profile'];
    address1 = json['Address1'];
    address2 = json['Address2'];
    pinCode = json['PinCode'];
    state = json['State'];
    city = json['City'];
  }
 
}