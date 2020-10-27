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
  
  int sellerId;
  String file;
  String text;
 

  Stories({this.sellerId, this.file, this.text});

  Stories.fromJson(Map<String, dynamic> json) {
 
    sellerId = json['Seller'];
    file = json['File'];
    text = json['Text'];
 
  }

}