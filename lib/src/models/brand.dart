class Brand {
  String title;
  String image;
  String top;
  String status;
  int by;
  String category;

  Brand(
      {this.title, this.image, this.top, this.status, this.by, this.category});

  Brand.fromJson(Map<String, dynamic> json) {
    title = json['Title'];
    image = json['Image'];
    top = json['Top'];
    status = json['status'];
    by = json['By'];
    category = json['Category'];
  }
}