// To parse this JSON data, do
//
//     final modelDataKampus = modelDataKampusFromJson(jsonString);

import 'dart:convert';

ModelDataKampus modelDataKampusFromJson(String str) => ModelDataKampus.fromJson(json.decode(str));

String modelDataKampusToJson(ModelDataKampus data) => json.encode(data.toJson());

class ModelDataKampus {
  List<Datum> data;

  ModelDataKampus({
    this.data,
  });

  factory ModelDataKampus.fromJson(Map<String, dynamic> json) => new ModelDataKampus(
    data: new List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": new List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  String namaCampus;
  String namaRektor;
  String jmlStaff;
  String jmlMahasiswa;
  String lokasi;
  String situsWeb;
  String gbrCampus;

  Datum({
    this.namaCampus,
    this.namaRektor,
    this.jmlStaff,
    this.jmlMahasiswa,
    this.lokasi,
    this.situsWeb,
    this.gbrCampus,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => new Datum(
    namaCampus: json["nama_campus"],
    namaRektor: json["nama_rektor"],
    jmlStaff: json["jml_staff"],
    jmlMahasiswa: json["jml_mahasiswa"],
    lokasi: json["lokasi"],
    situsWeb: json["situs_web"],
    gbrCampus: json["gbr_campus"],
  );

  Map<String, dynamic> toJson() => {
    "nama_campus": namaCampus,
    "nama_rektor": namaRektor,
    "jml_staff": jmlStaff,
    "jml_mahasiswa": jmlMahasiswa,
    "lokasi": lokasi,
    "situs_web": situsWeb,
    "gbr_campus": gbrCampus,
  };
}
