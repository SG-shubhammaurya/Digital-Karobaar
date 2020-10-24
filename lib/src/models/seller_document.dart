// class SellerDocument {
//   List<Data> data;

//   SellerDocument({this.data});

//   SellerDocument.fromJson(Map<String, dynamic> json) {
//     if (json['data'] != null) {
//       data = new List<Data>();
//       json['data'].forEach((v) {
//         data.add(new Data.fromJson(v));
//       });
//     }
//   }

// }

// class Data {
//   int id;
//   int sellerDetailIdId;
//   String number;
//   String document;
//   String sign;

//   Data({this.id, this.sellerDetailIdId, this.number, this.document, this.sign});

//   Data.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     sellerDetailIdId = json['SellerDetailId_id'];
//     number = json['number'];
//     document = json['document'];
//     sign = json['sign'];
//   }

// }


class SellerDocument {
  List<Data> data;

  SellerDocument({this.data});

  SellerDocument.fromJson(Map<String, dynamic> json) {
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
  int id;
  String number;
  String document;
  String sign;

  Data({this.id, this.number, this.document, this.sign});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    number = json['number'];
    document = json['document'];
    sign = json['sign'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['number'] = this.number;
    data['document'] = this.document;
    data['sign'] = this.sign;
    return data;
  }
}