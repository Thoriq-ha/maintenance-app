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
    required this.userId,
    required this.namaStasiun,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String userId;
  late final String namaStasiun;
  late final String createdAt;
  late final String updatedAt;

  Stasiun.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    userId = json['user_id'];
    namaStasiun = json['nama_stasiun'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['user_id'] = userId;
    _data['nama_stasiun'] = namaStasiun;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}
