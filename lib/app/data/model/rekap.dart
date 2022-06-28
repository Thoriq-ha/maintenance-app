class Data {
  List<Rekap>? rekap;

  Data({this.rekap});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      rekap = <Rekap>[];
      json['data'].forEach((v) {
        rekap?.add(Rekap.fromJson(v));
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
  String? namaAlat;

  Rekap({this.year, this.month, this.totalChecking, this.namaAlat});

  Rekap.fromJson(Map<String, dynamic> json) {
    year = json['year'];
    month = json['month'];
    totalChecking = json['total_checking'];
    namaAlat = json['nama_alat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['year'] = this.year;
    data['month'] = this.month;
    data['total_checking'] = this.totalChecking;
    data['nama_alat'] = this.namaAlat;
    return data;
  }
}
