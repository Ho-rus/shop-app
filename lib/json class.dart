class shoplist {

  List duck = [];
  shoplist.fromJson(json) {
    json.forEach((element) {
      duck!.add(shopmodel.fromJson(element));
    });
  }
}

class shopmodel {
  int? id;
  String? title;
  dynamic price;
  String? des;
  String? ctg;
  String? img;

  shopmodel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    des = json['description'];
    img = json['image'];
    ctg = json['category'];
  }
}
