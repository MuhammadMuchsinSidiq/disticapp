import 'package:flutter/foundation.dart';

class KategoriModel {
  int? id;
  String? nama_kategori;

  KategoriModel({this.id, this.nama_kategori});

  KategoriModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama_kategori = json['nama_kategori'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': nama_kategori,
    };
  }
}
