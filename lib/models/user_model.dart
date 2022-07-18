class UserModel {
  int? id;
  String? name;
  String? username;
  String? email;
  String? phone_number;
  String? photo_url;
  String? token;

  UserModel({
    this.id,
    this.name,
    this.username,
    this.email,
    this.phone_number,
    this.photo_url,
    this.token,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    phone_number = json['phone_number'];
    photo_url = json['photo_url'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'email': email,
      'phone_number': phone_number,
      'photo_url': photo_url,
      'token': token
    };
  }
}
