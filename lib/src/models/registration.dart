class Registration {
  int id;
  String name;
  String business;
  int pinCode;

  Registration({this.id, this.name, this.business, this.pinCode});

  Registration.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['Name'];
    business = json['Business'];
    pinCode = json['PinCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Name'] = this.name;
    data['Business'] = this.business;
    data['PinCode'] = this.pinCode;
    return data;
  }
}
