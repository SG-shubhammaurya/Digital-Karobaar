class SellerStory {
  int id;
  String image;
  String video;
  String text;
  String status;
  int seller;

  SellerStory(
      {this.id, this.image, this.video, this.text, this.status, this.seller});

  SellerStory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['Image'];
    video = json['Video'];
    text = json['Text'];
    status = json['Status'];
    seller = json['Seller'];
  }
}