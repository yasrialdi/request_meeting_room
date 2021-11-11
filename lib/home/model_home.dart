import 'package:intl/intl.dart';

DateFormat formatter = DateFormat('yyyy-MM-dd');

class DataHome {

  final String id;
  final String judul;
  final String ruang;
  final String mulai;
  final String selesai;
  final String jml_peserta;
  final String catatan;
  final String foto;

  DataHome({

    required this.id,
    required this.judul,
    required this.ruang,
    required this.mulai,
    required this.selesai,
    required this.jml_peserta,
    required this.catatan,
    required this.foto,
  });

  factory DataHome.fromJson(Map<String, dynamic> json) {
    return DataHome(

      id: json['id_booking'],
      judul: json['judul_meeting'],
      ruang: json['ruang_meeting'],
      mulai: json['mulai'] != null
          ? DateFormat('EEEE, d MMMM y HH:mm').format(DateTime.parse(json['mulai'].toString())) : "",
      selesai: json['selesai'] != null
          ? DateFormat('EEEE, d MMMM y HH:mm').format(DateTime.parse(json['selesai'].toString())) : "",
      jml_peserta: json['jumlah_peserta'],
      catatan: json['catatan'],
      foto: json['foto_room'],
    );
  }
}