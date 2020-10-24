class TopProducts {
  int id;
  String title;
  String image;
  String top;

  TopProducts({this.id, this.title, this.image, this.top});

  TopProducts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['Title'];
    image = json['Image'];
    top = json['Top'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Title'] = this.title;
    data['Image'] = this.image;
    data['Top'] = this.top;
    return data;
  }
}