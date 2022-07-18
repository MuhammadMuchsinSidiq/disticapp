class GaleriModel {
  int? id;
  String? url_iamges;

  GaleriModel({
    this.id,
    this.url_iamges,
  });

  GaleriModel.fromjson(Map<String, dynamic> json) {
    id = json['id'];
    url_iamges = json['url_images'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'url_images': url_iamges,
    };
  }
}
