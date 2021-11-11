class DataTes {

  final String id;
  final String ruangan;
  final String hari;
  final String jam;
  final String gambar;

  DataTes({

    required this.id,
    required this.ruangan,
    required this.hari,
    required this.jam,
    required this.gambar,
  });

  factory DataTes.fromJson(Map<String, dynamic> json) {
    return DataTes(

      id: json['id_booking'],
      ruangan: json['ruang_meeting'],
      hari: json['mulai'],
      jam: json['selesai'],
      gambar: json['foto_room'],
    );
  }
}