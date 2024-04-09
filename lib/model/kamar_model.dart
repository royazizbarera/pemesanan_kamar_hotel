class KamarModel {
  // lokal
  int nomorKamar; // unik
  double hargaSewa;
  bool disewa;
  String tipeKamar;
  String fotoURL;

  // Konstruktor
  KamarModel({
    required this.nomorKamar,
    required this.hargaSewa,
    required this.disewa,
    required this.tipeKamar,
    required this.fotoURL,
  });

  // Method untuk mengonversi objek KamarModel menjadi Map<String, dynamic>
  Map<String, dynamic> toMap() {
    return {
      'nomorKamar': nomorKamar,
      'hargaSewa': hargaSewa,
      'disewa': disewa,
      'tipeKamar': tipeKamar,
      'fotoURL': fotoURL,
    };
  }

  // Method untuk mengonversi data dari Firestore menjadi objek KamarModel
  factory KamarModel.fromMap(Map<String, dynamic> map) {
    return KamarModel(
      nomorKamar: map['nomorKamar'],
      hargaSewa: map['hargaSewa'],
      disewa: map['disewa'],
      tipeKamar: map['tipeKamar'],
      fotoURL: map['fotoURL'],
    );
  }
}
