class CrouselAdd {
  List<Data> data;

  CrouselAdd({this.data});

  CrouselAdd.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int seller;
  String pic;
  String companyName;

  Data({this.seller, this.pic, this.companyName});

  Data.fromJson(Map<String, dynamic> json) {
    seller = json['Seller'];
    pic = json['Pic'];
    companyName = json['Company_Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Seller'] = this.seller;
    data['Pic'] = this.pic;
    data['Company_Name'] = this.companyName;
    return data;
  }
}