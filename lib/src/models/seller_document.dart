class SellerDocument {
  List<Document> data;

  SellerDocument({this.data});

  SellerDocument.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Document>();
      json['data'].forEach((v) {
        data.add(new Document.fromJson(v));
      });
    }
  }

}

class Document {
  int id;
  int sellerDetailIdId;
  String number;
  String document;
  String sign;

  Document({this.id, this.sellerDetailIdId, this.number, this.document, this.sign});

  Document.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sellerDetailIdId = json['SellerDetailId_id'];
    number = json['number'];
    document = json['document'];
    sign = json['sign'];
  }

}