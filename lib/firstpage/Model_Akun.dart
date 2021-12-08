import 'package:intl/intl.dart';

DateFormat formatter = DateFormat('yyyy-MM-dd');

class DataAkun {
  final String nama;
  final String username;
  final String email;
  final String divisi;
  final String level;

  DataAkun({
    required this.nama,
    required this.username,
    required this.email,
    required this.divisi,
    required this.level,
  });

  factory DataAkun.fromJson(Map<String, dynamic> json) {
    return DataAkun(
      nama: json['nama'],
      username: json['username'],
      email: json['email'],
      divisi: json['divisi'],
      level: json['level'],
    );
  }
}
