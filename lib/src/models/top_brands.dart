class TopBrands {
  String title;
  String image;
  String top;
  String category;

  TopBrands({this.title, this.image, this.top, this.category});

  TopBrands.fromJson(Map<String, dynamic> json) {
    title = json['Title'];
    image = json['Image'];
    top = json['Top'];
    category = json['Category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Title'] = this.title;
    data['Image'] = this.image;
    data['Top'] = this.top;
    data['Category'] = this.category;
    return data;
  }
}