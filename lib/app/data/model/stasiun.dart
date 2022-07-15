class Data {
  List<Stasiun>? stasiun;

  Data({this.stasiun});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      stasiun = <Stasiun>[];
      json['data'].forEach((v) {
        stasiun?.add(Stasiun.fromJson(v));
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

class Stasiun {
  Stasiun({
    required this.id,
    required this.namaStasiun,
  });
  late final int id;
  late final String namaStasiun;

  Stasiun.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    namaStasiun = json['nama_stasiun'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['nama_stasiun'] = namaStasiun;
    return _data;
  }
}
