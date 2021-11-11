class DataAdd {

  final String judul;
  final String ruangan;
  final String mulai;
  final String selesai;
  final int jumlah;
  final String catatan;

  DataAdd({


    required this.judul,
    required this.ruangan,
    required this.mulai,
    required this.selesai,
    required this.jumlah,
    required this.catatan,
  });

  factory DataAdd.fromJson(Map<String, dynamic> json) {
    return DataAdd(

      judul: json['judul_meeting'],
      ruangan: json['ruang_meeting'],
      mulai: json['mulai'],
      selesai: json['selesai'],
      jumlah: json['jumlah_peserta'],
      catatan: json['catatan'],
    );
  }
}