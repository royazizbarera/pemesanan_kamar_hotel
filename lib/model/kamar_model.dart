import 'dart:math';

class KamarModel {
  // lokal
  int nomorKamar; // unik
  double hargaSewa;
  bool disewa;
  String tipeKamar;
  String fotoURL;
  String kapasitasKamar;

  // Konstruktor
  KamarModel({
    required this.nomorKamar,
    required this.hargaSewa,
    required this.disewa,
    required this.tipeKamar,
    required this.fotoURL,
    required this.kapasitasKamar,
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
      kapasitasKamar: map['kapasitasKamar'],
    );
  }

  // Model random
  factory KamarModel.random({int? nomorKamar}) {
    List<String> tipeKamar = ['Twin', 'King', 'Standard'];
    List<String> kamarURL = [
      'https://images.pexels.com/photos/2467285/pexels-photo-2467285.jpeg?cs=srgb&dl=pexels-julie-aagaard-2467285.jpg&fm=jpg',
      'https://images.unsplash.com/photo-1629140727571-9b5c6f6267b4?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fGhvdGVsJTIwcm9vbXxlbnwwfHwwfHx8MA%3D%3D',
      'https://images.unsplash.com/photo-1681370787860-eea901df92fe?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'https://plus.unsplash.com/premium_photo-1676319481328-21e11d1048a7?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fGJlZHJvb21zfGVufDB8fDB8fHww',
    ];
    nomorKamar ??= Random().nextInt(999);
    return KamarModel(
      nomorKamar: nomorKamar,
      hargaSewa: 100000.0 * (Random().nextInt(15) + 2) +
          100000.0 * (Random().nextInt(8)),
      disewa: Random().nextBool(),
      tipeKamar: tipeKamar[Random().nextInt(tipeKamar.length)],
      fotoURL: kamarURL[Random().nextInt(kamarURL.length)],
      kapasitasKamar: ' ${Random().nextInt(3) + 1} Orang',
    );
  }
}
