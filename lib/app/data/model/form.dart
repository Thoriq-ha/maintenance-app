class DataForm {
  DataForm({
    required this.id,
    required this.namaJenisItem,
    required this.golongans,
  });
  int? id;
  String? namaJenisItem;
  List<Golongans>? golongans;

  DataForm.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaJenisItem = json['nama_jenis_item'];
    golongans =
        List.from(json['golongans']).map((e) => Golongans.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['nama_jenis_item'] = namaJenisItem;
    _data['golongans'] = golongans?.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Golongans {
  Golongans({
    required this.id,
    required this.jenisItemId,
    required this.namaGolongan,
    required this.items,
  });
  late final int id;
  late final String jenisItemId;
  late final String namaGolongan;
  late final List<Items> items;

  Golongans.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jenisItemId = json['jenis_item_id'];
    namaGolongan = json['nama_golongan'];
    items = List.from(json['items']).map((e) => Items.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['jenis_item_id'] = jenisItemId;
    _data['nama_golongan'] = namaGolongan;
    _data['items'] = items.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Items {
  Items({
    required this.id,
    required this.golonganJenisItemId,
    required this.namaItem,
    required this.tag,
  });
  late final int id;
  late final String golonganJenisItemId;
  late final String namaItem;
  late final String standar;
  late final String tag;

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    golonganJenisItemId = json['golongan_jenis_item_id'];
    namaItem = json['nama_item'];
    standar = json['standar'];
    tag = json['tag'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['golongan_jenis_item_id'] = golonganJenisItemId;
    _data['nama_item'] = namaItem;
    _data['standar'] = standar;
    _data['tag'] = tag;
    return _data;
  }
}
