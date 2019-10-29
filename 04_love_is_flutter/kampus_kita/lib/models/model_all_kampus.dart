// To parse this JSON data, do
//
//     final modelAllDataKampus = modelAllDataKampusFromJson(jsonString);

import 'dart:convert';

List<ModelAllDataKampus> modelAllDataKampusFromJson(String str) => new List<ModelAllDataKampus>.from(json.decode(str).map((x) => ModelAllDataKampus.fromJson(x)));

String modelAllDataKampusToJson(List<ModelAllDataKampus> data) => json.encode(new List<dynamic>.from(data.map((x) => x.toJson())));

class ModelAllDataKampus {
  String id;
  String namaCampus;
  String namaRektor;
  String jmlMahasiswa;
  String lokasi;
  String gbrCampus;

  ModelAllDataKampus({
    this.id,
    this.namaCampus,
    this.namaRektor,
    this.jmlMahasiswa,
    this.lokasi,
    this.gbrCampus,
  });

  factory ModelAllDataKampus.fromJson(Map<String, dynamic> json) => new ModelAllDataKampus(
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
