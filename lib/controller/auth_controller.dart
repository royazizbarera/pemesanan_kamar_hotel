import 'package:pemesanan_kamar_hotel/controller/user_controller.dart';
import 'package:pemesanan_kamar_hotel/exception/status_code.dart';
import 'package:firebase_auth/firebase_auth.dart'
    show FirebaseAuth, FirebaseAuthException, User;
import 'package:pemesanan_kamar_hotel/model/pengguna_model.dart';

class AuthController {
  // Firebase Auth instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Signin with email and password
  Future<StatusCode> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return StatusCode.success(message: 'Berhasil masuk.');
    } on FirebaseAuthException catch (e) {
      return StatusCode.failureFirebaseAuth(e);
    } catch (e) {
      return StatusCode.failure(message: e.toString());
    }
  }

  // Signup with email and password
  Future<StatusCode> signUpWithEmailAndPassword(
      {required PenggunaModel penggunaBaru, required String password}) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(
              email: penggunaBaru.email, password: password)
          .then((value) async {
        await UserController().writeDataPenggunaBaru(penggunaBaru);
      });
      return StatusCode.success(message: 'Pendaftaran berhasil.');
    } on FirebaseAuthException catch (e) {
      return StatusCode.failureFirebaseAuth(e);
    } catch (e) {
      return StatusCode.failure(message: e.toString());
    }
  }

  // Signout
  Future<StatusCode> signOut() async {
    try {
      await _auth.signOut();
      return StatusCode.success(message: 'Berhasil keluar.');
    } on FirebaseAuthException catch (e) {
      return StatusCode.failureFirebaseAuth(e);
    } catch (e) {
      return StatusCode.failure(message: e.toString());
    }
  }

  // Get current user
  User? getCurrentUser() {
    return _auth.currentUser;
  }

  // Get current user email
  String? getCurrentUserEmail() {
    return _auth.currentUser?.email;
  }
}
