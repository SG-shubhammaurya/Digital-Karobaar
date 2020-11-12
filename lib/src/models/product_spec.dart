class Specification {
  List<Specs> specs = [];
  List<Highlights> highlights = [];
  List<Features> features = [];

  Specification({this.specs, this.highlights, this.features});

  Specification.fromJson(Map<String, dynamic> json) {
    if (json['specs'] != null) {
      specs = new List<Specs>();
      json['specs'].forEach((v) {
        specs.add(new Specs.fromJson(v));
      });
    }
    if (json['highlights'] != null) {
      highlights = new List<Highlights>();
      json['highlights'].forEach((v) {
        highlights.add(Highlights.fromJson(v));
      });
    }
    if (json['features'] != null) {
      features = List<Features>();
      json['features'].forEach((v) {
        features.add(Features.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.specs != null) {
      data['specs'] = this.specs.map((v) => v.toJson()).toList();
    }
    if (this.highlights != null) {
      data['highlights'] = this.highlights.map((v) => v.toJson()).toList();
    }
    if (this.features != null) {
      data['features'] = this.features.map((v) => v.toJson()).toList();
    }
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

class Highlights {
  int id;
  int productId;
  String title;
  String description;

  Highlights({this.id, this.productId, this.title, this.description});

  Highlights.fromJson(Map<String, dynamic> json) {
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

class Features {
  int id;
  int productId;
  String title;
  String description;

  Features({this.id, this.productId, this.title, this.description});

  Features.fromJson(Map<String, dynamic> json) {
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
