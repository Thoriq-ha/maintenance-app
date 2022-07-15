class User {
  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.nipp,
    required this.isAdmin,
    required this.isActive,
    required this.emailVerifiedAt,
  });
  late final String id;
  late final String name;
  late final String username;
  late final String email;
  late final String nipp;
  late final String isAdmin;
  late final String isActive;
  late final String emailVerifiedAt;

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    name = json['name'];
    username = json['username'];
    email = json['email'];
    nipp = json['nipp'];
    isAdmin = json['is_admin'];
    isActive = json['is_active'];
    emailVerifiedAt = json['email_verified_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['username'] = username;
    _data['email'] = email;
    _data['nipp'] = nipp;
    _data['is_admin'] = isAdmin;
    _data['is_active'] = isActive;
    _data['email_verified_at'] = emailVerifiedAt;
    return _data;
  }
}
