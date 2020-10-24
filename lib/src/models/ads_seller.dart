class AdsSeller {
  List<DataAds> data;

  AdsSeller({this.data});

  AdsSeller.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<DataAds>();
      json['data'].forEach((v) {
        data.add(new DataAds.fromJson(v));
      });
    }
  }
}

class DataAds{
  int seller;
  String pic;
  String companyName;

  DataAds({this.seller, this.pic, this.companyName});

  DataAds.fromJson(Map<String, dynamic> json) {
    seller = json['Seller'];
    pic = json['Pic'];
    companyName = json['Company_Name'];
  }
}