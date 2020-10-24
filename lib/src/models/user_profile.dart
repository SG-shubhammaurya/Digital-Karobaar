
class UserProfile {
  int id;
  int pinCode;
  String name;
  int phoneNo;
  String business;
  int oTP;
  String status;
  bool tAC;
  String profilePic;
  String email;

  UserProfile(
      {this.id,
      this.pinCode,
      this.name,
      this.phoneNo,
      this.business,
      this.oTP,
      this.status,
      this.tAC,
      this.profilePic,
      this.email});

  UserProfile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pinCode = json['PinCode'];
    name = json['Name'];
    phoneNo = json['PhoneNo'];
    business = json['Business'];
    oTP = json['OTP'];
    status = json['status'];
    tAC = json['TAC'];
    profilePic = json['ProfilePic'];
    email = json['Email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['PinCode'] = this.pinCode;
    data['Name'] = this.name;
    data['PhoneNo'] = this.phoneNo;
    data['Business'] = this.business;
    data['OTP'] = this.oTP;
    data['status'] = this.status;
    data['TAC'] = this.tAC;
    data['ProfilePic'] = this.profilePic;
    data['Email'] = this.email;
    return data;
  }
}