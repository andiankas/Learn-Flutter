// To parse this JSON data, do
//
//     final kategoriKampus = kategoriKampusFromJson(jsonString);

import 'dart:convert';

List<KategoriKampus> kategoriKampusFromJson(String str) => new List<KategoriKampus>.from(json.decode(str).map((x) => KategoriKampus.fromJson(x)));

String kategoriKampusToJson(List<KategoriKampus> data) => json.encode(new List<dynamic>.from(data.map((x) => x.toJson())));

class KategoriKampus {
  String idCategory;
  String namaCategory;
  String gbrCategory;
  String deskripsi;

  KategoriKampus({
    this.idCategory,
    this.namaCategory,
    this.gbrCategory,
    this.deskripsi,
  });

  factory KategoriKampus.fromJson(Map<String, dynamic> json) => new KategoriKampus(
    idCategory: json["id_category"],
    namaCategory: json["nama_category"],
    gbrCategory: json["gbr_category"],
    deskripsi: json["deskripsi"],
  );

  Map<String, dynamic> toJson() => {
    "id_category": idCategory,
    "nama_category": namaCategory,
    "gbr_category": gbrCategory,
    "deskripsi": deskripsi,
  };
}
