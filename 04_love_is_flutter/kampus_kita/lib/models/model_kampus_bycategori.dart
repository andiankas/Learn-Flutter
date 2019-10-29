// To parse this JSON data, do
//
//     final modelKampusByIdCat = modelKampusByIdCatFromJson(jsonString);

import 'dart:convert';

List<ModelKampusByIdCat> modelKampusByIdCatFromJson(String str) => new List<ModelKampusByIdCat>.from(json.decode(str).map((x) => ModelKampusByIdCat.fromJson(x)));

String modelKampusByIdCatToJson(List<ModelKampusByIdCat> data) => json.encode(new List<dynamic>.from(data.map((x) => x.toJson())));

class ModelKampusByIdCat {
  String id;
  String namaCampus;
  String namaRektor;
  String jmlMahasiswa;
  String lokasi;
  String julukan;
  String situsWeb;
  String namaCategory;
  String gbrCategory;
  String deskripsi;
  String gbrCampus;

  ModelKampusByIdCat({
    this.id,
    this.namaCampus,
    this.namaRektor,
    this.jmlMahasiswa,
    this.lokasi,
    this.julukan,
    this.situsWeb,
    this.namaCategory,
    this.gbrCategory,
    this.deskripsi,
    this.gbrCampus,
  });

  factory ModelKampusByIdCat.fromJson(Map<String, dynamic> json) => new ModelKampusByIdCat(
    id: json["id"],
    namaCampus: json["nama_campus"],
    namaRektor: json["nama_rektor"],
    jmlMahasiswa: json["jml_mahasiswa"],
    lokasi: json["lokasi"],
    julukan: json["julukan"],
    situsWeb: json["situs_web"],
    namaCategory: json["nama_category"],
    gbrCategory: json["gbr_category"],
    deskripsi: json["deskripsi"],
    gbrCampus: json["gbr_campus"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nama_campus": namaCampus,
    "nama_rektor": namaRektor,
    "jml_mahasiswa": jmlMahasiswa,
    "lokasi": lokasi,
    "julukan": julukan,
    "situs_web": situsWeb,
    "nama_category": namaCategory,
    "gbr_category": gbrCategory,
    "deskripsi": deskripsi,
    "gbr_campus": gbrCampus,
  };
}
