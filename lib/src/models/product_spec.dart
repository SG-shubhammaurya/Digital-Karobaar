class Specification {
  List<Specs> specs;
  List<String> highlights;
  List<String> features;

  Specification({this.specs, this.highlights, this.features});

  Specification.fromJson(Map<String, dynamic> json) {
    if (json['specs'] != null) {
      specs = new List<Specs>();
      json['specs'].forEach((v) {
        specs.add(new Specs.fromJson(v));
      });
    }
    highlights = json['highlights'].cast<String>();
    features = json['features'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.specs != null) {
      data['specs'] = this.specs.map((v) => v.toJson()).toList();
    }
    data['highlights'] = this.highlights;
    data['features'] = this.features;
    return data;
  }
}

class Specs {
  int id;
  int productId;
  String title;
  String description;

  Specs({this.id, this.productId, this.title, this.description});

  Specs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['Product_id'];
    title = json['Title'];
    description = json['Description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Product_id'] = this.productId;
    data['Title'] = this.title;
    data['Description'] = this.description;
    return data;
  }
}