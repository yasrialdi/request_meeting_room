class DataReg {

  final String nama;
  final String username;
  final String email;
  final String divisi;
  final String password;
  final String level;


  DataReg({
    required this.nama,
    required this.username,
    required this.email,
    required this.divisi,
    required this.password,
    required this.level,
  });

  factory DataReg.fromJson(Map<String, dynamic> json) {
    return DataReg(

      nama: json['nama'],
      username: json['username'],
      email: json['email'],
      divisi: json['divisi'],
      password: json['password'],
      level: json['level'],

    );
  }
}

