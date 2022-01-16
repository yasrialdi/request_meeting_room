class DataRoom {
  final String id;
  final String ruang_meeting;
  final String foto_room;

  DataRoom({
    required this.id,
    required this.ruang_meeting,
    required this.foto_room,
  });

  factory DataRoom.fromJson(Map<String, dynamic> json) {
    return DataRoom(
      id: json['id'],
      ruang_meeting: json['ruang_meeting'],
      foto_room: json['foto_room'],
    );
  }
}