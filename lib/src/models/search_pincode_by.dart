class SearcPinCodeBY {
  //int status;
  List<Data> data = [];

  SearcPinCodeBY({this.data});

  SearcPinCodeBY.fromJson(Map<String, dynamic> json) {
  //  status = json['status'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }
}

class Data {
  String pincode;
  String officeName;
  String deliveryStatus;
  String divisionName;
  String regionName;
  String circleName;
  String district;
  String stateName;
  String taluk;

  Data(
      {this.pincode,
      this.officeName,
      this.deliveryStatus,
      this.divisionName,
      this.regionName,
      this.circleName,
      this.district,
      this.stateName,
      this.taluk});

  Data.fromJson(Map<String, dynamic> json) {
    pincode = json['pincode'];
    officeName = json['office_name'];
    deliveryStatus = json['delivery_status'];
    divisionName = json['division_name'];
    regionName = json['region_name'];
    circleName = json['circle_name'];
    district = json['district'];
    stateName = json['state_name'];
    taluk = json['taluk'];
  }
}
