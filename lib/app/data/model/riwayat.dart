class Data {
  List<Riwayat>? riwayat;

  Data({this.riwayat});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      riwayat = <Riwayat>[];
      json['data'].forEach((v) {
        riwayat?.add(Riwayat.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (riwayat != null) {
      data['data'] = riwayat?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Riwayat {
  int? id;
  String? tipe;
  String? namaWeselOrSinyal;
  String? namaStasiun;
  String? hasilPenilaian;

  Riwayat(
      {this.id,
      this.tipe,
      this.namaWeselOrSinyal,
      this.namaStasiun,
      this.hasilPenilaian});

  Riwayat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tipe = json['tipe'];
    namaWeselOrSinyal = json['nama_wesel_or_sinyal'];
    namaStasiun = json['nama_stasiun'];
    hasilPenilaian = json['hasil_penilaian'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['tipe'] = tipe;
    data['nama_wesel_or_sinyal'] = namaWeselOrSinyal;
    data['nama_stasiun'] = namaStasiun;
    data['hasil_penilaian'] = hasilPenilaian;
    return data;
  }
}
