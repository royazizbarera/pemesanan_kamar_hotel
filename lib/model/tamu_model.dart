// class TamuModel {
//   // Atribut
//   String nik;
//   String nama;
//   String alamat;
//   String noHp;
//   String email;

//   // Konstruktor
//   TamuModel({
//     required this.nik,
//     required this.nama,
//     required this.alamat,
//     required this.noHp,
//     required this.email,
//   });

//   // Method untuk mengonversi objek Tamu menjadi Map<String, dynamic>
//   Map<String, dynamic> toMap() {
//     return {
//       'nik': nik,
//       'nama': nama,
//       'alamat': alamat,
//       'noHp': noHp,
//       'email': email,
//     };
//   }

//   // Method untuk mengonversi data dari Firestore menjadi objek Tamu
//   factory TamuModel.fromMap(Map<String, dynamic> map) {
//     return TamuModel(
//       nik: map['nik'],
//       nama: map['nama'],
//       alamat: map['alamat'],
//       noHp: map['noHp'],
//       email: map['email'],
//     );
//   }
// }
