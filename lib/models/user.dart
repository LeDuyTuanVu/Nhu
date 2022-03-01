class User {
  late String name;
  late String img;
  late String email;
  late String id;

  User({
    required this.name,
    required this.img,
    required this.email,
    required this.id,
  });

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    img = json['img'];
    email = json['email'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = name;
    data['img'] = img;
    data['email'] = email;
    data['id'] = id;
    return data;
  }
}
