class CatResponse {
  List<dynamic>? breeds;
  List<Categories>? categories;
  String? id;
  String? url;
  int? width;
  int? height;

  CatResponse(
      {this.breeds,
        this.categories,
        this.id,
        this.url,
        this.width,
        this.height});

  CatResponse.fromJson(Map<String, dynamic> json) {
    if (json['breeds'] != null) {
      breeds = <dynamic>[];
      json['breeds'].forEach((v) {
        breeds!.add(v);
      });
    }
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
    id = json['id'];
    url = json['url'];
    width = json['width'];
    height = json['height'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.breeds != null) {
      data['breeds'] = this.breeds!.map((v) => v.toJson()).toList();
    }
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    data['id'] = this.id;
    data['url'] = this.url;
    data['width'] = this.width;
    data['height'] = this.height;
    return data;
  }
}

class Categories {
  int? id;
  String? name;

  Categories({this.id, this.name});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}