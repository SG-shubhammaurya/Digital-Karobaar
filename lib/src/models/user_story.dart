class UserStory {
  List<Stories> stories;

  UserStory({this.stories});

  UserStory.fromJson(Map<String, dynamic> json) {
    if (json['stories'] != null) {
      stories = new List<Stories>();
      json['stories'].forEach((v) {
        stories.add(new Stories.fromJson(v));
      });
    }
  }
}

class Stories {
  int id;
  int sellerId;
  String file;
  String text;
  String status;

  Stories({this.id, this.sellerId, this.file, this.text, this.status});

  Stories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sellerId = json['Seller_id'];
    file = json['File'];
    text = json['Text'];
    status = json['Status'];
  }

}