class Categories {
  String title;
  String image;
  String top;

  Categories({this.title, this.image, this.top});

  Categories.fromJson(Map<String, dynamic> json) {
    title = json['Title'];
    image = json['Image'];
    top = json['Top'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Title'] = this.title;
    data['Image'] = this.image;
    data['Top'] = this.top;
    return data;
  }
}
