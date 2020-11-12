class ImageResponce {
  int id;
  String image;
  String image2;
  String image3;
  String image4;
  String image5;

  ImageResponce(
      {this.id,
      this.image,
      this.image2,
      this.image3,
      this.image4,
      this.image5});

  ImageResponce.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    image2 = json['image2'];
    image3 = json['image3'];
    image4 = json['image4'];
    image5 = json['image5'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['image2'] = this.image2;
    data['image3'] = this.image3;
    data['image4'] = this.image4;
    data['image5'] = this.image5;
    return data;
  }
}