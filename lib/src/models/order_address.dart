class OrderAddress {
  int id;
  int pincode;
  String address1;
  String address2;
  String landmark;
  String city;
  String state;
  int alternateMobile;

  OrderAddress(
      {this.id,
      this.pincode,
      this.address1,
      this.address2,
      this.landmark,
      this.city,
      this.state,
      this.alternateMobile});

  OrderAddress.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pincode = json['Pincode'];
    address1 = json['Address1'];
    address2 = json['Address2'];
    landmark = json['Landmark'];
    city = json['City'];
    state = json['State'];
    alternateMobile = json['AlternateMobile'];
  }

}
