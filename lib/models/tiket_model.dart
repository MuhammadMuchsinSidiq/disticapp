import 'package:disticapp/models/galeri_model.dart';
import 'package:disticapp/models/kategori_model.dart';

class TiketModel {
  int? id;
  String? nama_tiket;
  double? harga;
  String? deskripsi;
  String? status;
  DateTime? tgl_carter;
  String? kode;
  String? kloter;
  KategoriModel? items;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<GaleriModel>? galeri_tiket;

  TiketModel({
    this.id,
    this.nama_tiket,
    this.harga,
    this.deskripsi,
    this.status,
    this.tgl_carter,
    this.kode,
    this.kloter,
    this.items,
    this.createdAt,
    this.updatedAt,
    this.galeri_tiket,
  });

  TiketModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama_tiket = json['nama_tiket'];
    harga = double.parse(json['harga'].toString());
    deskripsi = json['deskripsi'];
    status = json['status'];
    tgl_carter = DateTime.parse(json['tgl_carter']);
    kode = json['kode'];
    kloter = json['kloter'];
    items = KategoriModel.fromJson(json['items']);
    galeri_tiket = json['galeri_tiket']
        .map<GaleriModel>((galeri_tiket) => GaleriModel.fromjson(galeri_tiket))
        .toList();
    createdAt = json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String);
    updatedAt = json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama_tiket': nama_tiket,
      'harga': harga,
      'deskripsi': deskripsi,
      'status': status,
      'tgl_carter': tgl_carter,
      'kode': kode,
      'kloter': kloter,
      'items': items?.toJson(),
      'galeri_tiket':
          galeri_tiket?.map((galeri_tiket) => galeri_tiket.toJson()).toList(),
      'createdAt': createdAt.toString(),
      'updatedAt': updatedAt.toString(),
    };
  }
}
