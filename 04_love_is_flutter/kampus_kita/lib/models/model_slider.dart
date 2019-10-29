// To parse this JSON data, do
//
//     final modelSliderKampus = modelSliderKampusFromJson(jsonString);

import 'dart:convert';

List<ModelSliderKampus> modelSliderKampusFromJson(String str) => new List<ModelSliderKampus>.from(json.decode(str).map((x) => ModelSliderKampus.fromJson(x)));

String modelSliderKampusToJson(List<ModelSliderKampus> data) => json.encode(new List<dynamic>.from(data.map((x) => x.toJson())));

class ModelSliderKampus {
  String id;
  String namaCampus;
  String namaRektor;
  String jmlMahasiswa;
  String lokasi;
  String gbrCampus;

  ModelSliderKampus({
    this.id,
    this.namaCampus,
    this.namaRektor,
    this.jmlMahasiswa,
    this.lokasi,
    this.gbrCampus,
  });

  factory ModelSliderKampus.fromJson(Map<String, dynamic> json) => new ModelSliderKampus(
    id: json["id"],
    namaCampus: json["nama_campus"],
    namaRektor: json["nama_rektor"],
    jmlMahasiswa: json["jml_mahasiswa"],
    lokasi: json["lokasi"],
    gbrCampus: json["gbr_campus"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nama_campus": namaCampus,
    "nama_rektor": namaRektor,
    "jml_mahasiswa": jmlMahasiswa,
    "lokasi": lokasi,
    "gbr_campus": gbrCampus,
  };
}
