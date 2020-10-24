class States {
  int id;
  String name;
  int number;

  States({this.id, this.name, this.number});

  States.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['Name'];
    number = json['number'];
  }
}