class PinCodeByState {
  String message;
  String status;
  List<PostOffice> postOffice = [];

  PinCodeByState({this.message, this.status, this.postOffice});

  PinCodeByState.fromJson(Map<String, dynamic> json) {
    message = json['Message'];
    status = json['Status'];
    if (json['PostOffice'] != null) {
      postOffice = new List<PostOffice>();
      json['PostOffice'].forEach((v) {
        postOffice.add(new PostOffice.fromJson(v));
      });
    }
  }
}

class PostOffice {
  String name;
  String description;
  String branchType;
  String deliveryStatus;
  String taluk;
  String circle;
  String district;
  String division;
  String region;
  String state;
  String country;

  PostOffice(
      {this.name,
      this.description,
      this.branchType,
      this.deliveryStatus,
      this.taluk,
      this.circle,
      this.district,
      this.division,
      this.region,
      this.state,
      this.country});

  PostOffice.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    description = json['Description'];
    branchType = json['BranchType'];
    deliveryStatus = json['DeliveryStatus'];
    taluk = json['Taluk'];
    circle = json['Circle'];
    district = json['District'];
    division = json['Division'];
    region = json['Region'];
    state = json['State'];
    country = json['Country'];
  }
}