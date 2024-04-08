import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pemesanan_kamar_hotel/exception/status_code.dart';
import 'package:pemesanan_kamar_hotel/model/pengguna_model.dart';
import 'package:pemesanan_kamar_hotel/model/tamu_model.dart';

class UserController {
  // Firestore instance
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _penggunaCollection = 'pengguna';

  // write user data
  Future<StatusCode> writeDataPenggunaBaru(PenggunaModel penggunaBaru) async {
    try {
      await _firestore
          .collection(_penggunaCollection)
          .doc(penggunaBaru.email)
          .set(
            penggunaBaru.toMap(),
          );
      return StatusCode.success(message: 'Pendaftaran berhasil.');
    } catch (e) {
      throw StatusCode.failure(message: e.toString());
    }
  }

  // read user data
  Future<PenggunaModel?> readDataPenggunaByEmail(String email) async {
    try {
      await _firestore
          .collection(_penggunaCollection)
          .doc(email)
          .get()
          .then((value) {
        final Map<String, dynamic>? data = value.data();
        if (data == null) return null;
        return PenggunaModel.fromMap(data);
      });
      throw StatusCode.failure();
    } catch (e) {
      throw StatusCode.failure();
    }
  }

  // Add tamu to user
  Future<StatusCode> addTamuToUser(String email, TamuModel tamu) async {
    try {
      await _firestore
          .collection(_penggunaCollection)
          .doc(email)
          .update({
            'tamu': FieldValue.arrayUnion([tamu.toMap()]),
          });
      return StatusCode.success(message: 'Berhasil menambahkan tamu.');
    } catch (e) {
      throw StatusCode.failure(message: e.toString());
    }
  }
}
