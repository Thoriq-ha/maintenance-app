class Data {
  List<Riwayat>? stasiun;

  Data({this.stasiun});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      stasiun = <Riwayat>[];
      json['data'].forEach((v) {
        stasiun?.add(Riwayat.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (stasiun != null) {
      data['data'] = stasiun?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Riwayat {
  int? id;
  String? namaWeselAtauSinyal;
  String? mingguke;
  String? createdAt;
  String? updatedAt;
  String? hasilPenilaian;

  Riwayat(
      {this.id,
      this.namaWeselAtauSinyal,
      this.mingguke,
      this.createdAt,
      this.updatedAt,
      this.hasilPenilaian});

  Riwayat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaWeselAtauSinyal = json['nama_wesel_atau_sinyal'];
    mingguke = json['mingguke'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    hasilPenilaian = json['hasil_penilaian'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['nama_wesel_atau_sinyal'] = namaWeselAtauSinyal;
    data['mingguke'] = mingguke;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['hasil_penilaian'] = hasilPenilaian;
    return data;
  }
}
