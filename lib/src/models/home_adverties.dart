class HomeAdvertisment {
  DataAdd data;
  DataAdd x;
  DataAdd y;
  HomeAdvertisment({this.data, this.x, this.y});
  HomeAdvertisment.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new DataAdd.fromJson(json['data']) : null;
    x = json['x'] != null ? new DataAdd.fromJson(json['x']) : null;
    y = json['y'] != null ? new DataAdd.fromJson(json['y']) : null;
  }
}

class DataAdd {
  int seller;
  String pic;
  DataAdd({this.seller, this.pic});
  DataAdd.fromJson(Map<String, dynamic> json) {
    seller = json['Seller'];
    pic = json['Pic'];
  }
}


// class HomeAdvertisment {
//   List<Data> data;

//   HomeAdvertisment({this.data});

//   HomeAdvertisment.fromJson(Map<String, dynamic> json) {
//     if (json['data'] != null) {
//       data = new List<Data>();
//       json['data'].forEach((v) {
//         data.add(new Data.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.data != null) {
//       data['data'] = this.data.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Data {
//   int seller;
//   String pic;
//   String companyName;

//   Data({this.seller, this.pic, this.companyName});

//   Data.fromJson(Map<String, dynamic> json) {
//     seller = json['Seller'];
//     pic = json['Pic'];
//     companyName = json['Company_Name'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['Seller'] = this.seller;
//     data['Pic'] = this.pic;
//     data['Company_Name'] = this.companyName;
//     return data;
//   }
// }