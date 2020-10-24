class TermCondition {
  int id;
  String terms;
  String privacy;

 TermCondition({this.id, this.terms, this.privacy});

  TermCondition.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    terms = json['Terms'];
    privacy = json['Privacy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Terms'] = this.terms;
    data['Privacy'] = this.privacy;
    return data;
  }
}