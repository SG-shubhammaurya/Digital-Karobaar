class PremiumSeller {
  List<Datas> data;
  Object id;
  PremiumSeller({this.data});
  PremiumSeller.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Datas>();
      json['data'].forEach((v) {
        data.add(new Datas.fromJson(v));
      });
    }
  }
}
class Datas {
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
  Datas(
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
  Datas.fromJson(Map<String, dynamic> json) {
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