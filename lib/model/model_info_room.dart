class DataRoom {

  final String ruang_meeting;
  final String foto_room;

  DataRoom({

    required this.ruang_meeting,
    required this.foto_room,
  });

  factory DataRoom.fromJson(Map<String, dynamic> json) {
    return DataRoom(

      ruang_meeting: json['ruang_meeting'],
      foto_room: json['foto_room'],
    );
  }
}