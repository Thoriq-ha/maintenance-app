class Data {
  List<Rekap>? rekap;

  Data({this.rekap});

  Data.fromJson(Map<String, dynamic> json, String stasiun) {
    if (json['data'] != null) {
      rekap = <Rekap>[];
      json['data'].forEach((v) {
        if (v['nama_stasiun'] == stasiun) {
          rekap?.add(Rekap.fromJson(v));
        }
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (rekap != null) {
      data['data'] = rekap?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Rekap {
  String? year;
  String? month;
  String? totalChecking;
  String? tipe;
  String? namaWeselOrSinyal;
  String? namaStasiun;

  Rekap(
      {this.year,
      this.month,
      this.totalChecking,
      this.tipe,
      this.namaWeselOrSinyal,
      this.namaStasiun});

  Rekap.fromJson(Map<String, dynamic> json) {
    year = json['year'];
    month = json['month'];
    totalChecking = json['total_checking'];
    tipe = json['tipe'];
    namaWeselOrSinyal = json['nama_wesel_or_sinyal'];
    namaStasiun = json['nama_stasiun'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['year'] = year;
    data['month'] = month;
    data['total_checking'] = totalChecking;
    data['tipe'] = tipe;
    data['nama_wesel_or_sinyal'] = namaWeselOrSinyal;
    data['nama_stasiun'] = namaStasiun;
    return data;
  }
}
