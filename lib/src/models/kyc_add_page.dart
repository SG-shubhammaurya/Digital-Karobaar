class KycPageAdd {
  Data data;
  Data x;
  Data y;
  Data z;
  KycPageAdd({this.data, this.x, this.y, this.z});
  KycPageAdd.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    x = json['x'] != null ? new Data.fromJson(json['x']) : null;
    y = json['y'] != null ? new Data.fromJson(json['y']) : null;
    z = json['z'] != null ? new Data.fromJson(json['z']) : null;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    if (this.x != null) {
      data['x'] = this.x.toJson();
    }
    if (this.y != null) {
      data['y'] = this.y.toJson();
    }
    if (this.z != null) {
      data['z'] = this.z.toJson();
    }
    return data;
  }
}
class Data {
  int seller;
  String pic;
  Data({this.seller, this.pic});
  Data.fromJson(Map<String, dynamic> json) {
    seller = json['Seller'];
    pic = json['Pic'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Seller'] = this.seller;
    data['Pic'] = this.pic;
    return data;
  }
}