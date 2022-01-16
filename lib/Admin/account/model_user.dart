import 'package:intl/intl.dart';

class DataUser {
  final String id;
  final String nama;
  final String username;
  final String email;
  final String divisi;
  final String password;
  final String level;


  DataUser({
    required this.id,
    required this.nama,
    required this.username,
    required this.email,
    required this.divisi,
    required this.password,
    required this.level,
  });

  // factory DataUser.fromJson(Map<String, dynamic> json) {
  //   return DataUser(
  //     nama: json['nama'],
  //     username: json['username'],
  //     email: json['email'],
  //     divisi: json['divisi'],
  //     level: json['level'],
  //   );
  // }

  factory DataUser.fromJson(Map<String, dynamic> json) {
    return DataUser(
      id: json['id'],
      nama: json['nama'],
      username: json['username'],
      email: json['email'],
      divisi: json['divisi'],
      password: json['password'],
      level: json['level'],
    );
  }
}
