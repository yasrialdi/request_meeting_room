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
  final DateTime mulaiDateTime;
  final DateTime selesaiDateTime;

  DataHome({
    required this.id,
    required this.judul,
    required this.ruang,
    required this.mulai,
    required this.selesai,
    required this.jml_peserta,
    required this.catatan,
    required this.foto,
    required this.mulaiDateTime,
    required this.selesaiDateTime,
  });

  factory DataHome.fromJson(Map<String, dynamic> json) {
    DateTime parsedMulai = DateTime.parse(json['mulai']);
    DateTime parsedSelesai = DateTime.parse(json['selesai']);

    return DataHome(
      id: json['id_booking'],
      judul: json['judul_meeting'],
      ruang: json['ruang_meeting'],
      mulai: json['mulai'] != null
          ? DateFormat('EEEE, d MMMM y HH:mm').format(parsedMulai)
          : "",
      selesai: json['selesai'] != null
          ? DateFormat('EEEE, d MMMM y HH:mm').format(parsedSelesai)
          : "",
      jml_peserta: json['jumlah_peserta'],
      catatan: json['catatan'],
      foto: json['foto_room'],
      mulaiDateTime: parsedMulai,
      selesaiDateTime: parsedSelesai,
    );
  }

  static List<DataHome> fromJsonToList(dynamic json) {
    List<DataHome> list = [];

    for (Map<String, dynamic> item in json) {
      DateTime parsedMulai = DateTime.parse(item['mulai']);
      DateTime parsedSelesai = DateTime.parse(item['selesai']);

      list.add(DataHome(
        id: item['id_booking'],
        judul: item['judul_meeting'],
        ruang: item['ruang_meeting'],
        mulai: item['mulai'] != null
            ? DateFormat('yyyy-MM-dd').format(parsedMulai)
            : "",
        selesai: item['selesai'] != null
            ? DateFormat('EEEE, d MMMM y HH:mm').format(parsedSelesai)
            : "",
        jml_peserta: item['jumlah_peserta'],
        catatan: item['catatan'],
        foto: item['foto_room'],
        mulaiDateTime: parsedMulai,
        selesaiDateTime: parsedSelesai,
      ));
    }

    return list;
  }
}
