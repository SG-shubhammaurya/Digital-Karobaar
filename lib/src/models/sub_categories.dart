class SubCategory {
  String title;
  String image;
  String category;

  SubCategory({this.title, this.image, this.category});

  SubCategory.fromJson(Map<String, dynamic> json) {
    title = json['Title'];
    image = json['Image'];
    category = json['Category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Title'] = this.title;
    data['Image'] = this.image;
    data['Category'] = this.category;
    return data;
  }
}